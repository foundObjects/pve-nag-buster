#!/bin/bash

# pve-nag-buster (v01) https://github.com/foundObjects/pve-nag-buster
# Copyright (C) 2019 /u/seaQueue (reddit.com/u/seaQueue)
#
# Removes Proxmox VE license nags, with persistence, and switches to free repo
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# create dpkg pre/post install hooks for persistence

cat <<'EOF' >/etc/apt/apt.conf.d/86pve-nags
DPkg::Pre-Install-Pkgs {
    "while read -r pkg; do case $pkg in *proxmox-widget-toolkit* | *pve-manager*) touch /tmp/.pve-nag-buster && exit 0; esac done < /dev/stdin";
};

DPkg::Post-Invoke {
    "[ -f /tmp/.pve-nag-buster ] && /usr/share/pve-nag-buster.sh && rm -f /tmp/.pve-nag-buster; exit 0";
};
EOF

# fetch the post-install patch script, patches license nag and switches to pve-no-subscription repository as needed

if true ; then
  wget https://raw.githubusercontent.com/foundObjects/pve-nag-buster/master/pve-nag-buster.sh \
      -O "/usr/share/pve-nag-buster.sh" && \
      chmod +x "/usr/share/pve-nag-buster.sh" && \
      /usr/share/pve-nag-buster.sh

  exit 0
fi

# this is the end, example offline code below

# Example code for inclusion into host provisioning scripts offline: this is just pve-nag-buster.sh
# run through "xz -z -9 -c pve-nag-buster.sh | base64" to avoid needing to fetch the script from github
# To use this installer offline just nuke the entire if block above.

# Important: if you're not me you should probably decode this and read it to make sure I'm not doing
#            something malicious like mining dogecoin or stealing your valuable cat pictures

# pve-nag-buster.sh (v01) inline:

base64 -d <<"YEET"| unxz > "/usr/share/pve-nag-buster.sh" && \
    chmod +x "/usr/share/pve-nag-buster.sh" && \
    /usr/share/pve-nag-buster.sh
/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4AbbA/9dABGIQkY99Bhqpmevep/kIs9shoiNvzAP074w
LI3FnbhLtpij4weS6JtWQK59Kz5tjbWnQyPF33jFXvJXaoUNWDu1jNCPGEbx8L/Xao1oj9pvY3Kg
1uiwbnqiftvfLzce1BEOAIUfKx6NxUsQw0yWhAv0JKdDQzr3V0epamt9elk5d70l1zQjzdqBel0n
MCOUBTlwqQOktYeTk/xN+kDwaypdomKFT1+9ww5z5LXzOkyejfyOHwymxN4PPyp5+gK4KoqWPtf6
l7uUpjOP/ZG8zQpLV7Or6U2aVfS+fL9XM8ggm+FuxVYUUzDpEMvIhmuCtwPNMkCNkE4kRIVA9zMZ
SA6DY0RQm0XtBzYYUogh9DoomwVHoe6JCldYK1ONpwkM8fV7Te2L4MX8P8L7CykAP1/gmKfG7lWG
YsVyaKPaXqSEC4wmJyAYoPUTzUjDgkbNPq27NGwsoDL6nfLZvcgsjnm9iUMPK14Cumy1+lQkFRBY
RIA7QsrUdgzbAW2ziFI+mNpLhvjPzqARyUseY+Cfe4JQ8XTQ6pjUyWNsXEr417d1ZWE89TjvwD4r
BLVtmDBL9A9XOpyBqyD89YjSt5HQ4WGG91uyal00SAQuG14QKbDcbivdxomt4SaCKfsbjUoJNQgj
ILc+eM0aRtbfVvs0zbQXedNThuYWI/prka5Rbj3X8xGH9vS9//N4jzYiP9NJHrs0YedsN+FJqMop
iot3j+ur19Ag+f5ZSn+lS6Cd3opxlbOZzDTL8hf2YFKv7z7A0lcdOw5KA6lHk0rDmIZQYYB/tj8l
ELTO2MDPxgVquEl/FUEYy5mUV6pE6aBYmedYVY5ytDoWJJGfPjsSZ6lvb13Y1c4z35kXB4eod8PN
lcfepv9xS3DcozMaDEebsNcnGGyeWpwHGcwMPnB3TxtbD91O8fEbvK9SxmoW2fCUl8onI1LinqaR
bxvUSoA2LJiePaM0cxRSZr4ZrHiPq4RzzPgbkDnxR1/MYEFrVshR1W3VJt7sTPhC6aTiusUWM32p
/E6Y3lTngiNTMyneJBty0pSZR8SgNwhMJ3Raz5IpdFyfzt/Npl6xNBSBiTvdWVkYFV9zsun2U50F
FVnRHqi1sh32eLKyKWiBycpuJY5xxgCeyPlVvP5SbXckeOwcXzHYMsA6WcqSae7OWH+RxMi9quwH
LgF8djkl0IwanR3SvkJyaNrpter3uxL42XPFw87UhSEswd5VYSCrzRdS1YXmTOO6wPvpS8t1FRMP
Sai0j7ok3zAz9108x5K6lVLW/4294nKTP1w86AtTG5i1rrgZiAwCSS8CFzegOp+PzMu1upRIDdjP
dQ7DHmJLOfhz8DjgDGYl6W2D/fEZ29rAhPpTOQAAoYLMaRbKxHsAAZsI3A0AAO7s3uCxxGf7AgAA
AAAEWVo=
YEET
