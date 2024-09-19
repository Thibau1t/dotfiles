# Set the directory for zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it doesn't exist
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use

# Load zsh-completions
autoload -U compinit && compinit
zinit cdreplay -q

# completions style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,comm -w -w"


zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# Key bindings
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^[w' kill-region

# History settings
HISTSIZE=10000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Load oh-my-posh (prompt)
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/posh.toml)"

# Alias
alias ls='ls --color=auto '
alias c='clear'
alias h='history'
alias e='exit'
alias t='tail -f'
alias grep='grep --color'
alias mk='mkdir'
alias s='sudo'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g NUL="> /dev/null 2>&1"

alias co="code ."
alias cog="$VSCODE --goto="
alias con="$VSCODE --new-window"
alias cor="$VSCODE --reuse-window"

alias sc-restart="sudo systemctl restart"
alias sc-start="sudo systemctl start"
alias sc-stop="sudo systemctl stop"
alias sc-status="sudo systemctl status"
alias sc-enable="sudo systemctl enable"
alias sc-disable="sudo systemctl disable"


alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias paclean='sudo pacman -Sc'
alias pacins='sudo pacman -U'
alias paclr='sudo pacman -Scc'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
alias pacupd="sudo pacman -Sy"

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gad='git add .'
alias gam='git add . && git commit -m'
alias gcl='git clone'
alias gcm='git commit -m'
alias gb='git branch'
alias gba='git branch -d'
alias gbl='git branch -l'
alias gs='git status'
alias grb='git rebase'
alias gpl='git pull' 
alias gp='git push'
alias gf='git fetch'

alias sc='wf-recorder -g "$(slurp)" -f ~/Pictures/screen_recording_$(date +'%Y-%m-%d_%H-%M-%S').mp4 --audio="default"' #screencast

# Shell integrations
eval "$(fzf --zsh)"
eval $(thefuck --alias f)
eval "$(zoxide init --cmd cd zsh)"
