#!/bin/sh

export perl_version=`perl -MConfig -e 'print $Config{version}'`

## Make sure we have our local::lib
(
  cd local-lib
  perl Makefile.PL --bootstrap=~/.perl5/$perl_version
  make test && make install
)


## Ok, now use it to setup our environment
eval $(perl -I$HOME/.perl5/$perl_version/lib/perl5 -Mlocal::lib=$HOME/.perl5/$perl_version/)

## After Mac::Carbon, the location of .cpan changes (!!)
cpan_in_app_support="$HOME/Library/Application Support/.cpan"
if [ -d "$cpan_in_app_support" ] ; then
  mv "$cpan_in_app_support" "${cpan_in_app_support}.old"
fi
if [ ! -e "$cpan_in_app_support" ] ; then
  ln -s $HOME/.cpan "$cpan_in_app_support"
fi

## Run once to configure it
cpan

## And now for our deps
exec ./install_deps.sh
