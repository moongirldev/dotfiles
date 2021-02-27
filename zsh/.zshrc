# Lines configured by zsh-newuser-install
PS1="▲ ~"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
DISABLE_AUTO_TITLE="false"
setopt autocd extendedglob histignoredups
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gobolin/.zshrc'

autoload -Uz compinit
compinit
cat /home/gobolin/.cache/wal/sequences
# End of lines added by compinstall

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
GEOMETRY_COLOR_DIR=152
zinit ice wait"0" lucid atload"geometry::prompt"
zinit light geometry-zsh/geometry

GEOMETRY_PROMPT=(geometry_status geometry_path) # redefine left prompt
GEOMETRY_RPROMPT+=(geometry_exec_time)      # append exec_time and pwd right prompt
GEOMETRY_TITLE=(geometry_node)

GEOMETRY_STATUS_SYMBOL="ﳝ"             # default prompt symbol
GEOMETRY_STATUS_SYMBOL_ERROR="ﳞ"       # displayed when exit value is != 0
GEOMETRY_STATUS_COLOR_ERROR="yellow"  # prompt symbol color when exit value is != 0
GEOMETRY_STATUS_COLOR="default"        # prompt symbol color
GEOMETRY_STATUS_COLOR_ROOT="red"       # root prompt symbol color

zinit load MichaelAquilina/zsh-auto-notify
zinit load zsh-users/zsh-autosuggestions

#zinit load marlonrichert/zsh-autocomplete
#zstyle ':autocomplete:tab:*' widget-style menu-complete

. "/home/gobolin/.local/share/lscolors.sh"
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
