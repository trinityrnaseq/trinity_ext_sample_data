#!/bin/bash

set -ex

$TRINITY_HOME/Analysis/DifferentialExpression/run_DE_analysis.pl  -m Axo.rsem.gene.counts.matrix -s samples.txt --method edgeR -o axo_gene_DE_edgeR

cd axo_gene_DE_edgeR && $TRINITY_HOME/Analysis/DifferentialExpression/analyze_diff_expr.pl  -m ../Axo.rsem.gene.EXPR.matrix -s ../samples.txt --examine_GO_enrichment --GO_annots ../axolotl.gene.GO --gene_lengths ../gene_lengths.txt 

