#!/bin/bash -ve

# just for testing purposes, use --max_cov 30 or higher for real applications.
$TRINITY_HOME/util/insilico_read_normalization.pl --JM 2G --left ../test_DATA/reads.left.fq.gz --right ../test_DATA/reads.right.fq.gz --seqType fq --max_cov 5 --pairs_together --no_cleanup --CPU 4 --tmp_dir_name tmp_PE_norm_dir --min_cov 2



