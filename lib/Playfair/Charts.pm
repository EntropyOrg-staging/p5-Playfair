package Playfair::Charts;

use strict;
use warnings;

package Playfair::Chart::Role::Title {
	use Moo;
	use Types::Standard qw( Str Int );
	has title => ( is => 'ro', isa => Str, doc => 'The title of your chart.' );
};
package Playfair::Chart::Role::XAxis {
	use Moo;
	use Types::Standard qw( Str Int Bool );
	has xlabel => ( is => 'ro', isa => Str, doc => 'The x-axis label of your chart.' );
	has xscale => ( is => 'ro', isa => Str, doc => 'The x-axis type scale of your chart.' );
	has xgrid => ( is => 'ro', isa => Bool, doc => 'whether to draw an x-grid.' );
};
package Playfair::Chart::Role::YAxis {
	use Moo;
	use Types::Standard qw( Str Int Bool );
	has ylabel => ( is => 'ro', isa => Str, doc => 'The y-axis label of your chart.' );
	has yscale => ( is => 'ro', isa => Str, doc => 'The y-axis type scale of your chart.' );
	has ygrid => ( is => 'ro', isa => Bool, doc => 'whether to draw an y-grid.' );
};

package Playfair::Chart::Role::Legend {
	use Moo;
	use Types::Standard qw( Str Bool );
	has legend => ( is => 'ro', isa => Str|Bool, doc => 'The legend of your chart.' );
};

# TODO this should probably be an aspect of the output, not the chart itself
package Playfair::Chart::Role::PlotSize {
	use Moo;
	use Types::Standard qw( Int );
	has width => ( is => 'ro', isa => Int, doc => 'The width of your plot in pixels.' );
	has height => ( is => 'ro', isa => Int, doc => 'The height of you plot in pixels.' );
};



package Playfair::ChartRole {
	use Moo;
	with map { "Playfair::Chart::Role::$_" } qw(Title XAxis YAxis Legend PlotSize);
	#tools (str or bool): to enable or disable the tools in your chart.
	#palette (list): a list containing the colormap as hex values.
	#filename (str or bool): the name of the file where your chart will be written.
	#server (str or bool): the name of your chart in the server.
	#notebook (bool):if you want to output (or not) your chart into the IPython notebook.
};


package Playfair::Chart::Role::Value {
	use Moo;
	has values => ( is => 'ro', required => 1, doc => 'data series to be plotted' );
};

package Playfair::Chart::Area       {
	use Moo;
	use Types::Standard qw( Bool );
	with qw(Playfair::Chart::Role::Value);
	has index => ( is => 'ro' );
	has stacked => ( is => 'ro', isa => Bool );

	#index (str | 1d iterable of any sort, optional): can be used to specify a common custom index for all data series as follows:
	#    As a 1d iterable of any sort that will be used as series common index
	#    As a string that corresponds to the key of the mapping to be used as index (and not as data series) if area.values is a mapping (like a dict, an OrderedDict or a pandas DataFrame)
	#stacked (bool, optional):
	#    True: areas are draw as a stack to show the relationship of parts to a whole
	#    False: areas are layered on the same chart figure. Defaults to False.
};
package Playfair::Chart::Bar        {
	use Moo;
	use Types::Standard qw( Bool );
	with qw(Playfair::Chart::Role::Value);
	has cat => ( is => 'ro' );
	has stacked => ( is => 'ro', isa => Bool );
	has continuous_range => ( is => 'ro' );

	#cat (list, optional): list of string representing the categories. Defaults to None.
	#stacked (bool, optional):
	#    True: bars are draw as a stack to show the relationship of parts to a whole.
	#    False: bars are groupped on the same chart figure. Defaults to False.
	#continuous_range (Range, optional): An explicit range for the continuous axis of the chart (the y-dimension).
};
package Playfair::Chart::BoxPlot    {
	use Moo;
	with qw(Playfair::Chart::Role::Value);

	#marker (int or string, optional): the marker type to use if outliers=True (e.g., circle). Defaults to circle.
	#outliers (bool, optional): whether or not to plot outliers. Defaults to True.
};
package Playfair::Chart::Donut      {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
};
package Playfair::Chart::Dot        {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
	#cat (list, optional): list of string representing the categories. Defaults to None.
};
package Playfair::Chart::HeatMap    {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
	#cat (list, optional): list of string representing the categories. Defaults to None.
};
package Playfair::Chart::Histogram  {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
	#bins (int): number of bins to use when building the Histogram.
	#mu (float, optional): theoretical mean value for the normal distribution. Defaults to None.
	#sigma (float, optional): theoretical sigma value for the normal distribution. Defaults to None.
};
package Playfair::Chart::Horizon    {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
	#index (str | 1d iterable of any sort, optional): can be used to specify a common custom index for all data series as follows:
	#    As a 1d iterable of any sort that will be used as series common index
	#    As a string that corresponds to the key of the mapping to be used as index (and not as data series) if area.values is a mapping (like a dict, an OrderedDict or a pandas DataFrame)
	#num_folds (int, optional): number of folds stacked on top of each other. (default: 3)
	#pos_color (color, optional): The color of the positive folds. Defaults to #006400.
	#neg_color (color, optional): The color of the negative folds. Defaults to #6495ed.
};
package Playfair::Chart::Line       {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
	#index (str | 1d iterable of any sort, optional): can be used to specify a common custom index for all chart data series as follows:
	#    As a 1d iterable of any sort that will be used as series common index
	#    As a string that corresponds to the key of the mapping to be used as index (and not as data series) if area.values is a mapping (like a dict, an OrderedDict or a pandas DataFrame)
};
package Playfair::Chart::Scatter    {
	use Moo;

	#values (see Interface inputs): data series to be plotted. Container values must be 1d iterable of x, y pairs, like i.e.: [(1, 2), (2, 7), ..., (20122, 91)]
};
package Playfair::Chart::Step       {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
	#index (str | 1d iterable of any sort, optional): can be used to specify a common custom index for all chart data series as follows:
	#    As a 1d iterable of any sort that will be used as series common index
	#    As a string that corresponds to the key of the mapping to be used as index (and not as data series) if area.values is a mapping (like a dict, an OrderedDict or a pandas DataFrame)
};

package Playfair::Chart::Timeseries {
	use Moo;

	with qw(Playfair::Chart::Role::Value);
	#index (str | 1d iterable of any sort of datetime values, optional): can be used to specify a common custom index for all chart data series as follows:
	#    As a 1d iterable of any sort that will be used as series common index
	#    As a string that corresponds to the key of the mapping to be used as index (and not as data series) if area.values is a mapping (like a dict, an OrderedDict or a pandas DataFrame)
};

1;
