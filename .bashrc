#edit this file:
alias aliases='nano ~/.bashrc'
alias aliases2='source ~/.bashrc'
alias o='xdg-open'
alias r='source ranger'
alias l='ls --color --human-readable --group-directories-first --classify --almost-all'
# MacOS: alias l='ls -CFGa'
alias cdd='cd ..'
alias cd2='cd ../..'
alias cdh='cd ~'
alias cls='clear'

# fgrep - fixed string grep
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1=$PS1'$(git_branch)'

alias gs='git status'
alias gс='git clone --recurse-submodules'
alias gpr='git pull --rebase'
alias gpo='git pull origin'
alias gsi='git submodule init'
alias gsu='git submodule update'
gcb() {
    git checkout -b "$1" origin/"$1"
}

#nnn file manager https://github.com/jarun/nnn
#snippet modified from https://github.com/jarun/nnn/tree/master/misc/quitcd
export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd
n() { #interactive mode
    nnn -di "$@"
    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm $NNN_TMPFILE
    fi
}

nn() {
    nnn -d "$@"
    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm $NNN_TMPFILE
    fi
}
