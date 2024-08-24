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

#### Know the name of binary program

```bash
pacman -Qlq package_name | grep /usr/bin/
```

#### Mirrorlist

```bash
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo reflector --verbose --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

### Makepkg

#### Install package from AUR

```bash
git clone https://aur.archlinux.org/package_name.git
cd package_name
makepkg -si
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

| Priority | Level  |
| -------- | ------ |
| 0        | emerg  |
| 1        | alert  |
| 2        | crit   |
| 3        | err    |
| 4        | warn   |
| 5        | notice |
| 6        | info   |
| 7        | debug  |

### Check time of each commponent during boot

```bash
systemd-analyze
```

## Backup

### Use timeshift

```bash
sudo -E timeshift-gtk
```

### Create a backup with rsync

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

## Virtual Box

Launch the kernel modules

```bash
modprobe vboxdrv
```
