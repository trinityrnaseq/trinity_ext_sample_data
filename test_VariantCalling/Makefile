

all: paired single samples_file

test: all

paired:
	../../Analysis/SuperTranscripts/AllelicVariants/run_variant_calling.py \
               --st_fa supertranscripts.fasta \
               --st_gtf supertranscripts.gtf \
               -p whitefly_rnaseq_1.fq.gz whitefly_rnaseq_2.fq.gz \
               -o test_varcalling_paired





single:
	../../Analysis/SuperTranscripts/AllelicVariants/run_variant_calling.py \
               --st_fa supertranscripts.fasta \
               --st_gtf supertranscripts.gtf \
               -s whitefly_rnaseq_1.fq.gz \
               -o test_varcalling_single


samples_file:
	../../Analysis/SuperTranscripts/AllelicVariants/run_variant_calling.py \
               --st_fa supertranscripts.fasta \
               --st_gtf supertranscripts.gtf \
               -S samples_file.txt \
               -o test_varcalling_samplesfile



clean:
	rm -f ./*.log ./*.dict ./*.fai
	rm -rf ./test_varcalling_paired ./test_varcalling_single ./test_varcalling_samplesfile

