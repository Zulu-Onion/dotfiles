################################################################################
# zshrc @ jesse
################################################################################
# - Options
# - Remaps
# - Variables
# - Sources
# - Plugins
# - Exports
# - Helper Functions
# - Aliases
# - Settings
################################################################################

################################################################################
# Options
################################################################################

setopt prompt_subst
unsetopt correct_all

################################################################################
# Options
################################################################################

#remap  ] :cnext<CR>
#remap  [ :cprevious<CR>

################################################################################
# Variables
################################################################################

VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7

################################################################################
# Sources
################################################################################

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/bin/virtualenvwrapper.sh

################################################################################
# Exports
################################################################################

export EDITOR='vim'
export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
export PATH="~/Library/Android/sdk/tools:"$PATH
export PATH="~/Library/Android/sdk/platform-tools:"$PATH
export PATH="~/Library/Python/2.7/bin:"$PATH
export ZSH=/Users/jesse/.oh-my-zsh

################################################################################
# Plugins
################################################################################

plugins=(
  bower
  brew
  git
  history
  meteor
  node
  npm
  pip
  python
  tmux
  virtualenvwrapper
  yarn
)

################################################################################
# Helper Functions
################################################################################

hello(){ # Greeting
  echo Hello ${1:-World}
}

user_emoji(){
  case $1 in
    jesse)
      echo 😎
      ;;
    root)
      echo 🦄
      ;;
    *)
      echo $1
      ;;
  esac
}

host_emoji(){
  case $1 in
    MBP)
      echo 💻
      ;;
    *)
      echo \@$1
      ;;
  esac
}

path_emoji(){
  case $1 in
    /Users/jesse)
      echo 🏠
      ;;
    *)
      echo \:$1\$
      ;;
  esac
}

chrome(){ # Open file in Google Chrome
  open -a "Google Chrome" $1
}

brave(){ # Open file in Brave
  open -a "Brave" $1
}

################################################################################
# Aliases
################################################################################

# Commands
alias vi="vim"
alias ll="ls -alh" # show all with human readable sizes
alias lls="ll -S"  # sort by file size
alias lt="ll -t"   # sort by last modified
alias llr="ll -R"  # recursive w/ subdirectories
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias htb="sudo openvpn --config ~/Downloads/jesseflorig.ovpn"
alias updatedb="sudo /usr/libexec/locate.updatedb"

# Configs
alias src="source ~/.zshrc"
alias brc="vi ~/.bashrc"
alias zrc="vi ~/.zshrc"
alias vrc="vi ~/.vimrc"
alias trc="vi ~/.tmux.conf"

# Directories
alias docs="cd ~/Dropbox/Documents"
alias repos="cd ~/Repos"
alias downloads="cd ~/Downloads"

# Dataviser
alias cdv="cd ~/Repos/dataviser"
alias cdvv="cd ~/Repos/dataviser/webapp/dataviser"
alias sshdv="ssh -L 9200:elastic01:9200 bastion01"


# Misc
alias restart="sudo shutdown -r now"
alias esrun="repos && cd elasticsearch/bin && elasticsearch"

################################################################################
# Settings
################################################################################

ZSH_THEME="mh"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

local rc="%{$reset_color%}"        # reset color
local un="%{$fg[cyan]%}%n${rc}"    # user name
local hn="%{$fg[magenta]%}%m${rc}" # host name
local wd="%{$fg[yellow]%}%~${rc}"  # working directory
local ps=" "                       # prompt string

local ue=$(user_emoji $(whoami))
local he=$(host_emoji $(hostname -s))
local pe=$(path_emoji $(pwd))

PROMPT='${ue}${he}${wd}${ps}'
