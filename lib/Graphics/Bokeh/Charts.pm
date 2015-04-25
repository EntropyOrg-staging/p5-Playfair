package Graphics::Bokeh::Charts;

use strict;
use warnings;

package Graphics::Bokeh::Chart::Role::Title {
	use Moo;
	use Types::Standard qw( Str Int );
	has title => ( is => 'ro', isa => Str, doc => 'The title of your chart.' );
};
package Graphics::Bokeh::Chart::Role::XAxis {
	use Moo;
	use Types::Standard qw( Str Int Bool );
	has xlabel => ( is => 'ro', isa => Str, doc => 'The x-axis label of your chart.' );
	has xscale => ( is => 'ro', isa => Str, doc => 'The x-axis type scale of your chart.' );
	has xgrid => ( is => 'ro', isa => Bool, doc => 'whether to draw an x-grid.' );
};
package Graphics::Bokeh::Chart::Role::YAxis {
	use Moo;
	use Types::Standard qw( Str Int Bool );
	has ylabel => ( is => 'ro', isa => Str, doc => 'The y-axis label of your chart.' );
	has yscale => ( is => 'ro', isa => Str, doc => 'The y-axis type scale of your chart.' );
	has ygrid => ( is => 'ro', isa => Bool, doc => 'whether to draw an y-grid.' );
};

package Graphics::Bokeh::Chart::Role::Legend {
	use Moo;
	use Types::Standard qw( Str Bool );
	has legend => ( is => 'ro', isa => Str|Bool, doc => 'The legend of your chart.' );
};

package Graphics::Bokeh::ChartRole {
	with qw(Graphics::Bokeh::Chart::Role::Title)
	width (int): the width of your plot in pixels.
	height (int): the height of you plot in pixels.
	tools (str or bool): to enable or disable the tools in your chart.
	palette (list): a list containing the colormap as hex values.
	filename (str or bool): the name of the file where your chart will be written.
	server (str or bool): the name of your chart in the server.
	notebook (bool):if you want to output (or not) your chart into the IPython notebook.
}

package Graphics::Bokeh::Chart::Area       { has [qw(values)]  };
package Graphics::Bokeh::Chart::Bar        { ...  };
package Graphics::Bokeh::Chart::BoxPlot    { ...  };
package Graphics::Bokeh::Chart::Donut      { ...  };
package Graphics::Bokeh::Chart::Dot        { ...  };
package Graphics::Bokeh::Chart::HeatMap    { ...  };
package Graphics::Bokeh::Chart::Histogram  { ...  };
package Graphics::Bokeh::Chart::Horizon    { ...  };
package Graphics::Bokeh::Chart::Line       { ...  };
package Graphics::Bokeh::Chart::Scatter    { ...  };
package Graphics::Bokeh::Chart::Step       { ...  };
package Graphics::Bokeh::Chart::Timeseries { ...  };

1;
