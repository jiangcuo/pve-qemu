#!/usr/bin/perl

use warnings;
use strict;

use JSON;

my $machines = [];

while (<STDIN>) {
    if (/^\s*Supported machines are:/) {
	next;
    }

    s/^\s+//;
    my @machine = split(/\s+/);
    next if $machine[0] !~ m/^virt-(.+)$/;
    push @$machines, {
        'id' => $machine[0],
        'type' => 'virt',
        'version' => $1,
    };
}

die "no QEMU machine types detected from STDIN input" if scalar (@$machines) <= 0;

print to_json($machines, { utf8 => 1, canonical => 1 })
    or die "failed to encode detected machines as JSON - $!\n";