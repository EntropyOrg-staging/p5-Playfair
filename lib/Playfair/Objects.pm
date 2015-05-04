package Playfair::Objects;

use strict;
use warnings;

package Playfair::Figure {
	use Moo;

	has tools => ( is => 'rw', default => sub { "pan,wheel_zoom,box_zoom,save,resize,reset" }  );
	has [qw( x_range y_range )] => ( is => 'rw', default => sub { undef } );
	has [qw( x_axis_type y_axis_type )] => ( is => 'rw', default => sub { "auto" } );
	has [qw( x_minor_ticks y_minor_ticks )] => ( is => 'rw', default => sub { "auto" } );
	has x_axis_location => ( is => 'rw', default => sub { 'below' } );
	has y_axis_location => ( is => 'rw', default => sub { 'left' } );
	has [qw(x_axis_label y_axis_label)] => ( is => 'rw', default => sub { '' } );
};


1;
