#!/bin/bash
# PiBakery RetroPie Raspbian lite System Preparation

# update system and install RetroPie required packages
apt-get update -y && apt-get dist-upgrade -y
apt-get install git lsb-release vim -y

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

# create wifi-import-file # set ssid/pass in PiBakery
cat <<EOF >> /boot/wifikeyfile.txt
ssid=""
psk=""
EOF

# Clone RetroPie Repo
cd
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup
chmod +x retropie_setup.sh
sudo ./retropie_setup.sh
