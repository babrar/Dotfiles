# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/babrar/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Stop Ctrl-S from freezing term. Remapped as 'save' in vim.
stty -ixon

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-extras
  command-not-found
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export LANG="en_US.UTF-8"

# User configuration

# Must use
export EDITOR="vim"
export GIT_EDITOR=vim
export VISUAL=vim
# export MANPATH="/usr/local/man:$MANPATH"

# added by Anaconda3 installer
# ananconda3 snatches gsettings. Rename ~/ananconda/bin/gsettings to gsettings_conda
export PATH="/home/babrar/anaconda3/bin:$PATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshcfg="vim ~/.zshrc"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
# alias from bash
alias la='ls -A'
alias py='python'

if [ -n $TMUX  ]; then
    alias vim="TERM=screen-256color vim"
fi

# Launch tmux on start up
if [ `which tmux 2> /dev/null` -a -z "$TMUX" ]; then
    tmux -2 attach || tmux -2 new; exit
fi

# Rust
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

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

# FUNCTIONS
function mkd ()
{
	mkdir -p -- "$1" && cd -P -- "$1"
}

function refreshenv ()
{
	source ~/.zshrc
}

# Add powerline to path
if [ -d "$HOME/anaconda3/bin" ]; then
    PATH="$HOME/anaconda3/bin:$PATH"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

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

# Add poweline config
#if [[ -r ~/anaconda3/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#    	source ~/anaconda3/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
#fi
