# Store 10,000 history entries
HISTSIZE=10000
# Don't store duplicates
HISTCONTROL=erasedups

# Append to history file
shopt -s histappend

CLICOLOR=1
DISPLAY=:0.0
EDITOR="$VISUAL"
GEMDOC=$(\gem environment gemdir)/doc
LC_CTYPE=en_US.UTF-8
LESS="FRX"
LSCOLORS=gxgxcxdxbxegedabagacad
PGOPTIONS='-c client_min_messages=WARNING'
PSQL_EDITOR='vim -c"set syntax=sql"'
RI="--format ansi --width 80"
VISUAL=vim
RSPEC=true
AUTOFEATURE=true
RUBYOPT=rubygems

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS PGOPTIONS LC_CTYPE DISPLAY GEMDOC RSPEC AUTOFEATURE RUBYOPT HISTSIZE HISTCONTROL

## Auto-completion
sources=(`brew --prefix`/etc/bash_completion
         `brew --prefix git`/etc/bash_completion.d/git-completion.bash
         `brew --prefix`/Library/Contributions/brew_bash_completion.sh)
for src in ${sources[@]}; do
  [ -f $src ] && . $src
done

# Use VI mode in bash
set -o vi

[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
