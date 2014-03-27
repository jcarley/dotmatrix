[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/Jefferson/.gvm/bin/gvm-init.sh" ]] && source "/Users/Jefferson/.gvm/bin/gvm-init.sh"
