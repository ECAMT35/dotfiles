#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '

PS1=" \[\e[38;5;87m\]\u\[\e[38;5;87m\]@\[\e[38;5;87m\]\h \[\e[38;5;39m\]\w \[\033[0m\]$ "

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# I need chinese
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

export EDITOR=nvim

# bash history
export HISTCONTROL="erasedups:ignorespace"

