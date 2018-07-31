#!/usr/bin/env perl

use strict;
use warnings;


my $ALLOWED_DELTA_PCT = 5;

main: {
    &verify("edgeR_genes/diffExpr.P0.001_C2.matrix", 26);
    &verify("edgeR_genes/Trinity_genes.counts.matrix.heatshock_vs_log_growth.edgeR.DE_results.P0.001_C2.DE.subset.GOseq.enriched", 112);
    &verify("edgeR_genes/Trinity_genes.counts.matrix.heatshock_vs_log_growth.edgeR.DE_results.P0.001_C2.log_growth-UP.subset.GOseq.enriched", 46);
    
    exit(0);
}

####
sub verify {
    my ($filename, $target_count) = @_;
    my $count = `cat $filename | wc -l`;
    $count =~ s/\s+//g;

    my $delta = abs($count - $target_count);
    my $pct_delta = $delta / $target_count * 100;

    if ($pct_delta <= $ALLOWED_DELTA_PCT) {
        print STDERR "$filename, count: $count DE features OK.\n";
    }
    else {
        die "Error, $filename has count: $count, $pct_delta % different from expected: $target_count";
    }

    return;
}
