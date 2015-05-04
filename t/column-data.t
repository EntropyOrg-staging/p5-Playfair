use Test::More;

use Graphics::Bokeh::Data::Column;

my $columns = [
	Graphics::Bokeh::Data::Column->new( description => '1st column', name => 'a', data => [ 1, 2, 3 ] ),
	Graphics::Bokeh::Data::Column->new( description => '2nd column', name => 'b', data => [ 2, 3, 1 ] ),
	Graphics::Bokeh::Data::Column->new( description => '3rd column', name => 'c', data => [ 3, 1, 2 ] ),
];



done_testing;
