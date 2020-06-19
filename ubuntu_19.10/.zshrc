# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/babrar/.oh-my-zsh"

ZSH_THEME="agnoster"

# Stop Ctrl-S from freezing term. Remapped as 'save' in vim.
stty -ixon

plugins=(
  git
  git-extras
  command-not-found
  python
  docker
  npm
  yarn
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export LANG="en_US.UTF-8"

# User configuration

# Must use
export EDITOR="nvim"
export GIT_EDITOR=nvim
export VISUAL=nvim
# export MANPATH="/usr/local/man:$MANPATH"

# Add local lib to path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt"
# FUZZY FINDER
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fdfind --hidden --type f -E .git -E .vscode -E __pycache__ -E node_modules"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type d"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# JAVA_HOME
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
#export PATH="$JAVA_HOME/bin:$PATH"

# GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.local/lib/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:$HOME/golib

# NODEJS
NODE_VERSION=v12.13.0
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$NODE_VERSION-$DISTRO/bin:$PATH

# VIM
export MYNVIMRC="$HOME/.config/nvim/init.vim"

# SCALA_HOME
#export SCALA_HOME="/usr/local/scala"
#export PATH="$SCALA_HOME/bin:$PATH"

# SPARK_HOME
#export SPARK_HOME="/usr/local/spark"
#export PATH="$SPARK_HOME/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zc="nvim ~/.zshrc"
alias nv="nvim"
alias la='ls -A'
alias py3='python3'
alias ports='sudo lsof -i -P -n | grep LISTEN'

if [ -n $TMUX  ]; then
    alias vim="TERM=screen-256color vim"
    alias nvim="TERM=screen-256color nvim"
fi

# ============
# GIT ALIASES
# ============
alias add='git add'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit'
alias prebase='git pull rebase'
alias pull='git pull'
alias push='git push'
alias stash='git stash'
alias status='git status'
alias dog='highlight -O ansi --force'
# FUNCTIONS
function mkd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

function ff(){
  fdfind -H -t f | fzf | xargs -r $EDITOR
}

function kill-session-tmux ()
{
  if [ -z "$TMUX" ]; then
    tmux kill-session
  fi
}

function open()
{
  xdg-open "$1"
}
# key binding
zle -N kill-session-tmux
bindkey '^d' kill-session-tmux

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1"  ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh"  ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"

# Hide agnoster theme's username@host
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# Finally fire up tmux if inside an interactive shell
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
