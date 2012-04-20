export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH
### PROMPT SETUP ###
  function set_window_and_tab_title
  {
    local title="$1"
    if [[ -z "$title" ]]; then
      title="root"
    fi

    local tmpdir=~/Library/Caches/${FUNCNAME}_temp
    local cmdfile="$tmpdir/$title"

    # Set window title
    # echo -n -e "\e]0;${title}\a"

    # Set tab title
    if [[ -n ${CURRENT_TAB_TITLE_PID:+1} ]]; then
      kill $CURRENT_TAB_TITLE_PID
    fi
    mkdir -p $tmpdir
    ln /bin/sleep "$cmdfile"
    "$cmdfile" 10 &
    CURRENT_TAB_TITLE_PID=$(jobs -x echo %+)
    disown %+
    kill -STOP $CURRENT_TAB_TITLE_PID
    command rm -f "$cmdfile"
  }

  # Colours
          RED="\[\033[0;31m\]"
       YELLOW="\[\033[0;33m\]"
        GREEN="\[\033[0;32m\]"
         BLUE="\[\033[0;34m\]"
    LIGHT_RED="\[\033[1;31m\]"
  LIGHT_GREEN="\[\033[1;32m\]"
        WHITE="\[\033[1;37m\]"
   LIGHT_GRAY="\[\033[0;37m\]"
   COLOR_NONE="\[\e[0m\]"
         GRAY="\[\033[1;30m\]"

  # Get the current git branch, if there is one
  function parse_git_branch {
    \git rev-parse --git-dir &> /dev/null
    git_status="$(git status 2> /dev/null)"
    branch_pattern="^# On branch ([^${IFS}]*)"
    remote_pattern="# Your branch is (.*) of"
    diverge_pattern="# Your branch and (.*) have diverged"
    if [[ ! ${git_status}} =~ "working directory clean" ]]; then
      state="${RED}⚡"
    fi
    # add an else if or two here if you want to get more specific
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
      if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
        remote="${YELLOW}↑"
      else
        remote="${YELLOW}↓"
      fi
    fi
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
      remote="${YELLOW}↕"
    fi
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
      branch=${BASH_REMATCH[1]}
      echo " (${branch})${remote}${state}"
    fi
  }

  function prompt_func {
    previous_return_value=$?;
    prompt="${TITLEBAR}${LIGHT_GRAY}\w${YELLOW}$(parse_git_branch)${COLOR_NONE}"
    if test $previous_return_value -eq 0
    then
      PS1="${GREEN}➜ ${COLOR_NONE}${prompt}${GREEN} \$${COLOR_NONE} "
    else
      PS1="${RED}➜ ${COLOR_NONE}${prompt}${RED} \$${COLOR_NONE} "
    fi
    # set_window_and_tab_title "${PWD##*/}"
  }

  [ -z "$PS1" ] || stty -ixon
  PROMPT_COMMAND=prompt_func

[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
rvm use 1.9.2@global --create

hitch() {
  command hitch "$@"
  [ -s "$HOME/.hitch_export_authors" ] && . "$HOME/.hitch_export_authors"
}

[ -f "$HOME/.bash_profile.local" ] && . "$HOME/.bash_profile.local"
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"
