#!/bin/zsh
# returns text to add to bash PS1 prompt (includes branch name)
__vcs_ps1 ()
{
    # from git-prompts file
    local g="$(__gitdir)"
    if [ -n "$g" ]
    then
	return
    fi

    if [ -d ".svn" ]
    then
	echo "[svn]"
    elif [ -d ".cvs" ]
    then
	echo "[cvs]"
    fi
}

