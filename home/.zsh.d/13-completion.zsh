#zstyle ':completion:::::' completer _complete _approximate

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}

zstyle ':completion:::::' completer _force_rehash _complete _approximate

zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
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
