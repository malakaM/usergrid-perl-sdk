use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker;

WriteMakefile(
  LICENSE => 'apache',
  AUTHOR => 'Anuradha Weeraman <anuradha@cpan.org',
  ABSTRACT => 'Client SDK for Apache Usergrid',
  NAME => 'Usergrid-Client',
  VERSION_FROM => 'lib/Usergrid/Client.pm',
  PREREQ_PM => {
    'Moose' => 0,
    'JSON' => 0,
    'REST::Client' => 0
  },
  BUILD_REQUIRES => {
    'Test::More' => '0.98'
  }
);
