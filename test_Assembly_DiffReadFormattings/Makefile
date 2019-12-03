
MINASM=9


all: forward_reverse stripped


regular:
	${TRINITY_HOME}/Trinity --left reads.left.fq.gz --right reads.right.fq.gz --seqType fq  --SS_lib_type RF --CPU 2 --max_memory 1G --output trinity_outdir --output trinity_regular_outdir --no_cleanup
	${TRINITY_HOME}/Analysis/FL_reconstruction_analysis/FL_trans_analysis_pipeline.pl --query trinity_regular_outdir/Trinity.fasta --target ${TRINITY_HOME}/sample_data/test_Trinity_Assembly/__indiv_ex_sample_derived/refSeqs.fa --no_reuse
	./ensure_min_asm.pl ${MINASM}

forward_reverse:
	${TRINITY_HOME}/Trinity --left reads.ForRev_1.fastq.gz --right reads.ForRev_2.fastq.gz --seqType fq  --SS_lib_type RF --CPU 2 --max_memory 1G --output trinity_ForwRev_outdir --no_cleanup
	${TRINITY_HOME}/Analysis/FL_reconstruction_analysis/FL_trans_analysis_pipeline.pl --query trinity_ForwRev_outdir/Trinity.fasta --target ${TRINITY_HOME}/sample_data/test_Trinity_Assembly/__indiv_ex_sample_derived/refSeqs.fa --no_reuse
	./ensure_min_asm.pl ${MINASM}

stripped:
	${TRINITY_HOME}/Trinity --left reads.left.stripped.fq.gz --right reads.right.stripped.fq.gz --seqType fq  --SS_lib_type RF --CPU 2 --max_memory 1G --output trinity_stripped_outdir --no_cleanup
	${TRINITY_HOME}/Analysis/FL_reconstruction_analysis/FL_trans_analysis_pipeline.pl --query trinity_stripped_outdir/Trinity.fasta --target ${TRINITY_HOME}/sample_data/test_Trinity_Assembly/__indiv_ex_sample_derived/refSeqs.fa --no_reuse
	./ensure_min_asm.pl ${MINASM}

clean:
	rm -rf ./trinity*outdir
	rm -f ./Trinity.fasta*
 
