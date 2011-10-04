# Redoing based on http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/
setopt prompt_subst

autoload -U colors
colors

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

if [ "$USER" = "root" ]; then NCOLOR="red"; else NCOLOR="green"; fi
 
PROMPT='%(?..[%?] )%{$fg[green]%}%m%{$reset_color%}:%{$fg[NCOLOR]%}%~%{$reset_color%}$(prompt_git_info)$(vcs_ps1)%{$reset_color%}%(!.#.$) '
RPROMPT='[%*]'
