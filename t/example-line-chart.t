use Playfair::Plotting qw(figure line_chart);

use strict;
use warnings;

# prepare some data
my $x = [1, 2, 3, 4, 5];
my $y = [6, 7, 2, 4, 5];

my $line_chart = line_chart( x => $x, y => $y );

my $fig = figure( title => "simple line example", xlabel => "x-axis label", ylabel => "y-axis label", legend => 1);
$fig->add( $line_chart );

$fig->output( device => 'bokeh', file => 'example-line-chart.html' );
