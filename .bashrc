export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH

[ -f "$HOME/.bash_profile.local" ] && . "$HOME/.bash_profile.local"
[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

export NODE_ENV=development
