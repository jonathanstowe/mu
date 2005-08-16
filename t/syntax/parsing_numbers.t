#!/usr/bin/pugs

use v6;
use Test;

=pod

_ should be allowed in numbers

=cut

plan 15;

my $tot = 0;

++$tot for 1 .. 1_0;

is $tot, 10, "Single imbedded underscore works";

++$tot for 1 .. 1_____0;
is $tot, 20, "Multiple imbedded undscores works";

++$tot for 1 .. 10_;
is $tot, 30, "Single Trailing underscore works";

++$tot for 1 .. 10____;
is $tot, 40, "Multiple Trailing underscore works";

++$tot for 1 .. 1_0_;

is $tot, 50, "Single imbedded and trailing underscores works together";

++$tot for 1 .. 1___0___;

is $tot, 60, "Multiple imbedded and trailing underscores works together";

$tot += 3.1_41;

is $tot, 63.141, "Underscores work with floating point after decimal";

$tot += 10__0.8;

is $tot, 163.941, "Underscores work with floating point before decimal";

$tot += 0xdead__beef;

is $tot, 3735928722.941, "Underscores work with hex";

$tot -= 0b1101_1110_1010_1101____1011_1111_0110_1000;

$tot = int $tot;

is $tot, 42, "Underscores work with binary";

is 2e0_1, 20, "Underscores work in the argument for e";

# Ambiguity tests, see thread "Ambiguity of parsing numbers with
# underscores/methods" on p6l started by Ingo Blechschmidt:
# http://www.nntp.perl.org/group/perl.perl6.language/22769
dies_ok { 2.e123 }, "2.e123 parses as method call";
dies_ok { 2._foo }, "2._foo parses as method call";
dies_ok { 2._e23 }, "2._23  parses as method call";
dies_ok { 2.foo  }, "2.foo  parses as method call";
