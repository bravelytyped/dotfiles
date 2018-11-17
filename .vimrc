" Load Pathogen from its submodule location.
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Turn on Solarized Dark.
syntax enable
set background=dark
colorscheme solarized

" Tabs should be 2 spaces by default.
set expandtab
set softtabstop=2
set shiftwidth=2

" Always use UTF-8.
set fileencoding=utf-8

" Show line numbers and disable line wrapping.
set number
set nowrap

" Turn on filetype detection.
filetype plugin indent on
