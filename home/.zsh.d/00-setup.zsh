HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory incappendhistory notify histsavenodups histreduceblanks extendedhistory histignorealldups
unsetopt beep flowcontrol 
bindkey -e

zmodload -a complist
zmodload -a autocomplete

zstyle :compinstall filename '/home/first/.zshrc'

setopt nocaseglob
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS


eval `dircolors ~/.dir_colors`

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:paths' accept-exact 'c:' 'e:' 'l:' 'f:' 
zstyle ':completion:*' fake-files '/c:' '/e:' '/l:' '/f:' 
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit -C
# End of lines added by compinstall
#
# 
if echo "$TERM" | grep -q screen
then
    echo "In a screen session."
else
    echo "Not in a screen session.  Consider starting or attaching to one."
fi
