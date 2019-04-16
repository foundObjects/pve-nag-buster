pve-nag-buster  
Persistent license nag removal for Proxmox VE 5.x

A bash script and dpkg pre/post install hooks to persistently remove the license nags from Proxmox VE 5.x.

The main script does two things: it removes the "unlicensed node" popup nag from the web gui and it switches repositories from pve-enterprise to pve-no-subscription. The script is called every time a package updates the web gui or the
pve-enterprise source list and will only run if packages containing those files are changed. There are no external dependencies beyond the base packages installed with PVE by default (awk, sed, grep, wget).

For your convenience the install script also contains a base64 encoded copy of pve-nag-buster.sh for use offline. I'd have just packed everything into install.sh by default but making everyone download, unxz and base64 decode a HEREDOC to look at my code seemed rude.

To install: 

```
wget https://raw.githubusercontent.com/foundObjects/pve-nag-buster/master/install.sh
# Read the script
chmod +x install.sh && ./install.sh
```

Please get in touch if you find a way to improve anything, otherwise enjoy!
