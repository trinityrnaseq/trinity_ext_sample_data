#!/usr/bin/env perl

use strict;
use warnings;

my $min_val = $ARGV[0] or die "Error, specify min full length";

my $asm_text = `cat Trinity.fasta.pslx.maps.summary`;
my @vals = split(/\t/, $asm_text);
if ($vals[1] < $min_val) {
    die "Error, $vals[1] < $min_val transcripts reconstructed";
}

exit(0);

