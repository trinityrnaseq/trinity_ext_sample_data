test:
	./tximport_compare.Rscript
	../../util/abundance_estimates_to_matrix.pl --est_method salmon --gene_trans_map gene_to_trans.txt --name_sample_by_basedir --quant_files quant_files.list
	./plot_comparison.Rscript



clean:
	rm -f ./salmon.* ./compare.pdf ./__tmp_runTMM.R ./tx2gene.csv ./tximport.*

