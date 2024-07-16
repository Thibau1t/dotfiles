# Thibau1t dotfiles

In this repository, you will find my dotfiles for my Arch Linux system. Additionally, you will a cheat sheet for Arch Linux, Hyperland and some software I use


<!-- vscode-markdown-toc -->
* 1. [List of software](#Listofsoftware)
* 2. [Memo for Arch Linux](#MemoforArchLinux)
	* 2.1. [Package Management](#PackageManagement)
		* 2.1.1. [Pacman](#Pacman)
		* 2.1.2. [Makepkg](#Makepkg)
	* 2.2. [Unknow issue on the system](#Unknowissueonthesystem)
		* 2.2.1. [Check system failure](#Checksystemfailure)
		* 2.2.2. [Check log](#Checklog)
		* 2.2.3. [Check time of each commponent during boot](#Checktimeofeachcommponentduringboot)
	* 2.3. [Swap File](#SwapFile)
		* 2.3.1. [Add a swap file](#Addaswapfile)
		* 2.3.2. [Change the permission of the file (2)](#Changethepermissionofthefile2)
		* 2.3.3. [Format the file (3)](#Formatthefile3)
		* 2.3.4. [Enable the swap (4)](#Enabletheswap4)
		* 2.3.5. [Add permanent swap (5)](#Addpermanentswap5)
		* 2.3.6. [Check the swap (6)](#Checktheswap6)
		* 2.3.7. [Remove a swap file](#Removeaswapfile)
		* 2.3.8. [Realocate the swap file](#Realocatetheswapfile)
	* 2.4. [Backup with rsync](#Backupwithrsync)
* 3. [Memo Hyprland](#MemoHyprland)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->




##  1. <a name='Listofsoftware'></a>List of software

- [Kitty](https://test.com)

##  2. <a name='MemoforArchLinux'></a>Memo for Arch Linux

###  2.1. <a name='PackageManagement'></a>Package Management 

####  2.1.1. <a name='Pacman'></a>Pacman

#####  1.1.1. <a name='Installingpackages'></a>Installing packages
```bash
pacman -S package_name1 package_name2 ...
```

#####  1.1.2. <a name='Removingpackageswithoutdependencies'></a>Removing packages without dependencies
```bash
pacman -R package_name1 package_name2 ...
```

#####  1.1.3. <a name='Removingpackageswithdependenciesnotusedbyotherpackages'></a>Removing packages with dependencies not used by other packages
```bash
pacman -Rs package_name1 package_name2 ...
```

#####  1.1.4. <a name='Removingpackageswithdependenciesnotusedandconfigurationfiles'></a>Removing packages with dependencies not used and configuration files
```bash
pacman -Rns package_name1 package_name2 ...
```

#####  1.1.5. <a name='Removingorphanpackagesunused'></a>Removing orphan packages (unused)
```bash
pacman -Rns $(pacman -Qdtq)
```

#####  1.1.6. <a name='Removinguneededpackages'></a>Removing uneeded packages
```bash
pacman -Qqd | pacman -Rsu --print -
```

#####  1.1.7. <a name='Updatethesystem'></a>Update the system
```bash
pacman -Syu
```

#####  1.1.8. <a name='Searchforapackage'></a>Search for a package
```bash
pacman -Ss string1 string2 ...
```

#####  1.1.9. <a name='Searchforapackagealreadyinstalled'></a>Search for a package already installed
```bash
pacman -Qs string1 string2 ..
```

#####  1.1.10. <a name='Listallpackagesinstalled'></a>List all packages installed
```bash
pacman -Q
```

#####  1.1.11. <a name='Displayinformationaboutapackage'></a>Display information about a package
```bash
pacman -Qi package_name
```

#####  1.1.12. <a name='Deletethecacheofthepackagesuninstalled'></a>Delete the cache of the packages uninstalled
```bash
pacman -Sc
```

#####  1.1.13. <a name='Deleteallthecache'></a>Delete all the cache
```bash
pacman -Scc
```
or 
```bash
paccache -rk2 # keep 2 versions of the package in the cache
```

#####  1.1.14. <a name='Knowthenameofbinaryprogram'></a>Know the name of binary program

```bash
pacman -Qlq package_name | grep /usr/bin/
```

####  2.1.2. <a name='Makepkg'></a>Makepkg

base-devel is required to use makepkg
for update the package : git pull

#####  1.2.1. <a name='InstallpackagefromAUR'></a>Install package from AUR

```bash 
git clone https://aur.archlinux.org/package_name.git
cd package_name
makepkg -si
```

#####  1.2.2. <a name='RemovepackagefromAUR'></a>Remove package from AUR

```bash
sudo pacman -R package_name
```




###  2.2. <a name='Unknowissueonthesystem'></a>Unknow issue on the system

####  2.2.1. <a name='Checksystemfailure'></a>Check system failure

```bash
systemctl --failed
```

####  2.2.2. <a name='Checklog'></a>Check log 

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

####  2.2.3. <a name='Checktimeofeachcommponentduringboot'></a>Check time of each commponent during boot

```bash
systemd-analyze
```



###  2.3. <a name='SwapFile'></a>Swap File

####  2.3.1. <a name='Addaswapfile'></a>Add a swap file

#####  3.1.1. <a name='Createaswapfile1'></a>Create a swap file (1)

```bash
# Create a file of 4GB
sudo fallocate -l 4G /swapfile
```

####  2.3.2. <a name='Changethepermissionofthefile2'></a>Change the permission of the file (2)

```bash
sudo chmod 600 /swapfile
```

####  2.3.3. <a name='Formatthefile3'></a>Format the file (3)

```bash
sudo mkswap /swapfile
```

####  2.3.4. <a name='Enabletheswap4'></a>Enable the swap (4)

```bash
sudo swapon /swapfile
```

####  2.3.5. <a name='Addpermanentswap5'></a>Add permanent swap (5)

```bash
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

####  2.3.6. <a name='Checktheswap6'></a>Check the swap (6)

```bash
sudo swapon --show
```

####  2.3.7. <a name='Removeaswapfile'></a>Remove a swap file

#####  3.2.1. <a name='Disabletheswap1'></a>Disable the swap (1)

```bash
sudo swapoff -v /swapfile
```

#####  3.2.2. <a name='Removetheswap2'></a>Remove the swap (2)

```bash
sudo rm /swapfile
```

#####  3.2.3. <a name='Removetheswapfromthefstab3'></a>Remove the swap from the fstab (3)

```bash
sudo nano /etc/fstab
# Remove the line with the swap file
```

####  2.3.8. <a name='Realocatetheswapfile'></a>Realocate the swap file

```bash
sudo fallocate -l 2G /swapfile
```

###  2.4. <a name='Backupwithrsync'></a>Backup with rsync

```bash
rsync -aAXHv --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/home/*/.cache/*' --exclude='/home/*/.local/share/Trash/*' --exclude='/swapfile' --exclude='/lost+found' --exclude='/path/to/backup' / /path/to/backup/folder
```

##  3. <a name='MemoHyprland'></a>Memo Hyprland