test:
	${TRINITY_HOME}/util/misc/contig_ExN50_statistic.pl ../test_DATA/salmon-quasi-trans.isoform.TMM.EXPR.matrix ../test_DATA/Trinity.fasta | tee test.ExN50
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript test.ExN50


	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript more_examples/acanth.ExN50.stats
	${TRINITY_HOME}/util/misc/try_estimate_TPM_filtering_threshold.Rscript --E_inputs more_examples/acanth.E-inputs.gz --out_pdf acanth.threshold_estimate.pdf

clean:
	rm -f ./salmon* ./test.* more_examples/*pdf


