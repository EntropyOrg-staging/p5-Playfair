package Playfair::Primitive::Abstract;

use Modern::Perl;

package Playfair::Style::Line {
	use Moo;
}

package Playfair::Style::Fill {
	use Moo;
}

package Playfair::Primitive::Style::Fillable {
	use Moo::Role;
	has fill_style => ( is => 'ro', isa => 'Playfair::Style::Fill' );
};

package Playfair::Primitive::Style::Lineable {
	use Moo::Role;
	has line_style => ( is => 'ro', isa => 'Playfair::Style::Line' );
};


package Playfair::Geometry::Role::Positionable {
	use Moo::Role;
	requires 'position';
};

package Playfair::Geometry::AbsolutePosition {
	use Moo;
	use Types::Standard;

	has position => ( is => 'rw', isa => 'Playfair::Primitive::Point' );
};

package Playfair::Primitive::Point {
	use Moo;
	use Types::Standard;
	has coordinates => ( is => 'rw', isa => 'ArrayRef[Num]' );
}

package Playfair::Primitive::Circle {
	use Moo;
	use Types::Standard;

	has center => ( handles => 'Playfair::Geometry::Role::Positionable' );
	has radius => ( isa => 'Num' );
#   │   * x, y - center point coordinates                                                                                                                                                         │   * x, y - center point coordinates                                                                                                                                                        │
#   │   * size                                                                                                                                                                                    │   * radius                                                                                                                                                                                 │
#   │   * Line Properties                                                                                                                                                                         │   * Line Properties                                                                                                                                                                        │
#   │   * Fill Properties                                                                                                                                                                         │   * Fill Properties                                                                                                                                                                        │
}
package Playfair::Primitive::Rectangle {
	use Moo;
	use Types::Standard;

	has qw[angle width height] => ( isa => 'Num' );
#   The rect glyph displays rectangles centered on the given coordinates with the given dimensions and angle.
#
#   Note
#
#   the dilate field may be used to indicate whether computed pixel distances should always be rounded up when rendering this glyph.
#
#     * x, y - center point coordinates
#     * width
#     * height
#     * angle
#
#          * default: 0
#
#     * dilate
#
#          * default: False
#
#     * Line Properties
#     * Fill Properties
}
package Playfair::Primitive::Polygon {
...
}

package Playfair::Primitive::AnnularWedge {
	use Moo;
	with qw(Playfair::Primitive::Style::Lineable Playfair::Primitive::Style::Fillable);

	has center => ( is => 'rw', handles => 'Playfair::Geometry::Role::Positionable' ); # TODO coerce?
	has [ qw(start_radius end_radius) ] => ( is => 'rw', isa => 'Num' );
	has [ qw(start_angle end_angle) ] => ( is => 'rw', isa => 'Num' );
	has [ qw(angular_direction) ] => ( is => 'rw', isa => 'Str', default => sub { 'anticlock' }  ); # * values: 'clock', 'anticlock'
}
package Playfair::Primitive::Annulus {
	use Moo;
	with qw(Playfair::Primitive::Style::Lineable Playfair::Primitive::Style::Fillable);

	has center => ( is => 'rw', handles => 'Playfair::Geometry::Role::Positionable' ); # TODO coerce?
	has [ qw(start_radius end_radius) ] => ( is => 'rw', isa => 'Num' );
}

