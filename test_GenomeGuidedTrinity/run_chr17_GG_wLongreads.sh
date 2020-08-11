#!/bin/bash -ve


$TRINITY_HOME/Trinity --genome_guided_max_intron 100000 --genome_guided_bam chr17.illumina.bam --long_reads_bam chr17.pbio.bam --max_memory 2G  --output test_chr17_LR_GG_trinity_outdir --CPU 5 --no_cleanup

find test_chr17_LR_GG_trinity_outdir/ -regex ".*allProbPaths.fasta" -exec cat {} \; | grep '>' | grep 'LR\$' > test_chr17_LR_GG_trinity_outdir.LR

if [[ $(wc -l <test_chr17_LR_GG_trinity_outdir.LR) -le 200 ]]; then
    echo "Error, fewer than expected pbio read-integrated assembled transcripts"
    exit 1
fi


exit 0


    
