package Playfair::Primitive::Abstract;

use Modern::Perl;

package Playfair::Primitive::Point {
	use Moo;
	use Types::Standard;
	has coordinates => ( is => 'rw', isa => 'ArrayRef[Num]' );
};

package Playfair::Primitive::Circle {
	use Moo;
	use Types::Standard;

	has center => ( isa => 'Playfair::Primitive::Point' );
	has radius => ( isa => 'Num' );
};
package Playfair::Primitive::Rectangle {
	use Moo;
	use Types::Standard;

	has qw[angle width height] => ( isa => 'Num' );
}
package Playfair::Primitive::Polygon { ... }

package Playfair::Primitive::AnnularWedge {
# * x, y - center point coordinates
# * start_radius
# * end_radius
# * start_angle
# * end_angle
# * direction
#   * values: 'clock', 'anticlock'
#   * default: 'anticlock'
  ...
}
package Playfair::Primitive::Annulus { ... }
package Playfair::Primitive::Arc { ... }
package Playfair::Primitive::Bezier { ... }
package Playfair::Primitive::Gear { ... }
package Playfair::Primitive::Glyph { ... }
package Playfair::Primitive::Image { ... }
package Playfair::Primitive::ImageRGBA { ... }
package Playfair::Primitive::ImageURL { ... }
package Playfair::Primitive::Line { ... }
package Playfair::Primitive::MultiLine { ... }
package Playfair::Primitive::Oval { ... }
package Playfair::Primitive::Patch { ... }
package Playfair::Primitive::Patches { ... }
package Playfair::Primitive::Quad { ... }
package Playfair::Primitive::Quadratic { ... }
package Playfair::Primitive::Ray { ... }
package Playfair::Primitive::Segment { ... }
package Playfair::Primitive::Text { ... }
package Playfair::Primitive::Wedge { ... }

package Playfair::Primitive::Asterisk { ... }
package Playfair::Primitive::CircleCross { ... }
package Playfair::Primitive::CircleX { ... }
package Playfair::Primitive::Cross { ... }
package Playfair::Primitive::Diamond { ... }
package Playfair::Primitive::DiamondCross { ... }
package Playfair::Primitive::InvertedTriangle { ... }
package Playfair::Primitive::Square { ... }
package Playfair::Primitive::SquareCross { ... }
package Playfair::Primitive::SquareX { ... }
package Playfair::Primitive::Triangle { ... }
package Playfair::Primitive::X { ... }

1;
