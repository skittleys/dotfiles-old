# From default bashrc

alias free='free -m'                      # show sizes in MB
#alias np='nano PKGBUILD'

############

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Colourful grep
# alias less='less -r'                          # raw control characters
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Directory listings
alias ls='ls -A --color=auto --file-type'
alias dir='ls -a --color=auto --format=vertical --file-type'
alias ll='ls -lhA'
alias l='ls -CF --color=auto'

###########################

alias less='less -RXF' # R for colours, XF makes it act like cat if only 1 pg

###########################

# by having a space at the end of 'sudo', it expands the next alias too!
alias sudo='sudo '
