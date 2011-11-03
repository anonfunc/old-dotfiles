alias -g N='&& ahhh || ehoh'
alias ls='ls --color --quoting-style=shell'
alias antc="ant -logger org.apache.tools.ant.listener.AnsiColorLogger"
alias antn="ant -logger org.apache.tools.ant.NoBannerLogger"
alias antb="ant -logger org.apache.tools.ant.listener.BigProjectLogger"
alias antsb="ant -logger org.apache.tools.ant.listener.SimpleBigProjectLogger"
alias ant="ant -logger org.apache.tools.ant.listener.SimpleBigProjectLogger"

alias l=ls
alias ll='ls -lh'

# Suffix aliases
alias -s doc=swriter
alias -s xlsx=scalc
alias -s html=sensible-browser
alias -s ppt=simpress
alias -s pdf=evince
alias -s png=sxiv
alias -s jpg=sxiv
alias -s mp3=mpg321
alias -s dump=less
alias -s log=less

# Useful aliases
#alias sr='grabssh ; screen -D -RR'
alias g='git'

# Not so useful aliases
alias impressive='impressive -f -t None -g 800x600 -cp'
alias htop='htop -u first'
alias sagi='sudo aptitude install '
alias more='sl; less'

# Hmm?
alias jm='eval cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) (expand-file-name default-directory))")'


# SSH?
alias ssh="TERM=xterm-256color ssh"
