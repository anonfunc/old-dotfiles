# depends on aliases.

# excel completion

_excel () {
       	compadd `ls *.xml *.xls *.xlsx`
}
compdef _excel excel

GIT_PATH=`which git`
# git sanity checks
safe_git () {
	for arg in $*
	do
		if [[ $arg == "dcommit" ]]
		then
			if $GIT_PATH good-reviewer
			then
				echo "GOOD REVIEWER"
			else
				echo "BAD REVIEWER"
				return 1
			fi
		fi
	done
	$GIT_PATH $*
}

alias g=safe_git
alias git=safe_git
compdef safe_git=git

function d()
{
	cd $1 && ls
}

#compdef _directories d

#function cd_to_dir()
#{
    #if [ -z "$1" -o -d "$1" -o "$1" = "-" ]
    #then
        #\cd $1
    #else
        #\cd `dirname "$1"`
    #fi
#}
#compdef _directories cd_to_dir
#alias cd=cd_to_dir

