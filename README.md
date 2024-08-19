# Thibau1t Dotfiles

Welcome to my dotfiles repository! This repository contains all the configurations I use to customize my working environment on [Arch Linux](https://www.archlinux.org) and other systems.

## Directory Structure

Here's a quick overview of the contents of this repository:

```bash
❯ tree -I ".git" -a .
.
├── .config
│   ├── bat
│   │   └── config
│   ├── hypr
│   │   ├── hypridle.conf
│   │   ├── hyprland.conf
│   │   ├── hyprlock.conf
│   │   ├── hyprpaper.conf
│   │   └── scripts
│   │       ├── clean_cliphist.sh
│   │       ├── restart_pipewire.sh
│   │       └── restart_xdg.sh
│   ├── kitty
│   │   ├── gruvbox_dark.conf
│   │   └── kitty.conf
│   ├── mako
│   │   └── config
│   ├── oh-my-posh
│   │   └── posh.toml
│   ├── rofi
│   │   ├── config.rasi
│   │   └── gruvbox-dark-hard.rasi
│   ├── swappy
│   │   └── config
│   ├── wallpapers
│   │   └── mountains.png
│   └── waybar
│       ├── config.jsonc
│       ├── gruvbox-dark.css
│       ├── launch.sh
│       ├── scripts
│       │   ├── networkmanager.sh
│       │   └── systeminfo.sh
│       └── style.css
├── README.md
└── .zshrc
```

## Software Used

-   **[Hyprland](https://github.com/hyprwm/Hyprland)** - Dynamic tiling Wayland compositor.
-   **[Kitty](https://github.com/kovidgoyal/kitty)** - Fast, feature-rich, GPU-based terminal emulator.
-   **[Zsh](https://www.zsh.org/)** - A shell.
-   **[Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh)** - A prompt theme engine for any shell.
-   **[Mako](https://github.com/emersion/mako)** - A lightweight Wayland notification daemon.
-   **[Rofi](https://github.com/davatorium/rofi)** - A window switcher, application launcher, and dmenu replacement.
-   **[Swappy](https://github.com/jtheoof/swappy)** - A screenshot editing tool.
-   **[Waybar](https://github.com/Alexays/Waybar)** - Highly customizable Wayland bar.
-   **[Cliphist](https://github.com/sentriz/cliphist)** - A clipboard history manager.
-   **[Firefox EdgeArc](https://github.com/artsyfriedchicken/EdgyArc-fr)** - Firefox with Arc features integrated.
-   **[Visual Studio Code](https://github.com/microsoft/vscode)** - A code editor.
-   **[Thunar](https://docs.xfce.org/xfce/thunar/start)** - A file manager.

## Favorite Commands

Here are some of my favorite commands and tools:

-   **[Bat](https://github.com/sharkdp/bat)** - A `cat` clone with syntax highlighting and Git integration.
-   **[Fzf](https://github.com/junegunn/fzf)** - A general-purpose command-line fuzzy finder.
-   **[Zoxyde](https://github.com/ajeetdsouza/zoxide)** - A smarter cd command.
-   **[Zsh Plugins](https://github.com/zdharma-continuum/zinit)** -
    -   `zinit light zsh-users/zsh-syntax-highlighting` - Zsh syntax highlighting.
    -   `zinit light zsh-users/zsh-completions` - Additional Zsh completions.
    -   `zinit light zsh-users/zsh-autosuggestions` - Zsh auto-suggestions.
    -   `zinit light zsh-users/zsh-history-substring-search` - History substring search in Zsh.
    -   `zinit light Aloxaf/fzf-tab` - Fzf integration for Zsh.
    -   `zinit light MichaelAquilina/zsh-you-should-use` - Useful Zsh plugins and utilities.
-   **[JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)** - My favorite font.
-   **[Paru](https://github.com/Morganamilo/paru)** - An AUR helper.

## Todo List

-   rsync or timeshift
-   hyprland config + plugins
-   discord
-   thunderbird
-   kitty (map ctrl+fn)
