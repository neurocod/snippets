#one-time setup:
#brew install ranger
#brew install mc
#brew install nano
alias aliases='nano $HOME/.bash_profile'
alias aliases2='source $HOME/.bash_profile'
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[38;5;051;48;5;233m\]\u@\h \w\[\e[0m\]$(git_branch)$ "
export EDITOR=/usr/local/bin/nano
#C=multicolumn output, F=slash after dir, G=coloried, a=with dots at start
alias l='ls -CFGa'
alias ls='ls -CFGa'
mkcd() {
  mkdir $1
  cd $1
}
alias cdd='cd ..'
#if remote desktop can't type home sign:
alias cdh='cd $HOME'
alias gs='git status'
alias gpr='git pull --rebase'
alias gsi='git submodule init'
alias gsu='git submodule update'
alias r='source ranger'
export NNN_TMPFILE=$HOME/.config/nnn/.lastd
n()
{
    #i = interactive, d=show hidden files (keyboard: dot)
    nnn -id "$@"

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm $NNN_TMPFILE
    fi
}

#without this MC shows erros like this: Warning: Failed to set locale category LC_NUMERIC to en_RU.
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
