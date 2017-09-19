#!/bin/bash

set -ev

${TRINITY_HOME}/Analysis/SuperTranscripts/AllelicVariants/run_variant_calling.py --st supertranscripts.fasta -p whitefly_rnaseq_1.fq.gz whitefly_rnaseq_2.fq.gz -o test_varcalling


