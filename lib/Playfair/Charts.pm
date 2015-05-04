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

package Playfair::Chart::Area       {
	use Moo;
	use Types::Standard qw( Bool );
	has values => ( is => 'ro', required => 1 );
	has index => ( is => 'ro' );
	has stacked => ( is => 'ro', isa => Bool );
};
package Playfair::Chart::Bar        {
	use Moo;
	use Types::Standard qw( Bool );
	has values => ( is => 'ro', required => 1 );
	has cat => ( is => 'ro' );
	has stacked => ( is => 'ro', isa => Bool );
	has continuous_range => ( is => 'ro' );
};
package Playfair::Chart::BoxPlot    { ...  };
package Playfair::Chart::Donut      { ...  };
package Playfair::Chart::Dot        { ...  };
package Playfair::Chart::HeatMap    { ...  };
package Playfair::Chart::Histogram  { ...  };
package Playfair::Chart::Horizon    { ...  };
package Playfair::Chart::Line       { ...  };
package Playfair::Chart::Scatter    { ...  };
package Playfair::Chart::Step       { ...  };
package Playfair::Chart::Timeseries { ...  };

1;
