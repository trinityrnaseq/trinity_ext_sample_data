
test:
	../../../../Analysis/SuperTranscripts/Trinity_gene_splice_modeler.py --trinity_fasta S-Lap3.flush.fa --no_squeeze --no_refinement --out_prefix st --debug
	cat st.gtf | cut -f1,2,3,4,5,6,7 | sort > st.gtf.sort
	diff st.gtf.sort st.gtf.expected_result.sort

clean:
	rm -f ./st.fa ./st.gtf ./st.gtf.sort


