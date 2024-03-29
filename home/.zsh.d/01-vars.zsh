export LD_LIBRARY_PATH=/usr/local/lib
export JAVA_HOME="/opt/jdk1.6.0_29"
export JDK_HOME="/opt/jdk1.6.0_29"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/git-scripts:$PATH"
#export PATH="$HOME/bin/apps/eclipse:$PATH"
export PATH="$HOME/bin/apps/jira-cli-1.5.0:$PATH"
export PATH="$HOME/bin/apps/scala/bin:$PATH"
export PATH="$HOME/Playground/android-sdk-linux/tools:$PATH"
export PATH="/var/lib/gems/1.8/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$PATH:/opt/openoffice.org3/program"
export PATH="$JAVA_HOME/bin:$JDK_HOME/bin:$PATH"
export PATH="/opt/apache-ant-1.8.2/bin:$PATH"
export PATH="/opt/apache-maven-3.0.3/bin:$PATH"
export PATH="/opt/firefox:$PATH"

#export AWT_TOOLKIT=MToolkit
export EDITOR="emacsclient -c -t"
export ALTERNATE_EDITOR="/usr/local/bin/vim"
export VISUAL="emacsclient -c -t"
export GDK_NATIVE_WINDOWS=1
export MAILDIR="/home/first/Mail"
export ANDROID_HOME="/home/first/Playground/android-sdk-linux"


export REALTERM=${REALTERM:-$TERM}

fpath=("$HOME/.zsh.d/comp" $fpath)
fpath=("$HOME/.zsh.d/functions" $fpath)
autoload -U ~/.zsh.d/functions/*(:t)
