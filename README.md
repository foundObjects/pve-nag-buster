pve-nag-buster (v01) https://github.com/foundObjects/pve-nag-buster
Persistent license nag removal for Proxmox VE 5.x

This is a chunk of bash script to persistently remove the license nags from
Proxmox VE.

The main script does two things: remove the unlicensed popup nag from the web gui
and switches from the pve-enterprise repository to pve-no-subscription. This script
is called every time a package updates the web gui javascript library or the
pve-enterprise source list.

There are no external dependencies beyond the base packages installed with PVE
by default (awk, sed, grep, wget).

The script will only run when packages modify the web gui or the enterprise source list

Have a look inside install.sh for the inline code to unpack pve-nag-buster.sh offline
without making an extra call out to github to download pve-nag-buster.sh. I'd have just
packed everything into install.sh by default but making everyone download, unzip and
base64 decode a heredoc to look at what I'm doing seemed rude.

To use: 

	wget https://raw.githubusercontent.com/foundObjects/pve-nag-buster/master/install.sh
	# Read the script
  chmod +x install.sh && ./install.sh


Please get in touch if you find a way to improve this, otherwise enjoy!
