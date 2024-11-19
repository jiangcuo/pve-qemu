#!/usr/bin/perl

use warnings;
use strict;

use JSON;

my $machines = [];

print to_json($machines, { utf8 => 1, canonical => 1 })
    or die "failed to encode detected machines as JSON - $!\n";
