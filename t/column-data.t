use Test::More;

use Playfair::Data::Column;

my $columns = [
	Playfair::Data::Column->new( description => '1st column', name => 'a', data => [ 1, 2, 3 ] ),
	Playfair::Data::Column->new( description => '2nd column', name => 'b', data => [ 2, 3, 1 ] ),
	Playfair::Data::Column->new( description => '3rd column', name => 'c', data => [ 3, 1, 2 ] ),
];



done_testing;
