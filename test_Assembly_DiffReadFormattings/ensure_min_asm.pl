#!/usr/bin/env perl

use strict;
use warnings;

my $min_val = $ARGV[0] or die "Error, specify min full length";
my $trin_fa_file = $ARGV[1] or die "Error, need trin fa file";

my $asm_text = `cat $trin_fa_file.pslx.maps.summary`;
my @vals = split(/\t/, $asm_text);
if ($vals[1] < $min_val) {
    die "Error, $vals[1] < $min_val transcripts reconstructed";
}

exit(0);

