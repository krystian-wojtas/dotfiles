alias g='git'
alias i='tig'

source /usr/share/bash-completion/completions/git
__git_complete g __git_main
__git_complete i __git_main

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
__prompt_command() {
    # This needs to be first
    local EXIT_CODE="$?"

    PS1="\[\e[38;5;28m\]\u@\h\[\e[m\] "  # user @ host in dark green
    PS1+="\[\e[31m\]$EXIT_CODE\[\e[m\] " # exit code in red
    PS1+="\[\e[34m\]\t\[\e[m\] "         # timestamp in blue
    PS1+="\[\e[35m\]\w\[\e[m\] "         # current working directory in magenta
    PS1+="\n\$ "                         # new line and $ sign in default black
}
