# git supplement to prompt features
if [ -f $HOME/.git-prompt.bash ]; then
    source $HOME/.git-prompt.bash
fi

# git function completion feature
if [ -f $HOME/.git-prompt.bash ]; then
    source $HOME/.git-prompt.bash
fi

# Define prompt colors
BLACK="\[\033[0;30m\]"
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;39m\]"

# Background colors
B_RED="\[\033[0;41m\]"
B_GREEN="\[\033[0;42m\]"
B_YELLOW="\[\033[0;43m\]"
B_BLUE="\[\033[0;44m\]"
B_PURPLE="\[\033[0;45m\]"
B_CYAN="\[\033[0;46m\]"
B_WHITE="\[\033[30;43m\]"

select_color ()
{
    case $1 in
    0) B_color=$WHITE ;;
    1) B_color=$B_RED ;;
    2) B_color=$B_GREEN  ;;
    3) B_color=$B_YELLOW  ;;
    4) B_color=$B_BLUE  ;;
    5) B_color=$B_PURPLE  ;;
    6) B_color=$B_CYAN  ;;
    7) B_color=$B_WHITE  ;;
    *) echo "Color not found"
       B_color=$WHITE ;;
    esac
}

# Git prompt option
GIT_PS1_SHOWDIRTYSTATE=true

# Shell options
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

select_color $1

export PS1="$B_color\h:\W \u"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$GREEN'"$(__git_ps1 " (%s)")
    fi)'$WHITE' $'

alias cmark="source .bashrc"
