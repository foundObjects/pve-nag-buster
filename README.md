## pve-nag-buster 
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
will only run if packages containing those files are changed.

The installer drops the hook script and creates dpkg hooks to call it then adds
the pve-no-subscription repo list and calls the hook script once. There are no
external dependencies beyond the base packages installed with PVE by default
(awk, sed, grep, wget).

### Installation
```sh
wget https://raw.githubusercontent.com/foundObjects/pve-nag-buster/master/install.sh

# Always read scripts downloaded from the internet before running them with sudo
sudo bash install.sh

# or ..
chmod +x install.sh && sudo ./install.sh
```

With Git:
```sh
git clone https://github.com/foundObjects/pve-nag-buster.git

# Always read scripts downloaded from the internet before running them with sudo
cd pve-nag-buster && sudo ./install.sh
```

### Uninstall:
```sh
sudo ./install.sh --uninstall
# remove /etc/apt/sources.list.d/pve-no-subscription.list if desired
```

### Notes:
#### Updating an old copy of the repo

Sorry to those of you who forked the repo before about 2020-01-20; I rewrote
git history to cleanup the commit noise from adding files through GitHub's web
UI originally.

If you need to sync a cloned repo with the new history and haven't made any
changes:

```sh
git fetch --all -p -P
git push -f . origin/master:master
```

If you've made changes to the code:

Migrating to the new master branch should be fairly straightforward, the v02
tag repo state in the new commit history is identical to the repo state before
the rebase.

```sh
# save and commit your work
git commit -a -m "WIP"

# make a backup of your branch Just In Case™
git checkout -b backup
git checkout -

# from your branch
git fetch --all
git rebase -f --onto v02 origin/old-master
```

I highly recommend picking at least the following bugfix commits if you don't
want to track new work in master, they fix a couple of potential problems.

* a260891 hook script: fixed grep test issue
* 427b23b more reliable hook trigger removal

#### Why is there base64 in my peanut-butter?

For convenience the install script also contains a base64 encoded copy of the
hook script, this makes installation possible without access to github or a
full clone of the project directory.

To inspect the base64 encoded script run `./install.sh --emit`; this dumps the
encoded copy to stdout and quits. To install using the stored copy just run
`sudo ./install.sh --offline`, no internet required.

### Credits:

Thanks to John McLaren for his [blog post](https://www.reddit.com/user/seaqueue) documenting the web gui patch.

### Contact:

[Open an issue](https://github.com/foundObjects/pve-nag-buster/issues) on GitHub or contact me as [/u/SeaQueue on Reddit](https://www.reddit.com/user/seaqueue).

Please get in touch if you find a way to improve anything, otherwise enjoy!

