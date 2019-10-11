#!/bin/sh
${TRINITY_HOME}/Analysis/DifferentialExpression/run_GOseq.pl --factor_labeling hs_induced_vs_log.factors --GO_assignments Trinotate_report.xls.trans.gene_ontology --lengths Trinity.seq_lengths --background Trinity.background

${TRINITY_HOME}/Analysis/DifferentialExpression/run_GOseq.pl --factor_labeling ds_induced_vs_log.factors --GO_assignments Trinotate_report.xls.trans.gene_ontology --lengths Trinity.seq_lengths --background Trinity.background
