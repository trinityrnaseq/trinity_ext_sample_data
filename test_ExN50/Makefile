test:
	${TRINITY_HOME}/util/misc/contig_ExN50_statistic.pl ../test_DATA/salmon-quasi-trans.isoform.TMM.EXPR.matrix ../test_DATA/Trinity.fasta | tee test.ExN50
	${TRINITY_HOME}/util/misc/plot_ExN50_statistic.Rscript test.ExN50



clean:
	rm -f ./salmon* ./test.*

