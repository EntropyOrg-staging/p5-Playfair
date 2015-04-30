package Graphics::Bokeh::Data::Column;

use strict;
use warnings;

use Moo;

has name => ( is => 'ro' );
# used for labels (e.g., in plot legends, table headers)
has description => ( is => 'ro' );
has data => ( is => 'ro' );


1;
