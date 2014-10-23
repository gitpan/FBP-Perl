package MyFrame1;

use 5.008;
use strict;
use warnings;
use Wx ':everything';

our $VERSION = '0.01';
our @ISA     = 'Wx::Frame';

sub new {
	my $class  = shift;
	my $parent = shift;

	my $self = $class->SUPER::new(
		$parent,
		-1,
		Wx::gettext("Frame Title"),
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		Wx::wxDEFAULT_FRAME_STYLE | Wx::wxTAB_TRAVERSAL,
	);

	$self->{m_staticText5} = Wx::StaticText->new(
		$self,
		-1,
		Wx::gettext("MyLabel"),
	);

	$self->{m_button4} = Wx::Button->new(
		$self,
		-1,
		Wx::gettext("MyButton"),
	);

	$self->CreateStatusBar(
		2,
		Wx::wxST_SIZEGRIP,
		-1,
	);

	my $bSizer7 = Wx::BoxSizer->new(Wx::wxHORIZONTAL);
	$bSizer7->Add( $self->{m_staticText5}, 0, Wx::wxALIGN_CENTER_VERTICAL | Wx::wxALL, 5 );
	$bSizer7->Add( $self->{m_button4}, 0, Wx::wxALL, 5 );

	$self->SetSizer($bSizer7);
	$self->Layout;
	$bSizer7->Fit($self);

	return $self;
}

1;
