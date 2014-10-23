package MyDialog1;

use 5.008;
use strict;
use warnings;
use Wx ':everything';
use t::lib::MyClass ();

our $VERSION = '0.01';
our @ISA     = 'Wx::Dialog';

sub new {
	my $class  = shift;
	my $parent = shift;

	my $self = $class->SUPER::new(
		$parent,
		-1,
		Wx::gettext("Dialog Title"),
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		Wx::wxDEFAULT_DIALOG_STYLE | Wx::wxRESIZE_BORDER,
	);

	$self->{m_staticText1} = t::lib::MyClass->new(
		$self,
		-1,
		Wx::gettext("Michael \"Killer\" O'Reilly <michael\@localhost>"),
	);

	$self->{m_textCtrl1} = Wx::TextCtrl->new(
		$self,
		-1,
		"This is also a test",
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		Wx::wxTE_CENTRE,
	);
	$self->{m_textCtrl1}->SetMaxLength( 50 );

	$self->{m_button1} = Wx::Button->new(
		$self,
		-1,
		Wx::gettext("MyButton"),
	);
	$self->{m_button1}->SetDefault;

	Wx::Event::EVT_BUTTON(
		$self,
		$self->{m_button1},
		sub {
			shift->m_button1(@_);
		},
	);

	$self->{m_staticline1} = Wx::StaticLine->new(
		$self,
		-1,
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		Wx::wxLI_HORIZONTAL | Wx::wxNO_BORDER,
	);

	$self->{m_choice1} = Wx::Choice->new(
		$self,
		-1,
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		[ ],
	);

	$self->{m_comboBox1} = Wx::ComboBox->new(
		$self,
		-1,
		"Combo!",
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		[
			"one",
			"two",
			"a'b",
			"c\"d\\\"",
		],
	);

	$self->{m_listBox1} = Wx::ListBox->new(
		$self,
		-1,
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		[ ],
	);

	$self->{m_listCtrl1} = Wx::ListCtrl->new(
		$self,
		-1,
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
		Wx::wxLC_ICON,
	);

	Wx::Event::EVT_LIST_COL_CLICK(
		$self,
		$self->{m_listCtrl1},
		sub {
			shift->list_col_click(@_);
		},
	);

	Wx::Event::EVT_LIST_ITEM_ACTIVATED(
		$self,
		$self->{m_listCtrl1},
		sub {
			shift->list_item_activated(@_);
		},
	);

	Wx::Event::EVT_LIST_ITEM_SELECTED(
		$self,
		$self->{m_listCtrl1},
		sub {
			shift->list_item_selected(@_);
		},
	);

	$self->{m_htmlWin1} = Wx::HtmlWindow->new(
		$self,
		-1,
		Wx::wxDefaultPosition,
		[ 200, 200 ],
		Wx::wxHW_SCROLLBAR_AUTO,
	);

	$self->{m_checkBox1} = Wx::CheckBox->new(
		$self,
		-1,
		Wx::gettext("Check Me!"),
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
	);

	$self->{m_checkBox2} = Wx::CheckBox->new(
		$self,
		-1,
		Wx::gettext("Check Me!"),
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
	);

	$self->{m_checkBox3} = Wx::CheckBox->new(
		$self,
		-1,
		Wx::gettext("Check Me!"),
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
	);

	$self->{m_checkBox4} = Wx::CheckBox->new(
		$self,
		-1,
		Wx::gettext("Check Me!"),
		Wx::wxDefaultPosition,
		Wx::wxDefaultSize,
	);

	my $fgSizer1 = Wx::FlexGridSizer->new( 1, 2, 3, 4 );
	$fgSizer1->AddGrowableCol( 0 );
	$fgSizer1->AddGrowableCol( 1 );
	$fgSizer1->SetFlexibleDirection( Wx::wxBOTH );
	$fgSizer1->SetNonFlexibleGrowMode( Wx::wxFLEX_GROWMODE_SPECIFIED );
	$fgSizer1->Add( $self->{m_choice1}, 0, Wx::wxALL, 5 );
	$fgSizer1->Add( $self->{m_comboBox1}, 0, Wx::wxALL | Wx::wxEXPAND, 5 );
	$fgSizer1->Add( $self->{m_listBox1}, 0, Wx::wxALL, 5 );
	$fgSizer1->Add( $self->{m_listCtrl1}, 0, Wx::wxALL | Wx::wxEXPAND, 5 );

	my $sbSizer1 = Wx::StaticBoxSizer->new(
		Wx::StaticBox->new(
			$self,
			-1,
			Wx::gettext("The Interweb"),
		),
		Wx::wxVERTICAL,
	);
	$sbSizer1->Add( $self->{m_htmlWin1}, 0, Wx::wxALL | Wx::wxEXPAND, 5 );

	my $gSizer1 = Wx::GridSizer->new( 1, 2, 3, 4 );
	$gSizer1->Add( $self->{m_checkBox1}, 0, Wx::wxALL, 5 );
	$gSizer1->Add( $self->{m_checkBox2}, 0, Wx::wxALL, 5 );
	$gSizer1->Add( $self->{m_checkBox3}, 0, Wx::wxALL, 5 );
	$gSizer1->Add( $self->{m_checkBox4}, 0, Wx::wxALL, 5 );

	my $bSizer2 = Wx::BoxSizer->new( Wx::wxVERTICAL );
	$bSizer2->Add( $self->{m_staticText1}, 0, Wx::wxALL, 5 );
	$bSizer2->Add( 10, 5, 0, Wx::wxEXPAND, 5 );
	$bSizer2->Add( $self->{m_textCtrl1}, 0, Wx::wxALL, 5 );
	$bSizer2->Add( $self->{m_button1}, 0, Wx::wxALL, 5 );
	$bSizer2->Add( $self->{m_staticline1}, 0, Wx::wxEXPAND | Wx::wxALL, 5 );
	$bSizer2->Add( $fgSizer1, 1, Wx::wxEXPAND, 5 );
	$bSizer2->Add( $sbSizer1, 1, Wx::wxEXPAND, 5 );
	$bSizer2->Add( $gSizer1, 0, Wx::wxEXPAND, 5 );

	my $bSizer1 = Wx::BoxSizer->new( Wx::wxHORIZONTAL );
	$bSizer1->Add( $bSizer2, 1, Wx::wxEXPAND, 5 );

	$self->SetSizer($bSizer1);
	$self->Layout;
	$bSizer1->Fit($self);
	$bSizer1->SetSizeHints($self);

	return $self;
}

sub m_htmlWin1 {
	$_[0]->{m_htmlWin1};
}

sub m_button1 {
	my $self  = shift;
	my $event = shift;

	die 'EVENT HANDLER NOT IMPLEMENTED';
}

sub list_col_click {
	my $self  = shift;
	my $event = shift;

	die 'EVENT HANDLER NOT IMPLEMENTED';
}

sub list_item_activated {
	my $self  = shift;
	my $event = shift;

	die 'EVENT HANDLER NOT IMPLEMENTED';
}

sub list_item_selected {
	my $self  = shift;
	my $event = shift;

	die 'EVENT HANDLER NOT IMPLEMENTED';
}

1;
