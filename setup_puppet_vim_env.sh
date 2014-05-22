#!/bin/bash
#
# Installs the modules to provide a puppet IDE for vim
# MZ, 2014

cat << EOF 
This installs a puppet IDE for vim, including the following vim plugins: 
- pathogen
- vim-puppet
- tabular
- syntastic
- tlib_vim
- vim-addon-mw-utils
- vim-snipmate
- vim-snippets

EOF
echo "Press ENTER to continue"
read

mkdir -p ~/.vim/autoload ~/.vim/bundle;
wget -O ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


cd ~/.vim/bundle

# vim-puppet
git clone https://github.com/rodjek/vim-puppet.git
# Automatic alignment of '=>' 
git clone https://github.com/godlygeek/tabular.git
# Inline syntax checking
git clone https://github.com/scrooloose/syntastic.git

# Snipmate & requirements: 
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git

# The snippets: 
git clone https://github.com/honza/vim-snippets.git



cat << EOF >> ~/.vimrc
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark

execute pathogen#infect()

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
EOF

