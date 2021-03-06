#!/usr/bin/perl
#
# $Id$

require 5.008;
use warnings;
use strict;

use Data::Dumper;

use DNSCheck;

######################################################################

my $check = new DNSCheck;
my $dns   = $check->dns;

my $zone   = "schlyter.se";
my $domain = "ns.schlyter.se";

my $parent = $dns->query_parent($zone, $domain, "IN", "A");
my $child = $dns->query_child($zone, $domain, "IN", "A");

$check->logger->dump();

print "********** PARENT **********\n";
print Dumper($parent->authority);

print "********** CHILD **********\n";
print Dumper($child->answer);
