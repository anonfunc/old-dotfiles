#!/bin/zsh
# get the name of the branch we are on
function git_prompt_info() {
  git rev-parse --git-dir 2>/dev/null >/dev/null || return
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_crazy)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  export VC="git"
}

function parse_git_dirty () {
  git_status=$(git status 2> /dev/null)

  if echo $git_status | grep -q "# Change"; then
    echo -n "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo -n "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  if echo $git_status | grep -q "# Not currently on any branch."; then
    echo -n "$ZSH_THEME_GIT_PROMPT_DETACHED"
  fi

  if echo $git_status | grep -q "# Untracked files:"; then
    echo -n "$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
}

# Splicing in crap from my git-completion.zsh:
# Main thing pulled from the other.
function git_crazy () {
        g=`git rev-parse --git-dir 2>/dev/null`
	if [ -n "$g" ]; then
		local r
		local b
		export VC=git
		if [ -d "$g/rebase-apply" ]; then
			if [ -f "$g/rebase-apply/rebasing" ]; then
				r="|REBASE"
		elif [ -f "$g/rebase-apply/applying" ]; then
				r="|AM"
			else
				r="|AM/REBASE"
			fi
		elif [ -f "$g/rebase-merge/interactive" ]; then
			r="|REBASE-i"
		elif [ -d "$g/rebase-merge" ]; then
			r="|REBASE-m"
		elif [ -f "$g/MERGE_HEAD" ]; then
			r="|MERGING"
		else
			if [ -f "$g/BISECT_LOG" ]; then
				r="|BISECTING"
			fi
		fi
	fi
	if [ -n "$r" ]; then
		echo "$r"
	fi
}

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Aliases
# alias g='git'
# alias gst='git status'
# alias gl='git pull'
# alias gup='git fetch && git rebase'
# alias gp='git push'
# alias gd='git diff | mate'
# alias gdv='git diff -w "$@" | vim -R -'
# alias gc='git commit -v'
# alias gca='git commit -v -a'
# alias gb='git branch'
# alias gba='git branch -a'
# alias gcount='git shortlog -sn'
# alias gcp='git cherry-pick'
