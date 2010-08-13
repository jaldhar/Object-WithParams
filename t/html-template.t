#!/usr/bin/perl

# Test that our object works with HTML::Template
use Test::More tests => 1;
use English qw( -no_match_vars );
use Object::WithParams;
use strict;
use warnings;

my @modules = qw/ HTML::Template Test::LongString /;

foreach my $module (@modules) {
    eval "use $module";
    if ( $@ ) {
        plan( skip_all => "$module not available for testing" );
    }
}

my $owp = Object::WithParams->new;
$owp->param(
    title => 'rainbow', 
    spectrum => [ {color => 'red'}, {color => 'orange'}, {color => 'yellow'},
        {color => 'green'}, {color => 'blue'}, {color => 'indigo'}, 
        {color => 'violet'}, ],
);

my $template = <<'-EOT-';
<tmpl_var title>
<tmpl_loop spectrum>
<tmpl_var color>
</tmpl_loop>
-EOT-

my $expected = <<'-EOT-';
rainbow

red

orange

yellow

green

blue

indigo

violet

-EOT-

my $ht = HTML::Template->new_scalar_ref(\$template, associate => $owp);

is_string($ht->output, $expected, 'HTML::Template output');

1;
