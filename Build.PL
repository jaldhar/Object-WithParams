use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Object::WithParams',
    license             => 'perl',
    dist_author         => q{Jaldhar H. Vyas <jaldhar@braincells.com>},
    dist_version_from   => 'lib/Object/WithParams.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Object-WithParams-*' ],
    create_makefile_pl  => 'small',
    sign                => 1,
);

$builder->create_build_script();
