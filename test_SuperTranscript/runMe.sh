#!/bin/bash

set -ev

if [ ! -e mouse.10M.altsplice.trin.fa ]; then
    gunzip -c mouse.10M.altsplice.trin.fa.gz > mouse.10M.altsplice.trin.fa
fi


${TRINITY_HOME}/Analysis/SuperTranscripts/Trinity_gene_splice_modeler.py --trinity_fasta mouse.10M.altsplice.trin.fa --out_prefix st --incl_malign 
