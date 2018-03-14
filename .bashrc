# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\n\[\e[1;32m\]\u\[\e[0m\]:\[\e[1;34m\]\w\n\[\e[0m\]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# kokokara
## usual alias
alias bashrc="vi /home/john/.bashrc && . /home/john/.bashrc"
alias ..="cd .."
alias ...="cd ../../"
alias python="python3.6"
alias .="source"
alias oldvirpy=". /mnt/c/Users/user/Dropbox/programing/python/develop3_5_2/bin/activate"
alias virpy=". /mnt/c/Users/user/programing/python/develop3_6_3/bin/activate"
alias expl="explorer.exe .\\"

## not usual alias
alias hoge="echo hoge"
alias okok="echo \"Yes! You completed!\""
alias yeah="echo \"Yeah!\""
alias eyes="xeyes &"
alias bye="echo bye & exit"
alias sl="ls"

## home and here
HOME=/mnt/c/Users/user
cd /mnt/c/Users/user
export HOME

## setting of Pycharm
#PATH=$PATH:/mnt/c/Portable_programs/"pycharm-2017.2.1"/bin
#JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
#export JAVA_HOME
#alias pycharm="pycharm.sh &"
function pycharm() {
  pycharm.exe $1
}
alias pycharm=pycharm


## setting of Webstorm
PATH=$PATH:/mnt/c/Portable_programs/"WebStorm-173.3942.31"/bin
alias webstorm="webstorm.sh &"

## setting of sublime_text
function subl() {
  subl.exe $1
}
alias subl=subl

## Japanese settings
#export LC_MESSAGES=ja_JP.UTF-8
export LC_IDENTIFICATION=C.UTF-8
#export LC_COLLATE=ja_JP.UTF-8
export LANG=C.UTF-8
export LC_MEASUREMENT=C.UTF-8
#export LC_CTYPE=ja_JP.UTF-8
#export LC_TIME=ja_JP.UTF-8
export LC_NAME=C.UTF-8
###
export XIM=uim
export XMODIFIERS=@im=uim
export UIM_CANDWIN_PROG=uim-candwin-gtk
#export UIM_CANDWIN_PROG=uim-candwin-qt
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
###
alias jap="uim-xim & lxterminal &"

## x11-apps
DISPLAY=localhost:0.0
export DISPLAY

## ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

## angular
export PATH=$HOME/.nodebrew/current/bin:$PATH

## piet
export PATH=$PATH:/mnt/c/Portable_programs/npiet-1.3e

## auto backup
cp /home/john/.bashrc /mnt/c/Users/user/Dropbox/bashrc_backup/

