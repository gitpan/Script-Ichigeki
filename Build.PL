use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    license        => 'perl',
    dynamic_config => 0,
    dist_abstract  => 'Perl extention for one time script.',

    build_requires     => {
        'Test::More'     => '0.98',
        'Test::Requires' => '0.06',
    },
    configure_requires => { 'Module::Build' => '0.38' },
    requires           => {
        perl         => '5.008001',
        'Mouse'         => 0,
        'Time::Piece'   => 0,
        'Path::Class'   => 0,
        'File::Tee'             => 0,
        'IO::Prompt::Simple'    => 0,
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'Script/Ichigeki',
    module_name => 'Script::Ichigeki',

    # script_files => [''],

    test_files           => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,

    create_makefile_pl => 'traditional',
    create_readme      => 1,
    create_license     => 1,
);
$build->create_build_script;
