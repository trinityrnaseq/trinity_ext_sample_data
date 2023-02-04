test: transcript gene


transcript:
	${TRINITY_HOME}/util/misc/contig_ExN50_statistic.pl ../test_DATA/salmon-quasi-trans.isoform.TMM.EXPR.matrix ../test_DATA/Trinity.fasta transcript > test.transcript.ExN50
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript test.transcript.ExN50
	${TRINITY_HOME}/util/misc/try_estimate_TPM_filtering_threshold.Rscript --E_inputs salmon-quasi-trans.isoform.TMM.EXPR.matrix.by-transcript.E-inputs --out_pdf estimate_TPM_threshold.by_gene.pdf


gene:
	${TRINITY_HOME}/util/misc/contig_ExN50_statistic.pl ../test_DATA/salmon-quasi-trans.isoform.TMM.EXPR.matrix ../test_DATA/Trinity.fasta gene > test.gene.ExN50
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript test.gene.ExN50
	${TRINITY_HOME}/util/misc/try_estimate_TPM_filtering_threshold.Rscript --E_inputs salmon-quasi-trans.isoform.TMM.EXPR.matrix.by-gene.E-inputs --out_pdf estimate_TPM_threshold.by_gene.pdf

clean:
	rm -f ./salmon* ./test.* ./estimate_TPM_threshold*

