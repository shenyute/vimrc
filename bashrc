# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#export PATH=/usr/local/lib/cw:/home/ytshen/usr/erlang/bin:$PATH
export PATH=~/bin:$PATH
export PATH=/home/ytshen/usr/jython/bin:/home/ytshen/usr/jdk1.6.0_25/bin:/home/ytshen/usr/erlang/bin:$PATH
export PATH=$PATH:/home/ytshen/android-ndk-r8d
export PATH=$PATH:/home/ytshen/adt-bundle-linux/sdk/platform-tools
export PATH=~/bin:$PATH:~/bin/depot_tools
export PATH=$PATH:/home/ytshen/android-ndk-r8d
alias svndiff='svn diff --diff-cmd colordiff'

alias ls='ls --color'
#alias vi='vim'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias du='du -h'
alias df='df -h'
alias cscope='cscope -R -I/usr/include'
alias here='export WORKDIR=`pwd`'
alias tmux='tmux -2'
export NACL_SDK_ROOT=/home/ytshen/third-party/nacl_sdk/pepper_15

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
 
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#alias telnet='/usr/local/bin/zh-telnet'

export CVS_RSH="ssh"
export CVSROOT=":ext:yuteh@192.168.1.14:/usr/local/cvs/root"
export export LESS="-R"
export EDITOR=vim


# colorful man page
#export TERM=xterm
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[0;34m'
export LESS_TERMCAP_md=$'\E[1;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[0;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[0;33m'
export SVN_SERV="svn+ssh://yuteh@cvs.cellopoint.com/release/svn/cef/branches/yuteh/"
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH

# python virtualenv setting
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.envs

# perforce setting
export P4PORT=dpapp04.tw.ibm.com:1666
export P4CONFIG=.p4config
export P4USER=$USER
export P4VDIR=/usr/local/bin
export P4VRES=/usr/local/bin/P4VResources
export P4MERGE="p4v -merge"

# cdargs setting
# ca [Label] to add current folder to label
# cv [Label]
# cpb [Files] [Label] as cp
# mvb [Files] [Label] as mv
source /usr/share/doc/cdargs/examples/cdargs-bash.sh

# see the command's source
function see() {
    vi `which $1`
}
complete -c command see

# vim mode
set -o vi
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen
