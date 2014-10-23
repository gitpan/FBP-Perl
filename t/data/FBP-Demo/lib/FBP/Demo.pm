package FBP::Demo;

## no critic

use 5.008;
use strict;
use warnings;
use Wx ':everything';

our $VERSION = '0.01';
our @ISA     = 'Wx::App';

sub run {
	my $class = shift;
	my $self  = $class->new(@_);
	return $self->MainLoop;
}

sub OnInit {
	my $self = shift;

	# Create the primary frame
	require FBP::Demo::Main;
	$self->SetTopWindow( FBP::Demo::Main->new );

	# Don't flash frames on the screen in tests
	unless ( $ENV{HARNESS_ACTIVE} ) {
		$self->GetTopWindow->Show(1);
	}

	return 1;
}

1;
