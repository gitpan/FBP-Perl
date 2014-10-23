#!/usr/bin/perl

use strict;
BEGIN {
	$|  = 1;
	$^W = 1;
}

use Test::More tests => 12;
use Test::NoWarnings;
use t::lib::Test;
use FBP::Perl;

# Find the sample files
my $input  = File::Spec->catfile( 't', 'data', 'simple.fbp' );
my $output = File::Spec->catfile( 't', 'data', 'trim.pl'    );
ok( -f $input,  "Found test file $input"  );
ok( -f $output, "Found test file $output" );

# Load the sample file
my $fbp = FBP->new;
isa_ok( $fbp, 'FBP' );
ok( $fbp->parse_file($input), '->parse_file ok' );

# Create the generator object
my $project = $fbp->find_first(
	isa => 'FBP::Project',
);
my $code = FBP::Perl->new(
	project   => $project,
	version   => $FBP::Perl::VERSION,
	prefix    => 1,
	i18n      => 1,
	i18n_trim => 1,
);
isa_ok( $project, 'FBP::Project' );
isa_ok( $code, 'FBP::Perl' );
is( $code->i18n,      1, '->i18n'      );
is( $code->i18n_trim, 1, '->i18n_trim' );

# Test Dialog string generators
my $dialog = $fbp->form('MyPanel1');
isa_ok( $dialog, 'FBP::Panel' );

# Generate the entire dialog constructor
my $have = $code->dialog_class($dialog);
my $want = slurp($output);
code( $have, $want, '->dialog_class ok' );
compiles( $have, 'Dialog class compiled' );
