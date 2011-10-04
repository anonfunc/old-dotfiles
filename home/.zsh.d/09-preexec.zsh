# From  http://unix.stackexchange.com/questions/7380/force-title-on-gnu-screen/

terminit()
{
    # determine the window title escape sequences
    case "$TERM" in
        aixterm|dtterm|putty|rxvt|xterm*)
            titlestart='\033]0;'
            titlefinish='\007'
            ;;
        cygwin)
            titlestart='\033];'
            titlefinish='\007'
            ;;
        konsole)
            titlestart='\033]30;'
            titlefinish='\007'
            ;;
        screen*)
            # status line
            #titlestart='\033_'
            #titlefinish='\033\'
            # window title
            titlestart='\033k'
            titlefinish='\033\'
            ;;
        *)
            if type tput >/dev/null 2>&1
            then
                if tput longname >/dev/null 2>&1
                then
                    titlestart="$(tput tsl)"
                    titlefinish="$(tput fsl)"
                fi
            else
                titlestart=''
                titlefinish=''
            fi
            ;;
    esac
}


# or put it inside a case $- in *i* guard
if test -t 0
then
    terminit
fi

# set the xterm/screen/etc. title
settitle()
{
    test -z "${titlestart}" && return 0
    printf "${titlestart}$*${titlefinish}"
}

preexec() {
    if [[ "$TERM" == "screen" || "$TERM" == "screen-256color" ]]
    then
        local CMD=${2}
        settitle "${TITLE:-$PWD:$CMD}"
    fi
}
