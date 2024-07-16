# Thibau1t dotfiles

In this repository, you will find my dotfiles for my Arch Linux system. Additionally, you will a cheatsheet for Arch Linux, Hyperland and some software I use.

## List of software

- [Kitty](https://test.com)

## Software to install on arch linux

```bash
sudo pacman -S git nano git 
```

```bash
paccache
vlc 
curl
tlp
the fuck
zoxide
zsh
kitty
vscode
thunderbird
timeshift
fkill
fzf
git
nano
flameshot
jdk-openjdk
```

## Memo for Arch Linux

### Package Management 

#### Pacman

In pacman.conf :
```text
Color
ParallelDownloads = 5
```

##### Installing packages
```bash
pacman -S package_name1 package_name2 ...
```

##### Removing packages without dependencies
```bash
pacman -R package_name1 package_name2 ...
```

##### Removing packages with dependencies not used by other packages
```bash
pacman -Rs package_name1 package_name2 ...
```

##### Removing packages with dependencies not used and configuration files
```bash
pacman -Rns package_name1 package_name2 ...
```

##### Removing orphan packages (unused)
```bash
pacman -Rns $(pacman -Qdtq)
```

##### Removing uneeded packages
```bash
pacman -Qqd | pacman -Rsu --print -
```

##### Update the system
```bash
pacman -Syu
```

##### Search for a package
```bash
pacman -Ss string1 string2 ...
```

##### Search for a package already installed
```bash
pacman -Qs string1 string2 ..
```

##### List all packages installed
```bash
pacman -Q
```

##### Display information about a package
```bash
pacman -Qi package_name
```

##### Delete the cache of the packages uninstalled
```bash
pacman -Sc
```

##### Delete all the cache
```bash
pacman -Scc
```
or 
```bash
paccache -rk1
```

##### Know the name of binary program

```bash
pacman -Qlq package_name | grep /usr/bin/
```

##### Mirrorlist

```bash
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo reflector --verbose --latest 10 --protocol --sort rate --save /etc/pacman.d/mirrorlist
```

#### Paru 

Manage AUR packages and pacman packages

##### Install package from AUR
```bash
paru -S package_name
```

##### Remove package from AUR
```bash
paru -R package_name
```

##### Remove package from AUR and dependencies
```bash
paru -Rns package_name
```

##### Remove orphan packages
```bash
paru -Rns $(paru -Qdtq)
```

##### Update the system
```bash
paru -Syu
```

##### Display information about a package
```bash
paru -Qi package_name
```


#### Makepkg

base-devel is required to use makepkg
for update the package : git pull

##### Install package from AUR

```bash 
git clone https://aur.archlinux.org/package_name.git
cd package_name
makepkg -si
```

##### Remove package from AUR

```bash
sudo pacman -R package_name
```




### Unknow issue on the system

#### Check system failure

```bash
systemctl --failed
```

#### Check log 

```bash
journalctl -p 3 -xb
# -p 3 : priority 3
# -x : show the full log
# -b : show since the last boot 
```

| Priority | Level |
|----------|-------|
| 0        | emerg |
| 1        | alert |
| 2        | crit  |
| 3        | err   |
| 4        | warn  |
| 5        | notice|
| 6        | info  |
| 7        | debug |

#### Check time of each commponent during boot

```bash
systemd-analyze
```



### Swap File

#### Add a swap file

##### Create a swap file (1)

```bash
# Create a file of 4GB
sudo fallocate -l 4G /swapfile
```

##### Change the permission of the file (2)

```bash
sudo chmod 600 /swapfile
```

##### Format the file (3)

```bash
sudo mkswap /swapfile
```

##### Enable the swap (4)

```bash
sudo swapon /swapfile
```

##### Add permanent swap (5)

```bash
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

##### Check the swap (6)

```bash
sudo swapon --show
```

#### Remove a swap file

##### Disable the swap (1)

```bash
sudo swapoff -v /swapfile
```

##### Remove the swap (2)

```bash
sudo rm /swapfile
```

##### Remove the swap from the fstab (3)

```bash
sudo nano /etc/fstab
# Remove the line with the swap file
```

#### Realocate the swap file

```bash
sudo fallocate -l 2G /swapfile
```

### Backup

#### Use timeshift

#### Create a backup with rsync

```bash
rsync -aAXHv --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/home/*/.cache/*' --exclude='/home/*/.local/share/Trash/*' --exclude='/swapfile' --exclude='/lost+found' --exclude='/path/to/backup' / /path/to/backup/folder
```

#### Restore a backup with rsync

```bash
# boot from a live usb arch linux
mkdir /mnt/system /mnt/usb
lsblk # to know the name of the partition
mount /dev/sdaX /mnt/system
mount /dev/sdaY /mnt/usb
# verify the mount
cd /mnt/system && ls
cd /mnt/usb && ls
# restore the backup
rsync -aAXHv --delete --exclude="lost+found" /mnt/usb/ /mnt/system
# reboot (and after choice Boot existing OS)
```

## Memo Hyprland