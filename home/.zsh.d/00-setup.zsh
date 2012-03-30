HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory incappendhistory notify histsavenodups histreduceblanks extendedhistory histignorealldups
unsetopt beep flowcontrol 
bindkey -e

setopt AUTO_PUSHD PUSHD_IGNORE_DUPS

eval `dircolors ~/.dir_colors`

if echo "$TERM" | grep -q screen
then
    echo "In a screen session."
else
    echo "Not in a screen session.  Consider starting or attaching to one."
fi
