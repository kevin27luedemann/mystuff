"vundle stuff
set nocompatible " be iMproved, required
filetype off     " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle
Plugin 'VundleVim/Vundle.vim'

" autocompletion
Plugin 'Valloric/YouCompleteMe'

" latexsuite
Plugin 'vim-latex/vim-latex'

" Nerd Tree
Plugin 'scrooloose/nerdtree'

" Git Plugin
Plugin 'tpope/vim-fugitive'

" Grammer Checker
Plugin 'dpelle/vim-LanguageTool'

call vundle#end()     " required
filetype plugin on    " required

" For Grammer checker
:let g:languagetool_jar='$HOME/LanguageTool-5.6/languagetool-commandline.jar'
:let g:languagetool_lang='en-US'

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"remove bell and flashing
set noerrorbells visualbell t_vb=
"manage specific autocomands
if has("autocmd")
	"remove bell and flashing
	autocmd GUIEnter * set visualbell t_vb=
	" Some filetype specifics
	autocmd FileType Latex 
		\ set spell |
		\ set foldmethod=syntax |
	autocmd BufNewFile,BufRead *.rst
		\ set spell |
		\ set tabstop=3 |
		\ set shiftwidth=3 |
		\ set autoindent |
		\ set expandtab |
		\ set foldmethod=manual |
	autocmd BufNewFile,BufRead *.py
		\ set nospell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set cc=80 |
		\ set foldmethod=indent |
	augroup filetypedetect
  		au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
	augroup END
	autocmd BufNewFile,BufRead *.jl
		\ set nospell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set foldmethod=manual |
	autocmd BufNewFile,BufRead *.cpp
		\ set nospell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set cc=80 |
		\ set foldmethod=syntax |
	autocmd BufNewFile,BufRead *.c
		\ set nospell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set cc=80 |
		\ set foldmethod=syntax |
	autocmd BufNewFile,BufRead *.h
		\ set nospell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set cc=80 |
		\ set foldmethod=syntax |
	autocmd BufNewFile,BufRead *.cu
		\ set nospell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set cc=80 |
		\ set foldmethod=syntax |
	autocmd BufNewFile,BufRead *.json
		\ set nospell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set foldmethod=manual |
	autocmd FileType cuda set ft=cuda.cpp
	autocmd BufNewFile,BufRead *.cu set filetype=cpp
	" Load folds automatically
	"autocmd BufWinLeave *.* mkview
	"autocmd BufWinEnter *.* silent loadview
	" load Nerd Tree for directories
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
endif
"Set for all methods afterwards to manual
set foldmethod=manual

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"window managing
" specify where to split
set splitbelow
set splitright
" set line rapping on
set wrap linebreak nolist
" Nerd Tree mapping
map <C-n> :NERDTreeToggle<CR>
" Fugitive mappings
map <C-g>s :Gstatus<CR>
map <C-g>c :Gcommit<CR>

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"folding
"set foldmethod=manual
" Enable folding with the spacebar
nnoremap <space> za
vnoremap <space> zf

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"key mapping for editing
nnoremap k gk
nnoremap j gj
"inoremap öö <esc>
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"saving with strg+s
noremap <c-s> :up<CR>
inoremap <c-s> <Esc>
vnoremap <c-s> <Esc>
"fix brocken backspace
set backspace=2

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"general settings
syntax on
set encoding=utf-8
set scrolloff=7
set sidescroll=10
set number 
set ruler
set showcmd
set cursorline
"color settings (make sure these are very high contrast)
"colorscheme zellner

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"youcompletme settings
"let g:ycm_clangd_binary_path = "/opt/clang/bin/clangd"
"
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"some makros for doing executive stuff
map <F12> :!make clean run <CR>
map <F11> :!time python3 %<CR>
noremap <F10><F10> :hi Normal ctermbg=White ctermfg=Black <CR>
noremap <F10><Space> :color zellner <CR>
map <F8> :!pdflatex %<CR>

