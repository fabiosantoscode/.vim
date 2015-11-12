" save backup files in another folder
silent execute '!mkdir -p ~/.vim/tmp'

source $HOME/.vim/vundle.config

set mouse=a

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//

set enc=utf-8
set fileformat=unix

set ignorecase
set smartcase

set incsearch
set hlsearch
"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" split windows
set splitright
set splitbelow

set number " show line numbers
set ruler

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set bs=start,indent,eol
set wildmenu

syntax enable
set background=dark

colorscheme desert

set guifont=monaco:h12

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

" open quickfix automatically for :grep :make etc
" autocmd QuickFixCmdPost * :cwindow 5

imap § <C-y>,

" force syntax coloring of full file
map <leader>c :syntax sync fromstart<CR>

" set spacing scheme for ruby and js files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" disable cursorline for ruby files (slows down vim... wtf)
autocmd Filetype ruby set nocursorline

" force syntax highlight of the whole file (problem in big files)
autocmd BufEnter * :syntax sync fromstart

au BufRead,BufNewFile *.php set filetype=php.html
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.hbs set filetype=html

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g`\"" | endif

" for python files, avoid auto removal of identation in comments
autocmd BufRead *.py inoremap # X<c-h>#<space>

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$/










" fabios custom part lel

" Stamp stuff
set nocp
set backspace=2

" syntax highlighting
set syn=on
syntax enable

" indentation
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" spell checking
if version >= 700
    set spl=en spell
    set nospell
endif

" searching
set incsearch
set hlsearch

" status line
set statusline=%F%m%r%h%w\ [%l,%v]

" system clipboard
silent! set clipboard=unnamed
silent! set clipboard=unnamedplus

" load other stuff
"command line mode with double space!"
let mapleader=" "
noremap <leader><space> :

inoremap jj <Esc>:
noremap ,l <Esc>:JSHint<CR>
nnoremap ,s :AutoSaveToggle<CR>

inoremap $$ [].slice.call(arguments)

inoremap << <leader>{<CR>}<Up><End><Cr>

inoremap <forin <Esc>^"tc$for (var k in <Esc>"tpa) if (<Esc>"tpa.hasOwnProperty(k)) {<CR>}<Up><End><Cr>
inoremap <foreach <Esc>^"tc$for (var i = 0; i < <Esc>"tpa.length; i++) {<Cr>}<Up><End><Cr>
inoremap <if <Esc>^"tc$if (typeof <Esc>"tpa !== 'undefined') {<Cr>}<Up><End><Cr>
inoremap <require <Esc>^"tc$var <Esc>"tpa = require('<Esc>"tpa')



inoremap <func function () {}<Esc>T(i

" navigation
nnoremap ,h <esc>:tabprev<cr>
nnoremap ,l <esc>:tabnext<cr>

silent! set wildignorecase

function! DefaultColorScheme()
    " :try :catch doesn't work in my gVim
    let x = "nothing"
    silent! let x = g:colors_name
    if x == "nothing"
        colorscheme desert
    endif
endfunction

call DefaultColorScheme()

" Don't let vimautosave change the updatetime, it fucks everything
let g:auto_save_no_updatetime = 1

