set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" simple folding
Plugin 'tmhedberg/SimpylFold'

"Autocompletion plugin
Plugin 'Valloric/YouCompleteMe'

" check syntax after each save
Plugin 'scrooloose/syntastic'

" PEP8 checking
Plugin 'nvie/vim-flake8'

" use a goos Color Scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Filetree navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" use the powerline project
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" latex-suite
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'


call vundle#end()            " required
filetype plugin indent on    " required

"specify where to split
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" see docstrings for folded code
let g:SimpylFold_docstring_preview=1
" get PEP8 standards for python
if has("autocmd")
	au BufNewFile,BufRead *.py
    	\ set tabstop=4
    	\ set softtabstop=4
    	\ set shiftwidth=4
    	\ set textwidth=79
    	\ set expandtab
    	\ set autoindent
    	\ set fileformat=unix
" get standards for other formats
	au BufNewFile,BufRead *.js, *.html, *.css
    	\ set tabstop=2
    	\ set softtabstop=2
    	\ set shiftwidth=2
endif
" mark extra whitespaces
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" use UTF8 code
set encoding=utf-8
" YCM Python custamizations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF
" syntaxhiglighting for python
let python_highlight_all=1
syntax on
" define whenn to use color Scheme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
call togglebg#map("<F5>")
" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" load NERD Tree for key
map <C-n> :NERDTreeToggle<CR>

" Set Beeping off
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
"meine neuen Befhele
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
"7 Zeilen vor Ende scrollen
set scrolloff=7
"Zeilen nummerierung
set number 
"k auf visual k
nnoremap k gk
"j auf visual j
nnoremap j gj
"jk auf esc
inoremap öö <esc>
"F12 als make Prohaupt.pdf
map <F12> :!make <CR>
map <F8> :!pdflatex %<CR>
"noremap <silent> <C-s> <esc>:w<CR>
:nmap <c-s> :w<CR>
:imap <c-s> <Esc><c-s>
:vmap <c-s> <Esc><c-s>
"F09 als gnuplot plot.gp
map <F9> :!gnuplot %<CR>
"F09 als gnuplot plot.gp
map <F11> :!python %<CR>
"F10 für nohlsearch
:nmap <F10> :nohlsearch <CR>
:imap <F10> <ESC> :nohlsearch <CR>
"set tap as 3 spaces
set tabstop=3
"--------------------------------------------------------
