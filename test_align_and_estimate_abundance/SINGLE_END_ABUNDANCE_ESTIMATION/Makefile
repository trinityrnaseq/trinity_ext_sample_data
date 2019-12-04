SAMPLES="samples.txt"
TRINITY_FASTA="../../test_DATA/Trinity.fasta"

test: test_RSEM test_kallisto test_salmon
	${TRINITY_HOME}/Analysis/DifferentialExpression/merge_matrices.pl \
		RSEM-trans.isoform.TPM.not_cross_norm \
		kallisto-trans.isoform.TPM.not_cross_norm \
		salmon-trans.isoform.TPM.not_cross_norm \
		> combined.isoform.TPM.not_cross_norm.matrix
	../plot_paired_comparisons.Rscript combined.isoform.TPM.not_cross_norm.matrix
	touch test

test_RSEM:
ifeq ("", "$(shell which rsem-calculate-expression)")
	echo WARNING: skipping RSEM test, cannot locate rsem-calculate-expression tool in PATH
else
	../align_and_estimate_tester.pl RSEM ${SAMPLES} ${TRINITY_FASTA}
	touch test_RSEM
endif


test_kallisto:
ifeq ("", "$(shell which kallisto)")
	echo WARNING: cannot find kallisto installed in PATH, skipping kallisto test
else
	../align_and_estimate_tester.pl kallisto ${SAMPLES} ${TRINITY_FASTA}
	touch test_kallisto
endif

test_salmon:
ifeq ("", "$(shell which salmon)")
	echo WARNING: cannot find salmon installed in PATH, skipping salmon test
else
	../align_and_estimate_tester.pl salmon ${SAMPLES} ${TRINITY_FASTA}
	touch test_salmon
endif


clean:
	./cleanme.pl


