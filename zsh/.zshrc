# Lines configured by zsh-newuser-install
PS1="▲ ~"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
DISABLE_AUTO_TITLE="true"
setopt autocd extendedglob histignoredups
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' format '%d'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/moongirl/.zshrc'

autoload -Uz compinit
#compinit
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

hostname_local () {
if type "scutil" > /dev/null; then
	echo moongirl@$(scutil --get LocalHostName)
else
	echo geometry_hostname
fi
}

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
GEOMETRY_COLOR_DIR=geometry::hostcolor
zinit ice wait"0" lucid atload"geometry::prompt"
zinit light geometry-zsh/geometry

GEOMETRY_PROMPT=(geometry_status geometry_hostname geometry_newline geometry_path) # redefine left prompt
GEOMETRY_RPROMPT=(geometry_exec_time geometry_git)      # append exec_time and pwd right prompt

GEOMETRY_STATUS_SYMBOL="🌙"             # default prompt symbol
GEOMETRY_STATUS_SYMBOL_ERROR="🌑"       # displayed when exit value is != 0
GEOMETRY_STATUS_COLOR_ERROR="yellow"  # prompt symbol color when exit value is != 0
GEOMETRY_STATUS_COLOR=geometry::hostcolor        # prompt symbol color
GEOMETRY_STATUS_COLOR_ROOT="red"       # root prompt symbol color

GEOMETRY_PLUGIN_HYDRATE_COLOR=blue
GEOMETRY_PLUGIN_HYDRATE_SYMBOL=💧
GEOMETRY_PLUGIN_HYDRATE_INTERVAL=2  # interval in minutes

#zinit load MichaelAquilina/zsh-auto-notify
zinit load zsh-users/zsh-autosuggestions

#zinit load marlonrichert/zsh-autocomplete
#zstyle ':autocomplete:tab:*' widget-style menu-complete

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#. "/home/gobolin/.local/share/lscolors.sh"
export LS_COLORS="$(vivid generate snazzy)"
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias cat="batcat"
alias yay="sudo pacapt"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
