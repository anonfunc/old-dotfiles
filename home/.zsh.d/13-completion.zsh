zmodload -a complist
zmodload -a autocomplete

zstyle :compinstall filename '/home/first/.zshrc'




zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:paths' accept-exact 'c:' 'e:' 'l:' 'f:' 
zstyle ':completion:*' fake-files '/c:' '/e:' '/l:' '/f:' 
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#zstyle ':completion:::::' completer _complete _approximate

zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

# SSH Host Completion
[[ -f ~/.ssh/known_hosts ]] && hosts=(`awk '{print $2}' ~/.ssh/known_hosts | tr ',' '\n' `)
[[ -f ~/.ssh/config ]] && hosts=($hosts `grep ^Host ~/.ssh/config | sed s/Host\ // | egrep -v '^\*$'`)
[[ -f /var/lib/misc/ssh_known_hosts ]] && hosts=($hosts `awk -F "[, ]" '{print $1}' /var/lib/misc/ssh_known_hosts | sort -u`)
[[ -n "$hosts" ]] && zstyle ':completion:*:hosts' hosts $hosts

# Completion for some of my commands?
jiras () {
	reply=( `jira.sh -a getIssueList --filter "My Targeted Open Issues" 2>/dev/null | cut -d, -f 1 | tail -n '+3' | tr '[:upper:]' '[:lower:]' ` )
}

compctl -K jiras git-work-on
compctl -K _git-checkout git-checkout

autoload -Uz compinit
compinit
