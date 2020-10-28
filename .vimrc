if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-syntastic/syntastic'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Colors
syntax enable " enable syntax processing
colorscheme solarized

" Spaces & Tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" UI Config
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
filetype indent on " load file-style specific indent files
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]

" Searching
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " ignore case
set smartcase " ...unless there is an uppercase character

" Movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Plugins

" Ack
" Cmd-Shift-F will search
nmap <D-F> :Ack!<Space>-i<Space>

" Fzf
set rtp+=/usr/local/opt/fzf
" Leader-P will open FZF
nnoremap <silent> <leader>p :FZF<CR>

" Syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
