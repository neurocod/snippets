alias aliases='nano ~/.bashrc'
alias aliases2='source ~/.bashrc'

alias l='ls -CFa --hyperlink --group-directories-first'
# MacOS: alias l='ls -CFGa'
alias cdd='cd ..'
alias cd2='cd ../..'
alias cls='clear'
alias gpo='git pull origin'

# fgrep - fixed string grep

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='$PS1$(git_branch)'

#nnn file manager https://github.com/jarun/nnn
#snippet modified from https://github.com/jarun/nnn/tree/master/misc/quitcd
export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd
n()
{
    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm $NNN_TMPFILE
    fi
}
