test:
	${TRINITY_HOME}/Trinity --seqType fa --left reads_1.fa --right reads_2.fa --long_reads longreads.fa --output trinity_outdir --no_cleanup --CPU 1 --max_memory 10G --trinity_complete --verbose
	find trinity_outdir/ -regex ".*allProbPaths.fasta"  -exec cat {} \; | grep LR


clean:
	rm -rf ./trinity_outdir

