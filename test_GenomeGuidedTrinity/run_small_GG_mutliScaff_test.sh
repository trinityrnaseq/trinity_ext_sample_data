#!/bin/bash -ve


$TRINITY_HOME/Trinity --genome_guided_max_intron 1000 --genome_guided_bam transAligns.cSorted.bam --max_memory 2G  --output test_GG_use_small_multiscaff_bam_trinity_outdir


outfile="test_GG_use_small_multiscaff_bam_trinity_outdir/Trinity-GG.fasta"
asmsize=$(wc -c <"${outfile}")
if [ $asmsize -le 650000 ]; then
    echo "Error, ${outfile} potentially incomplete"
    exit 1
else
    echo "ok"
    exit 0
fi
