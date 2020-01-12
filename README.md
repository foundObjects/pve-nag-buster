# pve-nag-buster 
https://github.com/foundObjects/pve-nag-buster

This is a dpkg post install hook script that persistently removes license nags
from Proxmox VE 5.x and up. Install it once and you won't see another license
nag until Proxmox changes their web-ui code significantly.

Please support the Proxmox team by [buying a subscription](https://www.proxmox.com/en/proxmox-ve/pricing) if it's within your
means. High quality open source software like Proxmox needs our support!

### How does it work?

The included hook script removes the "unlicensed node" popup nag from the web
gui and disables the pve-enterprise repository list. This script is called
every time a package updates the web gui or the pve-enterprise source list and
will only run if packages containing those files are changed. The installer
drops the hook script and creates dpkg hooks to call it then adds the
pve-no-subscription repo list. There are no external dependencies beyond the
base packages installed with PVE by default (awk, sed, grep, wget).

### Installation
```
wget https://raw.githubusercontent.com/foundObjects/pve-nag-buster/master/install.sh
# Always read scripts downloaded from the internet before running them with sudo
chmod +x install.sh && sudo ./install.sh
```

With Git:
```
git clone https://github.com/foundObjects/pve-nag-buster.git
# Always read scripts downloaded from the internet before running them with sudo
cd pve-nag-buster && sudo ./install.sh
```

### Uninstall:
```
./install.sh --uninstall
# remove /etc/apt/sources.list.d/pve-no-subscription.list if desired
```

### Notes:
#### Why is there base64 in my peanut-butter?

For convenience the install script also contains a base64 encoded copy of the
hook script, this makes installation possible without access to github or a
full clone of the project directory.

To inspect the base64 encoded script run `./install.sh --emit`; this dumps the
encoded copy to stdout and quits. To install using the stored copy just run
`sudo ./install.sh --offline`, no internet required.

#### Support for PVE packages on non-PVE systems

If you're doing something weird like running PVE packages installed on top of
Ubuntu you'll need to edit install.sh and set the RELEASE in the \_install
function to something sane that'll work on your system.  As of now (2020-01-09)
that's probably "buster". One of these days I'll add some logic to translate
from various Ubuntu releases to an appropriate PVE repo debian codename. I
suspect this'll be Bionic & Focal --> buster; I have no idea about Xenial,
maybe stretch? I could use feedback from someone doing this.

#### Git repo history

Sorry to all 5 of you who forked the repo before about 2020-01-20; I rewrote
git history to cleanup the commit noise from adding files through GitHub's web UI
originally.

Migrating to the new master branch should be fairly straightforward, the v02 tag
repo state is identical to the repo state before the rewrite.

```
# save and commit your work
git commit -a -m "WIP"

# make a backup of your branch Just In Case™
git checkout -b backup
git switch -

git fetch --all
git rebase -f --onto v02 origin/old-master <your branch here>
```
At this point you can merge into master or pick commits to merge into your work.

I highly recommend picking at least the following commits if you don't want to
track master. They fix a couple of potential problems and the v02 branch cleans
up the source tree quite a bit.

* 3fa4e7d (tag: v02a, v02) fixup for v02a release
* 674e924 rewrite make-release script to drop templates
* a260891 hook script: fixed grep test issue
* 427b23b more reliable hook trigger removal

### Credits:

Thanks to John McLaren for his [blog post](https://www.reddit.com/user/seaqueue) documenting the web gui patch:

### Contact:

[Open an issue](https://github.com/foundObjects/pve-nag-buster/issues) on GitHub or contact me as [/u/SeaQueue on Reddit](https://www.reddit.com/user/seaqueue).

Please get in touch if you find a way to improve anything, otherwise enjoy!

