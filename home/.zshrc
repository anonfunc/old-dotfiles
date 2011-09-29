for file in `ls ~/.zsh.d/*.zsh | sort`
do
    source $file
done
