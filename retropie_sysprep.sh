#!/bin/bash
# RetroPie Fine Tuning Script

# install a few needed packages
apt-get install vim -y
apt-get remove vim.tiny -y

# messaging off, setup a few aliases and default editors
cat <<EOF >> /etc/bash.bashrc

mesg n

# aliases
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias c='clear'
alias cls='clear'
alias vi='vim'

# set default text editor
export EDITOR='vim'
export VISUAL='vim'
EOF

# setup defaults for vim
cat <<EOF >> /etc/vim/vimrc.local
" default settings for vim
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set smartcase
  set incsearch
  set showmatch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

colorscheme desert
set background=dark
EOF

# create wifi-import-file
touch /boot/wifikeyfile.txt

# Download es_theme_pigrrl
#cd /etc/emulationstation/themes
#git clone -q https://github.com/smartroad/es_theme_pigrrl.git

# Install PiTFT (fbcp) Support
cd
curl -sO https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/pitft-fbcp.sh
#sudo bash pitft-fbcp.sh

# Installing Keypress (retrogame) support
curl -sO https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/retrogame.sh
sudo bash retrogame.sh

# Overclocking
#cat <<EOF >> /boot/config.txt
#
##Overclock Settings
#arm_freq=1350
#gpu_freq=500
#sdram_freq=500
#over_voltage=5
#v3d_freq=525
#EOF
