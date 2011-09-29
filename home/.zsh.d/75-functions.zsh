# depends on aliases.

# mwittenberg's wdservices function
wdservices () {
	    ps -eaf | grep '[j]ava.*-Dwd.tag' \
		    | sed -e 's/\([0-9][0-9]*\) *\([0-9][0-9]*\) *.*\(tag=[^ ]*\) .*/\1 \2 \3/'
}
# show wd.sys too.
function wd {
        if [ -z "$*" ] ; then
                wd tag sys      
        else
                IFS="
"
                for LINE in `ps -eaf | grep '[j]ava.*-Dcatalina.home'`
                do
                        echo -n "$LINE" | awk '{ printf("%s\t%s\t", $1,$2); }'
                        for ARG in $*
                        do
                                echo -n "$LINE" | grep "$ARG" |sed -e "s/^.*\\($ARG=\\?[^ ]*\\).*$/\\1/" \
                                                | tr -d '\n' 
                                echo -n -e "\t"
                        done
                        echo
                done
        fi
}

wdnice () {
	IFS="
"
	for LINE in `ps -eaf | grep '[j]ava.*-Dcatalina.home'`
	do
	    	echo "----------------------"
#		IFS=" "
		echo "$LINE" | sed -e "s/ -\\([DXa-z]\\)/\n -\\1/g"
		echo "----------------------"
		echo 
	done

}

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


function lo() {
    PAT=$1
    shift
    locate $* "`pwd`/$PAT" "`pwd`/*/$PAT" 
}

