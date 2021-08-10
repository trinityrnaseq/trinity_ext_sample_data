test:
	${TRINITY_HOME}/Trinity --samples_file samples_n_reads_decribed.txt --seqType fq --SS_lib_type RF --max_memory 1G --trimmomatic

	${TRINITY_HOME}/util/align_and_estimate_abundance.pl --transcripts trinity_out_dir.Trinity.fasta --est_method RSEM --aln_method bowtie2 --prep_reference --trinity_mode --samples_file samples_n_reads_decribed.txt --seqType fq

	find . -maxdepth 2 -name "*RSEM.isoforms.results" | tee rsem.isoform.files

	${TRINITY_HOME}/util/abundance_estimates_to_matrix.pl  --est_method RSEM --name_sample_by_basedir --quant_files rsem.isoform.files --out_prefix rsem --gene_trans_map trinity_out_dir.Trinity.fasta.gene_trans_map 

	${TRINITY_HOME}/Analysis/DifferentialExpression/run_DE_analysis.pl -m rsem.isoform.counts.matrix -s samples_n_reads_decribed.txt --method edgeR -o edgeR_isoforms --dispersion 0.1

	${TRINITY_HOME}/Analysis/DifferentialExpression/run_DE_analysis.pl -m rsem.gene.counts.matrix -s samples_n_reads_decribed.txt --method edgeR -o edgeR_genes --dispersion 0.1

	${TRINITY_HOME}/util/misc/fasta_seq_length.pl trinity_out_dir.Trinity.fasta > Trinity.fasta.seq_lens

	${TRINITY_HOME}/util/misc/TPM_weighted_gene_length.py  --gene_trans_map trinity_out_dir.Trinity.fasta.gene_trans_map  --trans_lengths Trinity.fasta.seq_lens --TPM_matrix rsem.isoform.TMM.EXPR.matrix > Trinity.gene_lengths.txt
	touch test

clean:
	./cleanme.pl

