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

###########################

alias l='less'
alias less='less -RXF' # R for colours, XF makes it act like cat if only 1 pg

###########################

# by having a space at the end of 'sudo', it expands the next alias too!
# alias sudo='sudo '

##########################

alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias untar='tar -xvf'										# can still use -z, -j, -J 
alias dmesg="dmesg -T|sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'"
alias df='df -h'
alias du='du -h'

##########################

### Debian aliases
## apt-cache
alias mad='apt-cache madison'
alias acs='apt-cache search'
alias acp='apt-cache policy'
alias rdep='apt-cache rdepends'
alias acsh='apt-cache show'
alias acsp='apt-cache showpkg'
alias acshp='apt-cache showpkg'

## apt-get
alias inst='sudo apt-get install'
alias apt-up='sudo apt-get update && sudo apt-get upgrade'
alias ad='sudo apt-get update'
alias ag='sudo apt-get upgrade'
alias asou='apt-get source'
alias abd='sudo apt-get build-dep'

## other
alias sapt='sudo aptitude'
alias findpkg='dpkg -l | grep'
