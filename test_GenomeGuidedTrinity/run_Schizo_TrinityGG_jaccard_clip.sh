#!/bin/bash -ve

$TRINITY_HOME/Trinity --genome_guided_bam SP2.chr.bam --max_memory 1G --CPU 2 --genome_guided_max_intron 1000 --jaccard_clip --SS_lib_type RF --output test_Schizo_trinityGG_jaccard_RF_outdir

outfile="test_Schizo_trinityGG_jaccard_RF_outdir/Trinity-GG.fasta"
asmsize=$(wc -c <"${outfile}")
if [ $asmsize -le 50000 ]; then
    echo "Error, ${outfile} potentially incomplete"
    exit 1
else
    echo "ok"
    exit 0
fi
