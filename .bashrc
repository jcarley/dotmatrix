export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH

[ -f "$HOME/.bash_profile.local" ] && . "$HOME/.bash_profile.local"
[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/Jefferson/.gvm/bin/gvm-init.sh" ]] && source "/Users/Jefferson/.gvm/bin/gvm-init.sh"
