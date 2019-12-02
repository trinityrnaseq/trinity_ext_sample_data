

all: regular forward_reverse


regular:
	${TRINITY_HOME}/Trinity --left reads.left.fq.gz --right reads.right.fq.gz --seqType fq  --SS_lib_type RF --CPU 2 --max_memory 1G --output trinity_outdir --output trinity_regular_outdir --no_cleanup


forward_reverse:
	${TRINITY_HOME}/Trinity --left reads.ForRev_1.fastq.gz --right reads.ForRev_2.fastq.gz --seqType fq  --SS_lib_type RF --CPU 2 --max_memory 1G --output trinity_ForwRev_outdir --no_cleanup


clean:
	rm -rf ./trinity*outdir
 
