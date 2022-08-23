PS1="🌙 moongirl"
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/moongirl/.zshrc'

autoload -Uz compinit
compinit > /dev/null
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
setopt autocd nomatch
unsetopt beep
bindkey -v
bindkey  "^[OH"   beginning-of-line
bindkey  "^[OF"   end-of-line
# End of lines configured by zsh-newuser-install

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## Beginning of geometry config
#zinit ice wait"0" lucid atload"geometry::prompt"
zinit light geometry-zsh/geometry


GEOMETRY_PROMPT=(geometry_status geometry_hostname geometry_newline geometry_path) # redefine left prompt
GEOMETRY_RPROMPT=(geometry_exec_time geometry_git)      # append exec_time and pwd right prompt

#GEOMETRY_TITLE=(geometry_hostname)

#GEOMETRY_INFO=(geometry_hostname geometry_newline)

GEOMETRY_STATUS_SYMBOL=":3"             # default prompt symbol
GEOMETRY_STATUS_SYMBOL_ERROR=">:3"       # displayed when exit value is != 0
GEOMETRY_STATUS_COLOR_ERROR="yellow"  # prompt symbol color when exit value is != 0
GEOMETRY_STATUS_COLOR=geometry::hostcolor        # prompt symbol color
GEOMETRY_STATUS_COLOR_ROOT="red"       # root prompt symbol color

geometry::set_title() {
  local ansiTitle=$(print -P $(geometry::wrap $PWD $GEOMETRY_TITLE))
  local title=$(deansi "$ansiTitle")

  echo -ne "\e]0;$title\a"
}


geometry::set_cmdtitle() {
  # Make command title available for optional consumption by geometry_cmd
  GEOMETRY_LAST_CMD=$2
  local ansiCmdTitle=$(print -P $(geometry::wrap $PWD $GEOMETRY_CMDTITLE))
  local cmdTitle=$(deansi "$ansiCmdTitle")

  echo -ne "\e]0;$cmdTitle\a"
}


## End of geometry config

## Other Plugins
#zinit ice wait"0"
zinit light zsh-users/zsh-autosuggestions
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4b3752,bg=underline"


## End Other Plugins


## LS_COLORS
if type "scutil" > /dev/null; then
	export LS_COLORS="$(vivid generate snazzy)"
fi

## Alias Section
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias yay="sudo pacapt"

## Mac OS Specific
if type "scutil" > /dev/null; then
        alias love="open -n -a love"
        alias cat="bat"
fi

##End Alias Section
