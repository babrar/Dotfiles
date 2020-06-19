# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/babrar/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load?
plugins=(
  zsh-autosuggestions
  fzf
  git
  git-extras
  command-not-found
  python
  docker
  npm
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias la='ls -A'
alias dog='highlight -O ansi --force'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias nv="nvim"
alias py3='python3'

function open()
{
  xdg-open "$1"
}

# You may need to manually set your language environment
export LANG=en_US.UTF-8

## Plugin Conf ##
export FZF_BASE=`which fzf`
export FZF_DEFAULT_COMMAND="fdfind --hidden --type f -E .git -E .vscode -E __pycache__ -E node_modules"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type d"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Hide agnoster theme's username@host
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}