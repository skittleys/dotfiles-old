#####################
##     Add-ins     ##
#####################
[[ -f "/etc/bash_completion" ]] && source "/etc/bash_completion"
[[ -f "${HOME}/.bash_functions" ]] && source "${HOME}/.bash_functions"
[[ -f "${HOME}/.bash_aliases" ]] && source "${HOME}/.bash_aliases"

#####################
##     History     ##
#####################
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

#####################
##   Other shopts  ##
#####################
#xhost +local:root > /dev/null 2>&1
#complete -cf sudo

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s globstar
shopt -s hostcomplete
shopt -s nocaseglob
export EDITOR=nano

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#####################
##   Colourful    ##
#####################

# eval `dircolors ~/.dir_colors`

# Color man pages
export LESS_TERMCAP_mb=$(printf '\e[0;31m')
export LESS_TERMCAP_md=$(printf '\e[1;35m')
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_so=$(printf '\e[0;45;30m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_us=$(printf '\e[0;34m') 

#####################
##     Prompt      ##
#####################
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

force_color_prompt=yes

# derived from http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux
c="\[\033["
p="${c}0;37m\]"
pt1="\n\[\033[0;37m\]╔═══ǁ ${c}0;3\$(if [ \$? -eq 0 ]; then echo '2'; else echo '1'; fi)m\]*$p ǁ ${c}36m\]\A$p ǁ ${c}1;35m\]\j$p ǁ ${c}3
5m\]${debian_chroot:+($debian_chroot)}\u$p ǁ ${c}34m\]\w$p ǁ"
pt2="\n╚═${c}0;3\$(if [ ${EUID} -eq 0 ]; then echo '1'; else echo '4'; fi)m\]»${c}m\] "

# git stuff
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true
g="\[\033[38;5;155m\]\[\033[48;5;235m\]"

#$(git branch &>/dev/null; \
#if [ $? -eq 0 ]; then \
#       git_branch=$(__git_ps1 ' %s ') \
#       pt1="$pt1 $g$git_branch$p ǁ" \
#fi)

PS1=$pt1$c'0;33m\] ''$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo $( __git_ps1 " %s "); fi)'$p$pt2
#PS1=$pt1$pt2
