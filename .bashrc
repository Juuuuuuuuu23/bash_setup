CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# git supplement to prompt features
if [ -f $CUR_DIR/.git-prompt.bash ]; then
    source $CUR_DIR/.git-prompt.bash
fi

# git function completion feature
if [ -f $CUR_DIR/.git-completion.bash ]; then 
    source $CUR_DIR/.git-completion.bash
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
B_RED="[0;41m"
B_GREEN="[0;42m"
B_YELLOW="[0;43m"
B_BLUE="[0;44m"
B_PURPLE="[0;45m"
B_CYAN="[0;46m"
B_WHITE="[0;00m"

select_color ()
{
    case $COLOR_SELECTED in
    0) B_color=$B_WHITE ;;
    1) B_color=$B_RED ;;
    2) B_color=$B_GREEN  ;;
    3) B_color=$B_YELLOW  ;;
    4) B_color=$B_BLUE  ;;
    5) B_color=$B_PURPLE  ;;
    6) B_color=$B_CYAN  ;;
    7) B_color=$B_WHITE  ;;
    *) B_color=$B_WHITE ;;
    esac
    echo $B_color
}

cmark ()
{
    export COLOR_SELECTED="$1"
}

# Git prompt option
GIT_PS1_SHOWDIRTYSTATE=true

# Shell options
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Prompt color label
export COLOR_SELECTED=0

export PS1="\[\033\$(select_color)\]\h:\W \u"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$GREEN'"$(__git_ps1 " (%s)")
    fi)'$WHITE' $'

export -f cmark
