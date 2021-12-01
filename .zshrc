#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init - zsh)"
eval "$(direnv hook zsh)"

#export PATH="$HOME/.pyenv/shims:$PATH"
# eval "$(pyenv init -zsh)"
 
# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*:*:cdr:*:*' menu selection
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-max 100
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/shell/chpwd-recent-dirs"
  zstyle ':chpwd:*' recent-dirs-pushd true
fi

# ghq & peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src

# tree & peco
function peco-tree-subl(){
  local SELECTED_FILE=$(tree --charset=o -f | peco --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)
  if [ -n "$SELECTED_FILE" ]; then
    BUFFER="subl $SELECTED_FILE"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-tree-subl
bindkey '^t' peco-tree-subl

# ^R with peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -n 1000 | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# cdr & peco
function peco-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^h' peco-cdr
export PATH="$HOME/.embulk/bin:$PATH"

PATH=$HOME/.nodebrew/current/bin:$PATH

# flutter
export PATH="$HOME/.ghq/flutter/bin:$PATH"
