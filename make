#!/usr/bin/perl

use strict;
use warnings;

use Path::Class;

my $build_dir = dir 'build';
$build_dir->mkpath unless -d $build_dir;

for my $pod (grep m/\.pod$/i, grep { -f $_ } dir( '.' )->children) {
    my ($stub) = $pod =~ m/(.*)\.pod$/i;

    my $html = $build_dir->file( "$stub.html" );
    system( "pod2html $pod > $html" );

    my $txt = $build_dir->file( "$stub.txt" );
    system( "pod2text $pod > $txt" );
}
