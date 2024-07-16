# Memo for Arch Linux

## Package Management 

### Pacman

#### Installing packages
```bash
pacman -S package_name1 package_name2 ...
```

#### Removing packages without dependencies
```bash
pacman -R package_name1 package_name2 ...
```

#### Removing packages with dependencies not used by other packages
```bash
pacman -Rs package_name1 package_name2 ...
```

#### Removing packages with dependencies not used and configuration files
```bash
pacman -Rns package_name1 package_name2 ...
```

#### Removing orphan packages (unused)
```bash
pacman -Rns $(pacman -Qdtq)
```

#### Removing uneeded packages
```bash
pacman -Qqd | pacman -Rsu --print -
```

#### Update the system
```bash
pacman -Syu
```

#### Search for a package
```bash
pacman -Ss string1 string2 ...
```

#### Search for a package already installed
```bash
pacman -Qs string1 string2 ..
```

#### List all packages installed
```bash
pacman -Q
```

#### Display information about a package
```bash
pacman -Qi package_name
```

#### Delete the cache of the packages uninstalled
```bash
pacman -Sc
```

#### Delete all the cache
```bash
pacman -Scc
```
or 
```bash
# paccache -rk1
```

#### Know the name of binary program

```bash
pacman -Qlq package_name | grep /usr/bin/
```

### Makepkg

base-devel is required to use makepkg
for update the package : git pull

#### Install package from AUR

```bash 
git clone https://aur.archlinux.org/package_name.git
cd package_name
makepkg -si
```

#### Remove package from AUR

```bash
sudo pacman -R package_name
```




## Unknow issue on the system

### Check system failure

```bash
systemctl --failed
```

### Check log 

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

### Check time of each commponent during boot

```bash
systemd-analyze
```



## Swap File

### Add a swap file

#### Create a swap file (1)

```bash
# Create a file of 4GB
sudo fallocate -l 4G /swapfile
```

#### Change the permission of the file (2)

```bash
sudo chmod 600 /swapfile
```

#### Format the file (3)

```bash
sudo mkswap /swapfile
```

#### Enable the swap (4)

```bash
sudo swapon /swapfile
```

#### Add permanent swap (5)

```bash
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

#### Check the swap (6)

```bash
sudo swapon --show
```

### Remove a swap file

#### Disable the swap (1)

```bash
sudo swapoff -v /swapfile
```

#### Remove the swap (2)

```bash
sudo rm /swapfile
```

#### Remove the swap from the fstab (3)

```bash
sudo nano /etc/fstab
# Remove the line with the swap file
```

### Realocate the swap file

```bash
sudo fallocate -l 2G /swapfile
```

## Backup with rsync

```bash
rsync -aAXHv --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/home/*/.cache/*' --exclude='/home/*/.local/share/Trash/*' --exclude='/swapfile' --exclude='/lost+found' --exclude='/path/to/backup' / /path/to/backup/folder
```

# Memo Hyprland