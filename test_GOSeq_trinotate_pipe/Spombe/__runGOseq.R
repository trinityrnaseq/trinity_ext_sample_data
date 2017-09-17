library(goseq)
library(GO.db)
library(qvalue)
# capture list of genes for functional enrichment testing
factor_labeling = read.table("ds_induced_vs_log.factors", row.names=2, header=F)
colnames(factor_labeling) = c('type')
factor_list = unique(factor_labeling[,1])
DE_genes = rownames(factor_labeling)


# get gene lengths
gene_lengths = read.table("Trinity.seq_lengths", header=T, row.names=1)
gene_lengths = as.matrix(gene_lengths[,1,drop=F])


# get background gene list
background = read.table("Trinity.background", header=T, row.names=1)
background.gene_ids = rownames(background)
background.gene_ids = unique(c(background.gene_ids, DE_genes))


# parse GO assignments
GO_info = read.table("Trinotate_report.xls.trans.gene_ontology", header=F, row.names=1,stringsAsFactors=F)
GO_info_listed = apply(GO_info, 1, function(x) unlist(strsplit(x,',')))
names(GO_info_listed) = rownames(GO_info)
get_GO_term_descr =  function(x) {
    d = 'none';
    go_info = GOTERM[[x]];
    if (length(go_info) >0) { d = paste(Ontology(go_info), Term(go_info), sep=' ');}
    return(d);
}


# GO-Seq protocol: build pwf based on ALL DE features
sample_set_gene_ids = background.gene_ids
sample_set_gene_lengths = gene_lengths[sample_set_gene_ids,]
GO_info_listed = GO_info_listed[ names(GO_info_listed) %in% sample_set_gene_ids ]
cat_genes_vec = as.integer(sample_set_gene_ids %in% rownames(factor_labeling))
pwf=nullp(cat_genes_vec, bias.data=sample_set_gene_lengths)
rownames(pwf) = sample_set_gene_ids


# perform functional enrichment testing for each category.
for (feature_cat in factor_list) {
   message('Processing category: ', feature_cat)
    cat_genes_vec = as.integer(sample_set_gene_ids %in% rownames(factor_labeling)[factor_labeling$type == feature_cat])
    pwf$DEgenes = cat_genes_vec
    res = goseq(pwf,gene2cat=GO_info_listed, use_genes_without_cat=TRUE)
    ## over-represented categories:
     pvals = res$over_represented_pvalue
     pvals[pvals > 1 - 1e-10] = 1 - 1e-10
     q = qvalue(pvals)
     res$over_represented_FDR = q$qvalues
    go_enrich_filename = paste(feature_cat,'.GOseq.enriched', sep='')
    result_table = res[res$over_represented_pvalue<=0.05,]
    descr = unlist(lapply(result_table$category, get_GO_term_descr))
    result_table$go_term = descr;
    write.table(result_table[order(result_table$over_represented_pvalue),], file=go_enrich_filename, sep='	', quote=F, row.names=F)
    ## under-represented categories:
     pvals = res$under_represented_pvalue
     pvals[pvals>1-1e-10] = 1 - 1e-10
     q = qvalue(pvals)
     res$under_represented_FDR = q$qvalues
    go_depleted_filename = paste(feature_cat,'.GOseq.depleted', sep='')
    result_table = res[res$under_represented_pvalue<=0.05,]
    descr = unlist(lapply(result_table$category, get_GO_term_descr))
    result_table$go_term = descr;
    write.table(result_table[order(result_table$under_represented_pvalue),], file=go_depleted_filename, sep='	', quote=F, row.names=F)
}
