#!/bin/bash

set -ev

aligner=$1

if [ -z ${aligner} ]; then
    echo
    echo "usage: $0 STAR|HISAT2"
    echo
    exit 1
fi

../../Analysis/SuperTranscripts/DTU/dexseq_wrapper.pl --genes_fasta minigenome.fa --genes_gtf minigenome.gtf --samples_file samples.txt --out_prefix ${aligner}-G --aligner ${aligner}


../../Analysis/SuperTranscripts/Trinity_gene_splice_modeler.py  --trinity_fasta mini.Trinity_fmt.fasta --out_prefix trinSuper

../../Analysis/SuperTranscripts/DTU/dexseq_wrapper.pl --genes_fasta trinSuper.fasta --genes_gtf trinSuper.gtf --samples_file samples.txt --out_prefix ${aligner}-S --aligner ${aligner}

./compare_dexseq_results.pl ${aligner}-G.dexseq.results.dat ${aligner}-S.dexseq.results.dat > ${aligner}-compare.dat

./plot_comparison.Rscript ${aligner}-compare.dat

