alias a='cat'
alias c='cd'
alias cal='ncal -w -M -b'
alias e='emacs -nw'
alias g='git'
alias i='tig'
alias lr='ls -rst'
alias m='make'
alias p='picocom -b 115200'
alias s='ssh'
alias v='less'

test -r "$HOME/.bash_custom" && source "$HOME/.bash_custom"
