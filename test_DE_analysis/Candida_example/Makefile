

test: test_edgeR test_DESeq2 test_voom test_PtR_PCA test_PtR_heatmap
	./validate_results.pl

test_edgeR:
	${TRINITY_HOME}/Analysis/DifferentialExpression/run_DE_analysis.pl  -m Trinity_trans.counts.matrix --method edgeR -s samples.txt -o edgeR_outdir
	cd edgeR_outdir && ${TRINITY_HOME}/Analysis/DifferentialExpression/analyze_diff_expr.pl  \
	--matrix ../Trinity_trans.TMM.EXPR.matrix --samples ../samples.txt && \
	${TRINITY_HOME}/Analysis/DifferentialExpression/validate_UP_subset.Rscript ../samples.txt
	touch test_edgeR

test_DESeq2:
	${TRINITY_HOME}/Analysis/DifferentialExpression/run_DE_analysis.pl  -m Trinity_trans.counts.matrix --method DESeq2 -s samples.txt -o DESeq2_outdir
	cd DESeq2_outdir && ${TRINITY_HOME}/Analysis/DifferentialExpression/analyze_diff_expr.pl  \
	--matrix ../Trinity_trans.TMM.EXPR.matrix --samples ../samples.txt && \
	${TRINITY_HOME}/Analysis/DifferentialExpression/validate_UP_subset.Rscript ../samples.txt
	touch test_DESeq2

test_voom:
	${TRINITY_HOME}/Analysis/DifferentialExpression/run_DE_analysis.pl  -m Trinity_trans.counts.matrix --method voom -s samples.txt -o voom_outdir
	cd voom_outdir && ${TRINITY_HOME}/Analysis/DifferentialExpression/analyze_diff_expr.pl  \
	--matrix ../Trinity_trans.TMM.EXPR.matrix --samples ../samples.txt && \
	${TRINITY_HOME}/Analysis/DifferentialExpression/validate_UP_subset.Rscript ../samples.txt
	touch test_voom

test_PtR_PCA:
	${TRINITY_HOME}/Analysis/DifferentialExpression/PtR -m Trinity_trans.TMM.EXPR.matrix -s samples.txt --prin_comp 3 --add_prin_comp_heatmaps 30
	touch test_PtR_PCA

test_PtR_heatmap:
	${TRINITY_HOME}/Analysis/DifferentialExpression/PtR -m Trinity_trans.TMM.EXPR.matrix -s samples.txt --heatmap --sample_cor_matrix --log2 --save
	touch test_PtR_heatmap

clean:
	rm -rf ./edgeR_outdir
	rm -rf ./DESeq2_outdir
	rm -rf ./voom_outdir
	rm -f ./Trinity_trans.counts.matrix.*
	rm -f ./Trinity_trans.TMM.EXPR.matrix.*
	rm -f ./*.pdf
	rm -f test_edgeR test_DESeq2 test_voom test_PtR_heatmap



# in case we need to restrict tests here
#rversion := $(shell R --version | head -1)
#ifeq (,$(findstring 3.1.1, $(rversion)))
#  ...
#endif
