use strict;
use warnings;
use Test::More;
use Test::Warn;
use Number::Fraction ':mixed';

eval "use Test::Warn";
plan skip_all => "'Test::Warn' required for testing 3 arguments options" if $@;

my $frac = undef;

$frac = eval { Number::Fraction->new( 1, 2, 5 ) };
ok($frac = 1.40, # 1 + 2/5
    "new(1, 2, 5) = 1.40 -- 1 + 2/5");

my $frac1 = eval { Number::Fraction->new( 2, 3, 4 ) };
ok($frac = 2.75, # 2 + 3/4
    "new(2, 3, 4) = 2.75 -- 2 + 3/4");
my $frac2 = eval { Number::Fraction->new( 3, 4, 5 ) };
ok($frac = 3.80, # 3 + 4/5
    "new(3, 4, 5) = 3.80 -- 3 + 4/5");
my $fract = eval { Number::Fraction->new( 6, 11, 20 ) };
ok($frac = 6.55, # 2_15/20 + 3_16/20
    "new( 6, 11, 20 )");

my $frac3 = $frac1 + $frac2;
ok($frac3 == $fract, "adding two fractions created from 3 arguments");

$frac = eval { Number::Fraction->new( 3 .. 5 ) };
ok($frac == 3.80, # 3 + 4/5
    "new( 3 .. 5 ) != 3.80 -- this will never be evaluated, it's bad");

done_testing();
