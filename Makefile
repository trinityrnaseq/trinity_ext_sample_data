
DIRS = test_GenomeGuidedTrinity \
test_InSilicoReadNormalization \
test_DE_analysis \
test_align_and_estimate_abundance \
test_full_edgeR_pipeline \
test_GOSeq_trinotate_pipe \
test_profiling_report \
test_PtR \
test_DTU \
test_VariantCalling \
test_tximport \
test_SuperTranscript \
test_GOplot \
test_TPM_weighted_gene_length


test:
	@for i in $(DIRS); do \
	echo "Running example in $$i..."; \
	(cd $$i; $(MAKE) test) || exit $$?; done



clean:
	@for i in $(DIRS); do \
	echo "Running example in $$i..."; \
	(cd $$i; $(MAKE) clean) || exit $$?; done
