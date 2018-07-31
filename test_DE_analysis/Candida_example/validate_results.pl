#!/usr/bin/env perl

use strict;
use warnings;


my $ALLOWED_DELTA_PCT = 5;

main: {
    &verify("DESeq2_outdir/diffExpr.P0.001_C2.matrix", 1784);
    &verify("ROTS_outdir/diffExpr.P0.001_C2.matrix", 84);
    &verify("edgeR_outdir/diffExpr.P0.001_C2.matrix", 2063);
    &verify("voom_outdir/diffExpr.P0.001_C2.matrix", 1818);

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
