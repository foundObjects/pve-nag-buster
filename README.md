pve-nag-buster  
Persistent license nag removal for Proxmox VE 5.x

This is a chunk of bash script and some dpkg pre/post install hooks to persistently remove the license nags from Proxmox VE.

The main script does two things: remove the unlicensed popup nag from the web gui and switches from the pve-enterprise repository to pve-no-subscription. This script is called every time a package updates the web gui or the
pve-enterprise source list and will only run if packages containing those files are changed. There are no external dependencies beyond the base packages installed with PVE by default (awk, sed, grep, wget).

The install script also contains a base64 encoded copy of pve-nag-buster.sh for use offline. I'd have just packed everything into install.sh by default but making everyone download, unxz and base64 decode a heredoc to look at what I'm doing seemed rude.

To install: 

```
wget https://raw.githubusercontent.com/foundObjects/pve-nag-buster/master/install.sh
# Read the script
chmod +x install.sh && ./install.sh
```

Please get in touch if you find a way to improve this, otherwise enjoy!
