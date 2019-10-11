

test:
	python2 ${TRINITY_HOME}/util/misc/TPM_weighted_gene_length.py --gene_trans_map Trinity.fasta.gene_trans_map --trans_lengths Trinity.fasta.seqlens --TPM_matrix rsem.isoform.TMM.EXPR.matrix
	python3 ${TRINITY_HOME}/util/misc/TPM_weighted_gene_length.py --gene_trans_map Trinity.fasta.gene_trans_map --trans_lengths Trinity.fasta.seqlens --TPM_matrix rsem.isoform.TMM.EXPR.matrix
	@touch test

clean:
	rm -f ./test

