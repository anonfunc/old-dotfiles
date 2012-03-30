source ~/.zsh.d/lib/f/f.sh
alias j='d -e cd' # quick cd into directories, mimicking autojump and z

bindkey '^X^A' f-complete    # C-x C-a to do f-complete (fils and directories)
bindkey '^X^F' f-complete-f  # C-x C-f to do f-cmplete-f (only files)
bindkey '^X^D' f-complete-d  # C-x C-d to do f-complete-d (only directories)

# http://www.porcheron.info/command-not-found-for-zsh/
source /etc/zsh_command_not_found
