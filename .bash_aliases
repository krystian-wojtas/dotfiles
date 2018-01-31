alias a='cat'
alias c='cd'
alias s='ssh'
alias v='less'
alias lr='ls -rst'
alias e='emacs -nw'
alias p='picocom -b 115200'
alias g='git'
alias i='tig'

test -r "$HOME/.bash_custom" && source "$HOME/.bash_custom"
