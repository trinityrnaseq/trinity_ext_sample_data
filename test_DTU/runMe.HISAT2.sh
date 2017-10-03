#!/bin/bash

set -ev

ALIGNER="HISAT2"

###########################
# run given the mini-genome

../../Analysis/SuperTranscripts/DTU/dexseq_wrapper.pl --genes_fasta minigenome.fa --genes_gtf minigenome.gtf --samples_file samples.txt --out_prefix G --aligner ${ALIGNER}

rm -f ./*.ok


################################
# run given the supertranscripts

../../Analysis/SuperTranscripts/Trinity_gene_splice_modeler.py  --trinity_fasta mini.Trinity_fmt.fasta --out_prefix trinSuper

../../Analysis/SuperTranscripts/DTU/dexseq_wrapper.pl --genes_fasta trinSuper.fasta --genes_gtf trinSuper.gtf --samples_file samples.txt --out_prefix S --aligner ${ALIGNER}

./compare_dexseq_results.pl G.results.dat S.results.dat > compare.dat

./plot_comparison.Rscript