package Playfair::Primitive::Arc {
	use Moo;
	with qw(Playfair::Primitive::Style::Lineable);

#     * x, y - center point coordinates
#     * radius
#     * start_angle
#     * end_angle
#     * direction
#
#          * values: ['clock' or 'anticlock']
#          * default: 'anticlock'
#
#     * Line Properties
...
}
package Playfair::Primitive::Bezier {
	use Moo;
#   The bezier glyph displays Bezier curves with the given starting, ending, and control points.
#
#     * x0, y0 - starting point coordinates
#     * x1, y1 - ending point coordinates
#     * cx0, cy0 - first control point coordinates
#     * cx1, cy1 - second control point coordinates
#     * Line Properties
...
}
package Playfair::Primitive::Gear {
	use Moo;
...
}
package Playfair::Primitive::Glyph {
	use Moo;
...
}
package Playfair::Primitive::Image {
	use Moo;
#   The image glyph takes each image as a two-dimensional array of data. A palette (string name of a built-in palette, currently) must also be supplied to use for color-mapping the scalar image.
#
#   Note
#
#   the dilate field may be used to indicate whether computed pixel distances (e.g. for dw, dh) should always be rounded up when rendering this glyph.
#
#   Note
#
#   The image glyph is vectorized like other glyphs, i.e. it may be used to display several images at once.
#
#     * image - 2D array of data
#     * x, y - lower left
#     * dw - width on screen
#     * dh- height on screen
#     * palette
#     * dilate
#
#          * default: False
...
}
package Playfair::Primitive::ImageRGBA {
	use Moo;
#   The image_rgba glyph takes each image as a two-dimensional array of RGBA values (encoded as 32-bit integers).
#
#   Note
#
#   the dilate field may be used to indicate whether computed pixel distances (e.g. for dw, dh) should always be rounded up when rendering this glyph.
#
#   Note
#
#   The image_rgba glyph is vectorized like other glyphs, i.e. it may be used to display several images at once.
#
#     * image - 2D array of RGBA
#     * x, y - lower left
#     * dw - width on screen
#     * dh- height on screen
#     * dilate
#
#          * default: False
...
}
package Playfair::Primitive::ImageURL {
	use Moo;
#   The image_url glyph accepts the URLs of an images to display. The images are centered on the given coordinates and rotated by the given angles.
#
#     * x, y - center point coordinates
#     * url
#     * angle
...
}
package Playfair::Primitive::Line {
	use Moo;
#   The line glyph displays a single line that connects several points given by the arrays of coordinates x and y.
#
#     * x, y - line coordinates
#     * Line Properties
...
}
package Playfair::Primitive::MultiLine {
	use Moo;
#   The multi_line glyph displays several lines, each with points given by the arrays of coordinates that are the elements of xs and ys. This glyph is especially useful for implementing parallel coordinates plots, or plotting several aligned series simultaneously.
#
#   Note
#
#   For this glyph, the vector data is not simply an array of scalars, it is really an “array of arrays”.
#
#     * xs, ys - lists of line coordinates
#     * Line Properties
...
}
package Playfair::Primitive::Oval {
	use Moo;
#   The oval glyph displays ovals centered on the given coordinates with the given dimensions and angle.
#
#     * x, y - center point coordinates
#     * width
#     * height
#     * angle
#
#          * default: 0
#
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::Patch {
	use Moo;
#   The patch glyph displays a single polygonal patch that connects several points given by the arrays of coordinates x and y.
#
#     * x, y - coordinates
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::Patches {
	use Moo;
#   The patches glyph displays several patches, each with points given by the arrays of coordinates that are the elements of xs and ys. This glyph is especially useful for implementing stacked area charts and cartograms.
#
#   Note
#
#   For this glyph, the vector data is not simply an array of scalars, it is really an “array of arrays”.
#
#     * xs, ys - lists of coordinates
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::Quad {
	use Moo;
#   The quad glyph displays axis-aligned rectangles with the given dimensions.
#
#     * left
#     * right
#     * top
#     * bottom
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::Quadratic {
	use Moo;
#   The quadratic glyph displays quadratic curves with the given starting, ending, and control points.
#
#     * x0, y0 - starting point coordinates
#     * x1, y1 - ending point coordinates
#     * cx, cy - control point coordinates
#     * Line Properties
...
}
package Playfair::Primitive::Ray {
	use Moo;
#   The ray glyph displays line segments starting at the given coordinate and extending the given length at the given angle.
#
#     * x0, y0 - starting point coordinates
#     * length - screen units
#     * angle
#
#          * default: 0
#
#     * Line Properties
...
}
package Playfair::Primitive::Segment {
	use Moo;
#   The segment glyph displays line segments with the given starting and ending coordinates.
#
#     * x0, y0 - starting point coordinates
#     * x1, y1 - ending point coordinates
#     * Line Properties
...
}
package Playfair::Primitive::Text {
	use Moo;
#   The text glyph displays text at the given coordinates rotated by the given angle. The location of the coordinates relative to the text is indicated by the text properties.
#
#     * x, y - text coordinates (positioning determined by text properties)
#     * text
#     * angle
#
#          * default: 0
#
#     * Text Properties
...
}
package Playfair::Primitive::Wedge {
	use Moo;
#   The annular_wedge glyph displays circular wedges centered at the given coordinates with the corresponding radius, start_angle and end_angle.
#
#   Note
#
#   the direction field may be used to indicate which direction the drawing should occur between start_radius and end_radius.
#
#     * x, y - center point coordinates
#     * radius
#     * start_angle
#     * end_angle
#     * direction
#
#          * values: ['clock' or 'anticlock']
#          * default: 'anticlock'
#
#     * Line Properties
#     * Fill Properties
...
}

package Playfair::Primitive::Asterisk {
	use Moo;
#     * x, y - center point coordinates
#     * size
#     * Line Properties

...
}
package Playfair::Primitive::CircleCross {
	use Moo;
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties

...
}
package Playfair::Primitive::CircleX {
	use Moo;
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::Cross {
	use Moo;
#     * x, y - center point coordinates
#     * size
#     * Line Properties
...
}
package Playfair::Primitive::Diamond {
	use Moo;
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::DiamondCross {
	use Moo;
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::InvertedTriangle {
	use Moo;
#   The inverted_triangle glyph is a marker that displays upside-down triangles at the given coordinates.
#
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::Square {
	use Moo;
#   The square glyph is a marker that displays squares at the given coordinates.
#
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::SquareCross {
	use Moo;
#   The square_cross glyph is a marker that displays squares together with a crossbar (+) at the given coordinates.
#
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::SquareX {
	use Moo;
#   The square_x glyph is a marker that displays squares together with an X at the given coordinates.
#
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::Triangle {
	use Moo;
#   The triangle glyph is a marker that displays triangles at the given coordinates.
#
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}
package Playfair::Primitive::X {
	use Moo;
#   The x glyph is a marker that displays X symbols at the given coordinates.
#
#     * x, y - center point coordinates
#     * size
#     * Line Properties
#     * Fill Properties
...
}

1;
