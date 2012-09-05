export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH

[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"

[ -f "$HOME/.bash_profile.local" ] && . "$HOME/.bash_profile.local"
[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
