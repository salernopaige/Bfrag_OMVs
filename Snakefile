## OMV Processing for BFT counts
# All the important snakemake options are recorded in cluster_params/config.yaml
# Usage:
# snakemake --profile slurm

import re
from pathlib import Path
import logging

configfile: "config.yaml"

indir = Path(config["indir"])
outdir = Path(config["outdir"])

if config["samples_sub"] is not None:
    SAMPLES = config["samples_sub"]
elif config["samples_dir_regex"] is not None:
    SAMPLES = [x.name for x in Path(indir).glob(config["samples_dir_regex"]) if x.is_dir()]
else:
    SAMPLES = [x.name for x in Path(indir).glob("*") if x.is_dir()]
if config["samples_ignore"] is not None:
    SAMPLES = [x for x in SAMPLES if x not in config["samples_ignore"]]
assert len(SAMPLES) != 0, "Could not find any samples"

rule all:
    input:
        expand("%s/{sample}/{sample}_R1.qc.humanDecontaminated.fastq.gz" %(indir), sample=SAMPLES),
        expand("%s/{sample}/{sample}_R2.qc.humanDecontaminated.fastq.gz" %(indir), sample=SAMPLES),
        expand("%s/counts_{DB_name}_combined.csv" %(outdir), DB_name=config["DB_name"])

# Makes links to the base library so that they are named consistently with the folder names
# Snakemake works really well if we have files that go {sample}/{sample}.fastq.gz
rule make_read_links:
    input:
        dir=ancient("%s/{sample}/" %(indir))
    output:
        R1="%s/{sample}/{sample}_R1.fastq.gz" %(indir),
        R2="%s/{sample}/{sample}_R2.fastq.gz" %(indir)
    run:
        infiles_R1 = list(Path(input.dir).glob("*%s*.fastq.gz" %(config["original_files_R1_identifier"])))
        infiles_R1 = [x for x in infiles_R1 if ".qc." not in str(x)]
        assert len(infiles_R1) == 1, "There should be exactly 1 R1.fastq.gz file, I found {}".format(len(infiles_R1))
        infiles_R2 = list(Path(input.dir).glob("*%s*.fastq.gz" %(config["original_files_R1_identifier"].replace("1","2"))))
        infiles_R2 = [x for x in infiles_R2 if ".qc." not in str(x)]
        assert len(infiles_R2) == 1, "There should be exactly 1 R2.fastq.gz file, I found {}".format(len(infiles_R2))
        shell("ln -s %s {output.R1}" %(infiles_R1[0]))
        shell("ln -s %s {output.R2}" %(infiles_R2[0]))


# Does some quality filtering and removes adaptors
# The sequencing center might have already removed the adaptors, but it dosen't hurt to be sure
# See the config.yaml for a description of the bbduk qc paramters
rule qc_filter_remove_adaptors:
    input:
        R1="%s/{sample}/{sample}_R1.fastq.gz" %(indir),
        R2="%s/{sample}/{sample}_R2.fastq.gz" %(indir),
    output:
        R1="%s/{sample}/{sample}_R1.qc.fastq.gz" %(indir),
        R2="%s/{sample}/{sample}_R2.qc.fastq.gz" %(indir),
        qhist="%s/{sample}/qhist.txt" %(indir),
        lhist="%s/{sample}/lhist.txt" %(indir),
        aqhist="%s/{sample}/aqhist.txt" %(indir),
    log:
        filter_stats="%s/{sample}/QualityFiltering_Stats_bbduk.txt" %(indir)
    params:
        qtrim=config["qtrim"],
        quality=config["quality"],
        min_len=config["read_min_len"],
        adaptors=config["adaptors"],
        cores=1,
    shell:
        "bbduk.sh -Xmx1g in={input.R1} in2={input.R2} out={output.R1} out2={output.R2} maq={params.quality} ref={params.adaptors} qtrim={params.qtrim} trimq={params.quality} minlength={params.min_len} tpe tbo qhist={output.qhist} lhist={output.lhist} aqhist={output.aqhist} overwrite=t threads={params.cores} 2> {log.filter_stats}"
        # If you put this into a run: with a shell() it will complain about exitcode != 0 when you use 2> {log}
        #             # See https://snakemake.readthedocs.io/en/stable/project_info/faq.html#my-shell-command-fails-with-exit-code-0-from-within-a-pipe-what-s-wrong


