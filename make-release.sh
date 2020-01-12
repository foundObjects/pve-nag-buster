#!/bin/sh

_VERS="v02"
_BRANCH=$(git branch --show-current) ||
  { echo "can't poll branch, defaulting to master" && _BRANCH="master"; }

# update versions before packing install.sh
sed -i \
  -e "s;(v[[:digit:]][[:digit:]]);($_VERS);" \
  -e "s;nag-buster/.*/;nag-buster/$_BRANCH/;" \
  pve-nag-buster.sh install.sh README.md
#sed -i -e "s/([v[[:digit:]][[:digit:]])/($_VERS)/" pve-nag-buster.sh install.sh
#sed -i -e "s;nag-buster/.*/;nag-buster/$_BRANCH/;" install.sh README.md

# I have no idea what I'm doing 🐶
#awk 'FNR==NR{s=(!s)?$0:s RS $0;next} /__BASE64__/{sub(/__BASE64__/, s)} 1' \
#  <(xz -z -9 -c pve-nag-buster.sh | base64) src/install > install.sh

# TODO: there's probably a two liner to handle all of this in awk

# pack install.sh
{
  head -n"$(grep -n "<< 'YEET'" install.sh | cut -d: -f1)" install.sh
  xz -z -9 -c pve-nag-buster.sh | base64
  tail -n+"$(grep -n '^YEET$' install.sh | cut -d: -f1)" install.sh
} > foofile
cat foofile > install.sh
rm -f foofile

