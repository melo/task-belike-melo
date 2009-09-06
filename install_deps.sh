#!/bin/sh

distro_prefs="$HOME/.cpan/prefs"

if [ ! -e "$distro_prefs" ] ; then
  mkdir -p "$distro_prefs"
fi
if [ -e "$distro_prefs" ] ; then
  cp -r prefs/ "$distro_prefs"
fi

export perl_version=`perl -MConfig -e 'print $Config{version}'`
eval $(perl -I$HOME/.perl5/$perl_version/lib/perl5 -Mlocal::lib=$HOME/.perl5/$perl_version/)

cd Task-Bootstrap/Task-Bootstrap-1.0
PERL_MM_USE_DEFAULT=1 cpan .
