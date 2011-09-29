# I'm going to dump some stuff from oh-my-zsh here:
# git theming default: Variables for theming the git info prompt
ZSH_THEME_GIT_PROMPT_PREFIX="git:("         # Prefix at the very beginning of the prompt, before the branch name
ZSH_THEME_GIT_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_GIT_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean

setopt prompt_subst


source ~/.zsh.d/lib/git.zsh
source ~/.zsh.d/lib/git-prompts.zsh
source ~/.zsh.d/lib/prompts.zsh
autoload -U colors
colors

hg_ps1() {
#         hg prompt --angle-brackets "$fg[red][$fg_bold[yellow]<branch><status><update>$reset_color$fg[red]]$reset_color" 2>/dev/null
         hg prompt --angle-brackets "[<branch><status><update>] " 2>/dev/null
}

#PS1='[%?]%{$fg[green]%}%~%{$reset_color%}%{$fg[yellow]%}$(__git_ps1 "[%s]")$(__vcs_ps1) %{$reset_color%}\$ '

#if [[ "$USER" == "root" ]] ; then
#        PS1='[%?]%{$fg[red]%}%n%{$reset_color%}@%m:%~# '
#fi

#Modified "clean" theme from oh-my-zsh follows

if [ "$USER" = "root" ]; then NCOLOR="red"; else NCOLOR="white"; fi
 
PROMPT='%(?..[%?] )%{$fg[green]%}%m%{$reset_color%}:%{$fg[green]%}%~%{$reset_color%} $(git_prompt_info)$(hg_ps1)$(__vcs_ps1)%(!.#.$) '
#PROMPT='[%?]%{$fg[green]%}%~%{$reset_color%} %(!.#.$) '
RPROMPT='[%*]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Dirty means staged, not committed.
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}⊕%{$reset_color%}"
 
# additional variables
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[yellow]%}⊥%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}✗%{$reset_color%}"
