#!/bin/bash

_VERS="v02"

_OUTFILE="pve-nag-buster.sh"

sed "s/__VERSION__/$_VERS/g" src/script > $_OUTFILE

_OUTFILE="install.sh"

sed "s/__VERSION__/$_VERS/g" src/install > $_OUTFILE
xz -z -9 -c pve-nag-buster.sh | base64 >> $_OUTFILE
echo "YEET" >> $_OUTFILE
