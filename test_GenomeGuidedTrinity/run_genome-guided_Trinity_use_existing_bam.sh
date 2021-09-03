#!/bin/bash -ve

if [ -e top100k.Left.fq.gz ] && ! [ -e top100k.Left.fq ]
then
	gunzip -c top100k.Left.fq.gz > top100k.Left.fq
fi

if [ -e top100k.Right.fq.gz ] && ! [ -e top100k.Right.fq ]
then
	gunzip -c top100k.Right.fq.gz > top100k.Right.fq
fi



if [ -e top100k.genome.gz ] && ! [ -e top100k.genome ]
then
	gunzip -c top100k.genome.gz > top100k.genome
fi



$TRINITY_HOME/Trinity --genome_guided_max_intron 1000 --genome_guided_bam SP2.chr.bam --max_memory 2G  --output test_GG_use_bam_trinity_outdir

asmsize=$(wc -c <"test_GG_use_bam_trinity_outdir/Trinity-GG.fasta")
if [ $asmsize -le 50000 ]; then
    echo "Error, test_GG_use_bam_trinity_outdir/Trinity-GG.fasta potentially incomplete"
    exit 1
else
    echo "ok"
    exit 0
fi

