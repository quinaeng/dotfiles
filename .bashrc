# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'

function git_branch() {
	s=$(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/(\1)/p")
  if [ ! "$s" = "" ]; then
    echo $s
  fi
}
export PS1='\n\w\n\[\[\033[0;36m\]\u@\h\033[0;32m\]$(git_branch)\[\033[0m\]$ '


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
