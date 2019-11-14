#!/usr/bin/env bash
# A quick bootstrap script for setting up a new Ubuntu/debian system

# TO-DO:
# Soften Alacritty version. Always download the latest version
# Soften clang version in vimrc.
# Add gestures to startup commands (update end comments afterwards)

set -x
sudo apt-get update

check_script_dir(){
  # Only allow script to be run from /home/$USER directory
  SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}"   )" && pwd)
  if [[ "$SCRIPT_DIR" != "$HOME" ]]; then
    echo "ERROR: Run the script from $HOME"
    exit 1
  fi
}

setup_color() {
  # Only use colors if connected to a terminal
  if [ -t 1 ]; then
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    BLUE=$(printf '\033[34m')
    BOLD=$(printf '\033[1m')
    RESET=$(printf '\033[m')
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    RESET=""
  fi
}

install_essentials(){
  # essential utilities
  sudo apt-get install -y g++ clang llvm-dev cmake wget curl git neovim wmctrl xdotool libinput-tools
  sudo ln -s /usr/lib/llvm-9/lib/libclang-9.so.1 /usr/lib/llvm-9/lib/libclang.so
}

install_python(){
  # install python dependencies
  sudo apt-get install -y python-pip
  sudo apt-get install -y python3-pip
  sudo apt-get install -y python-dev
  sudo apt-get install -y python3-dev
}

get_dotfiles(){
  git clone https://github.com/babrar/Dotfiles.git
  export DOTFILES_DIR=$HOME/Dotfiles
}

# Machine independant (Debian specific instruction is mentioned elsewhere)
install_docker_ce(){
  # Install Docker
  sudo apt-get update
  sudo apt-get -yy install apt-transport-https ca-certificates curl software-properties-common wget pwgen
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update && sudo apt-get -y install docker-ce

  # Install Docker Compose
  sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  # Allow current user to run Docker commands
  sudo usermod -aG docker $USER
}

# Debian specific (suited for newer machines)
install_docker(){
  sudo apt-get install -y docker.io docker-compose
  # Allow current user to run Docker commands
  sudo usermod -aG docker $USER
}

install_misc_tools(){
  sudo apt-get install -y screenfetch neofetch htop mlocate
}

customize_vim(){
  # vim-plug
  # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  #     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # fetch vim config
  # cp $DOTFILES_DIR/.vimrc .
  # vim -c "PlugInstall | q | q"
  sudo apt-get install ctags clang-tidy
  # nvim-plug
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p ~/.config/nvim
  cp $DOTFILES_DIR/init.vim ~/.config/nvim/
  nvim -c "PlugInstall |q |q"
  python3 -m pip install flake8 --user
}

customize_shell(){
  sudo apt-get install -y zsh tmux
  cp $DOTFILES_DIR/.tmux.conf .
  # install oh-my-zsh
  wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
  # Dont run zsh after installation
  export RUNZSH=no
  sh install.sh
  # base16
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  # powerline fonts
  install_powerline_fonts
  # fetch zsh configs
  cp $DOTFILES_DIR/.zshrc $HOME
  this_user=$(whoami)
  sed -i "s/babrar/$this_user/g" .zshrc
  # remove install files
  rm -f install.sh
}

install_alacritty(){
  wget https://github.com/jwilm/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-ubuntu_18_04_amd64.deb
  sudo dpkg -i Alacritty-v0.3.3-ubuntu_18_04_amd64.deb
  sudo apt-get install -f
  rm -f $HOME/.config/alacritty/alacritty.yml
  mkdir -p $HOME/.config/alacritty
  cp $DOTFILES_DIR/alacritty.yml $HOME/.config/alacritty/
  # set as default terminal
  gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/alacritty
  # remove install files
  rm -f Alacritty-v0.3.3-ubuntu_18_04_amd64.deb
}

install_powerline_fonts(){
  # clone
  git clone https://github.com/powerline/fonts.git --depth=1
  # install
  cd fonts
  ./install.sh
  # clean-up a bit
  cd ..
  rm -rf fonts
}

setup_gestures() {
  sudo gpasswd -a $USER input
  git clone https://github.com/bulletmark/libinput-gestures
  cd libinput-gestures
  sudo. /libinput-gestures-setup install
  cd ..
  cp $DOTFILES_DIR/libinput-gestures.conf ./config/
}

customize_gnome() {
# enable fractional scaling for X11
gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling']"
# turn off bluetooth by default
sudo systemctl disable bluetooth.service
}


# Core setup
check_script_dir
setup_color
install_python
install_essentials
get_dotfiles
customize_vim
setup_gestures

# Additional setup
install_misc_tools
#install_docker

# Final setup
customize_shell
#install_alacritty
customize_gnome

# clean up
sudo apt-get autoremove -y

printf "$GREEN"
cat <<-'EOF'
                                 /$$    
                                | $$    
 /$$   /$$  /$$$$$$   /$$$$$$  /$$$$$$  
| $$  | $$ /$$__  $$ /$$__  $$|_  $$_/  
| $$  | $$| $$$$$$$$| $$$$$$$$  | $$    
| $$  | $$| $$_____/| $$_____/  | $$ /$$
|  $$$$$$$|  $$$$$$$|  $$$$$$$  |  $$$$/
 \____  $$ \_______/ \_______/   \___/  
 /$$  | $$                              
|  $$$$$$/                              
 \______/                               

Setup Complete! Restart for changes.

To obtain gestures, after logging in run :
  
  libinput-gestures-setup start

To automate the process, add the command above to startup commands.

TIPS:
Use alacritty instead of gnome-terminal.
Use base16_material-darker theme for best results.
For JS development in nvim, run :CocInstall coc-tsserver 
EOF
printf "$RESET"

