#!/bin/sh

_VERS="v04"
_BRANCH=$(git rev-parse --abbrev-ref HEAD) >/dev/null 2>&1  ||
  { echo "can't poll branch, defaulting to master" && _BRANCH="master"; }

# update versions before packing install.sh
sed -i -r \
  -e "s;\(v[[:digit:]][[:digit:]].?\);\($_VERS\);" \
  -e "s;(nag-buster/).*(/(pve-nag-buster|install)\.sh);\1$_BRANCH\2;" \
  pve-nag-buster.sh install.sh README.md

# TODO there's probably a two liner to handle all of this in awk:

# pack install.sh
{
  head -n"$(grep -n "<< 'YEET'" install.sh | cut -d: -f1)" install.sh
  xz -z -9 -c pve-nag-buster.sh | base64
  tail -n+"$(grep -n '^YEET$' install.sh | cut -d: -f1)" install.sh
} > foofile
cat foofile > install.sh
rm -f foofile

