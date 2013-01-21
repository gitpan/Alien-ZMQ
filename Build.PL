use v5.10.1;
use warnings FATAL => 'all';
use strict;

use lib 'inc';
use File::Path qw/make_path/;
use My::Build;

# prevent warnings about missing share directory
make_path("share");

my $builder = My::Build->new(
      'build_requires' => {
    'Module::Build' => '0.3601',
    'Test::More' => '0'
  },
  'configure_requires' => {
    'ExtUtils::CBuilder' => '0.280205',
    'IPC::Run' => '0',
    'LWP::Simple' => '0',
    'Module::Build' => '0.3601'
  },
  'requires' => {
    'String::ShellQuote' => '0',
    'strict' => '0',
    'warnings' => '0'
  },
      'dist_abstract' => 'detect and/or install zeromq',
  'dist_name' => 'Alien-ZMQ',
  'license' => 'perl',
      'dist_author' => [
    'Charles McGarvey <ccm@cpan.org>'
  ],
    dist_version_from => "lib/Alien/ZMQ.pm",
    share_dir => "share",
);
$builder->notes('zmq-version', '3.2.2');
$builder->notes('zmq-sha1', '0e8734c773b6a757b474c16fc3c517993ba47283');

$builder->create_build_script;
