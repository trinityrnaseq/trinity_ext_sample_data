test: transcript gene more



transcript:
	${TRINITY_HOME}/util/misc/contig_ExN50_statistic.pl ../test_DATA/salmon-quasi-trans.isoform.TMM.EXPR.matrix ../test_DATA/Trinity.fasta transcript > test.transcript.ExN50
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript test.transcript.ExN50
	${TRINITY_HOME}/util/misc/try_estimate_TPM_filtering_threshold.Rscript --E_inputs salmon-quasi-trans.isoform.TMM.EXPR.matrix.by-transcript.E-inputs --out_pdf estimate_TPM_threshold.by_gene.pdf


gene:
	${TRINITY_HOME}/util/misc/contig_ExN50_statistic.pl ../test_DATA/salmon-quasi-trans.isoform.TMM.EXPR.matrix ../test_DATA/Trinity.fasta gene > test.gene.ExN50
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript test.gene.ExN50
	${TRINITY_HOME}/util/misc/try_estimate_TPM_filtering_threshold.Rscript --E_inputs salmon-quasi-trans.isoform.TMM.EXPR.matrix.by-gene.E-inputs --out_pdf estimate_TPM_threshold.by_gene.pdf


more: acanth mouse axolotl


acanth:
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript more_examples/acanth.ExN50.stats
	${TRINITY_HOME}/util/misc/try_estimate_TPM_filtering_threshold.Rscript --E_inputs more_examples/acanth.E-inputs.gz --out_pdf acanth.threshold_estimate.pdf

mouse:
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript more_examples/mouse.50M.ExN50.stats 
	${TRINITY_HOME}/util/misc/try_estimate_TPM_filtering_threshold.Rscript --E_inputs more_examples/mouse50M.E-inputs.gz --out_pdf mouse50M.threshold_estimate.pdf

axolotl:
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript more_examples/axolotl.transcript.ExN50.stats
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript more_examples/axolotl.gene.ExN50.stats



clean:
	rm -f ./salmon* ./test.* ./estimate_TPM_threshold* ./*.pdf


