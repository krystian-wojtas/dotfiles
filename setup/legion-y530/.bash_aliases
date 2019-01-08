alias a='cat'
alias c='cd'
alias cal='ncal -w -M -b'
alias s='ssh'
alias v='less'
alias lr='ls -rst'
alias e='emacs -nw'
alias p='picocom -b 115200'
alias g='git'
alias i='tig'
alias m='make'

test -r "$HOME/.bash_custom" && source "$HOME/.bash_custom"
