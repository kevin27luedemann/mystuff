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

" VimWiki
Plugin 'vimwiki/vimwiki'

" Calender plugin
Plugin 'mattn/calendar-vim'

" Table math options
Plugin 'dhruvasagar/vim-table-mode'

" taskwarrior plugin for vimwiki
"Plugin 'tools-life/taskwiki'

call vundle#end()     " required
filetype plugin on    " required

" For Spreadsheet plugin
" let g:vimwiki_table_mappings=0
" let g:vimwiki_table_auto_fmt=0

" For Grammer checker
" Command to get LanguageTool: wget https://languagetool.org/download/LanguageTool-latest-Snapshot.zip
let g:languagetool_jar='$HOME/LanguageTool-5.9/languagetool-commandline.jar'
let g:languagetool_lang='en-US'

" For VimWiki to work with markdown and only interpret the wiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
" let g:vimwiki_global_ext = 0

" For youcompleteme
let g:ycm_filetype_blacklist={'notes': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'infolog': 1, 'mail': 1}

" For vim-fugitive
map <leader>ga :Git add % <CR>
map <leader>gc :Git commit <CR>
map <leader>gs :Git status <CR>

" For calendar
let g:calendar_monday = 1
let g:calendar_weeknm = 3
let g:calendar_number_of_months = 5

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
	autocmd BufNewFile,BufRead *.md
		\ set spell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set foldmethod=manual |
	autocmd BufNewFile,BufRead *.de.md
		\ set spell |
		\ set spelllang=de |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set foldmethod=manual |
	autocmd BufNewFile,BufRead COMMIT_EDITMSG
		\ set spell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
		\ set foldmethod=manual |
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
	autocmd BufNewFile,BufRead *.tex
		\ set spell |
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set autoindent |
		\ set expandtab |
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
colorscheme koehler

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"some makros for doing executive stuff
map <F12> :!make clean run <CR>
map <F11> :!time python3 %<CR>
noremap <F10><F10> :hi Normal ctermbg=White ctermfg=Black <CR>
noremap <F10><Space> :color zellner <CR>
map <F8> :!pdflatex %<CR>