# Requires a bunch of ram, and you need to specify it with the string -Xmx27g
# https://github.com/BioInfoTools/BBMap/blob/master/README.md
rule remove_human:
    input:
        R1="%s/{sample}/{sample}_R1.qc.fastq.gz" %(indir),
        R2="%s/{sample}/{sample}_R2.qc.fastq.gz" %(indir)
    output:
        R1="%s/{sample}/{sample}_R1.qc.humanDecontaminated.fastq.gz" %(indir),
        R1_Human="%s/{sample}/{sample}_R1.qc.humanReads.fastq.gz" %(indir),
        R2="%s/{sample}/{sample}_R2.qc.humanDecontaminated.fastq.gz" %(indir),
        R2_Human="%s/{sample}/{sample}_R2.qc.humanReads.fastq.gz" %(indir),
    resources:
        mem="32G",
        cpus=config["n_cores"]
    params:
        human=config["human_genome"],
        cores=config["n_cores"]
    run:
        # Following the parameters from http://seqanswers.com/forums/showthread.php?t=42552
        shell("bbmap.sh minid=0.95 maxindel=3 bwr=0.16 bw=12 quickmatch fast minhits=2 ref={params.human} -Xmx32g in={input.R1} outu={output.R1} outm={output.R1_Human} in2={input.R2} outu2={output.R2} outm2={output.R2_Human} threads={params.cores}")


def input_reads(wildcards):
    if config["mode"] == "pe":
        return {'R1':str(indir) + "/{wildcards.sample}/{wildcards.sample}_R1.qc.humanDecontaminated.fastq.gz".format(wildcards=wildcards), 'R2': str(indir) + "/{wildcards.sample}/{wildcards.sample}_R2.qc.humanDecontaminated.fastq.gz".format(wildcards=wildcards)}
    elif config["mode"] == "se":
        return {'R1':str(indir) + "/{wildcards.sample}/{wildcards.sample}_R1.qc.humanDecontaminated.fastq.gz".format(wildcards=wildcards)}

# Runs bowtie against the file in config.DB_path
# This assumes that config.DB_path is a fasta file seqs.fasta or seqs.fa and that you made a bowtie database like so: bowtie2-build seqs.fa seqs
rule bowtie:
    input:
        unpack(input_reads)
    output:
        "%s/{sample}/{sample}_Bowtie_{DB_name,[A-Za-z0-9]+}.sam" %(outdir)
    params:
        N_MISMATCH = config["n_mismatch"],
        n_cores=config["n_cores"]
    resources:
        mem="8G",
        cpus=config["n_cores"]
    run:
        # Remove the extension
        infile_db = re.sub("\.[A-Za-z0-9]+","",config["DB_path"])
        # The awk line removes unmapped reads, saving a huge amount of space
        shell("bowtie2 -a -N {params.N_MISMATCH} -p {params.n_cores} -x %s -U <(zcat {input.R1})| awk -F \"\\t\" '$3 != \"*\"' > {output}" %(infile_db))

# Combines the individual sam files into a csv of counts mapping to different genes
rule bowtie_combine:
    input:
        expand("%s/{sample}/{sample}_Bowtie_{{DB_name}}.sam" %(outdir), sample = SAMPLES),
    output:
        "%s/%s_counts_{DB_name,[A-Za-z0-9]+}_combined.csv" %(outdir, config["expt_name"])
    log:
        "%s/bowtie_combined_{DB_name}_log.txt" %(outdir)
    run:
        #log the parameters for ease of writing papers

        logging.info("parameters used")
        logging.info("qtrim={}".format(config["qtrim"])),
        logging.info("quality={}".format(config["quality"])),
        logging.info("read_min_len={}".format(config["read_min_len"])),
        logging.info("adaptors={}".format(config["adaptors"])),
        logging.info("n_mismatch={}".format(config["n_mismatch"])),

        shell("python Lib/parse_SAM.py {input} -f %s -o {output}" %(config["DB_path"]))

rule bowtie_all:
    input:
        expand("%s/%s_counts_{DB_name}_combined.csv" %(outdir, config["expt_name"]), DB_name=config["DB_name"]),


rule sam_to_bam:
    input:
        "%s/{sample}/{sample}_Bowtie_{DB_name,[A-Za-z0-9]+}.sam" %(outdir)
    output:
        "%s/{sample}/{sample}_Bowtie_{DB_name,[A-Za-z0-9]+}.bam" %(outdir)
    run:
        infile_fasta = config["DB_path"]
        shell("samtools view -b -t %s {input} > {output}" %(infile_fasta))
        shell("samtools sort {output} -o {output} -O bam")