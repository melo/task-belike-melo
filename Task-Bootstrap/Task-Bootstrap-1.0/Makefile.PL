
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Task-Bootstrap',
  NAME      => 'Task::Bootstrap',
  AUTHOR    => 'Pedro\ Melo\ \<melo\@cpan\.org\>',
  ABSTRACT  => 'All\ the\ modules\ I\ want',
  VERSION   => '1.0',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Mojo" => '0',
    "AnyEvent" => '0',
    "Task::Kensho" => '0',
    "Coro" => '0',
    "AnyEvent::HTTPD" => '0',
    "Test::More" => '0.92',
    "Async::Hooks" => '0',
    "Dist::Zilla" => '0',
    "AnyEvent::XMPP" => '0',
  },
);
