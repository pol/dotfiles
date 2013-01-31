# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim
export GUI_EDITOR=subl
export BUNDLE_EDITOR=$GUI_EDITOR
export SVN_EDITOR=$EDITOR

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history, ignore common commands and duplicate lines
export HISTSIZE=4096
export HISTIGNORE="&:ls:cd:[bf]g:exit" 
export HISTCONTROL=ignoredups          

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# Enable BASH-style regexp
setopt BASH_REMATCH

# Disable autocorrect
unsetopt correct_all 

# PATH
PATH="/Library/PostgreSQL/9.0/bin:/usr/local/bin:/usr/local/lib:/usr/local/sbin:/Users/pol/bin:/Users/pol/bin/depot_tools:${PATH}"
export PATH

# rvm-install added line:
if [[ -s /Users/pol/.rvm/scripts/rvm ]] ; then source /Users/pol/.rvm/scripts/rvm ; fi

[ -s "/Users/pol/.scm_breeze/scm_breeze.sh" ] && source "/Users/pol/.scm_breeze/scm_breeze.sh"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
