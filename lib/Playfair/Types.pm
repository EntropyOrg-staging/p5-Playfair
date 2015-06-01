package Playfair::Types;

use strict;
use warnings;

   
use Type::Library
	-base,
	-declare => qw( AngularDirection );
use Type::Utils -all;
use Types::Standard -types;

declare AngularDirection as enum( AngularDirection => [qw/ clockwise anticlockwise /] );



1;
