#!/bin/sh

## Make sure we have our local::lib
cd local-lib
perl Makefile.PL --bootstrap=~/.perl5/`perl -MConfig -e '$Config{version}'`
make test && make install

## Ok, now use it to setup our environment
export perl_version=`perl -MConfig -e 'print $Config{version}'`
eval $(perl -I$HOME/.perl5/$perl_version/lib/perl5 -Mlocal::lib=$HOME/.perl5/$perl_version/)

## Run once to configure it
cpan

## And now for our deps
cd Task-Bootstrap/Task-Bootstrap-*
PERL_MM_USE_DEFAULT=1 cpan .