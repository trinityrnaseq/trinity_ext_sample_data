#!/bin/bash

set -ex

aligner=$1

if [ -z ${aligner} ]; then
    echo
    echo "usage: $0 STAR|HISAT2"
    echo
    exit 1
fi

../../Analysis/SuperTranscripts/DTU/dexseq_wrapper.pl --genes_fasta minigenome.fa --genes_gtf minigenome.gtf --samples_file samples.txt --out_prefix ${aligner}-G --aligner ${aligner}


../../Analysis/SuperTranscripts/Trinity_gene_splice_modeler.py  --trinity_fasta mini.Trinity_fmt.fasta --out_prefix trinSuper --no_squeeze --no_refinement

../../Analysis/SuperTranscripts/DTU/dexseq_wrapper.pl --genes_fasta trinSuper.fasta --genes_gtf trinSuper.gtf --samples_file samples.txt --out_prefix ${aligner}-S --aligner ${aligner}

./compare_dexseq_results.pl ${aligner}-G.dexseq.results.dat ${aligner}-S.dexseq.results.dat > ${aligner}-compare.dat

cat ${aligner}-compare.dat | perl -lane '@x = split(/\t/); push (@x, abs(log($x[1]+1e-50) - log($x[3]+1e-50))); print join("\t", @x);' | sort -k 6,6g > ${aligner}-compare.dat.delta

./plot_comparison.Rscript ${aligner}-compare.dat

# require at least min 0.95 correlation between genome and supertranscript based analysis
./test_for_cor.sh ${aligner}-compare.dat.cor 0.95
