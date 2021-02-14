" Enable filetype plugin
:filetype plugin on

" save backup files in another folder
silent execute '!mkdir -p ~/.vim/tmp'

source $HOME/.vim/vundle.config

set mouse=a

" Resizing splits inside vim support (not for nvim)
if !has('nvim')
    set ttymouse=xterm
endif

set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/

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

" open quickfix automatically for :grep :make etc
" autocmd QuickFixCmdPost * :cwindow 5

" force syntax coloring of full file
map <leader>c :syntax sync fromstart<CR>

" set spacing scheme for ruby and js files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" disable cursorline for ruby files (slows down vim... wtf)
autocmd Filetype ruby set nocursorline

" force syntax highlight of the whole file (problem in big files)
autocmd BufEnter * :syntax sync fromstart

au BufRead,BufNewFile *.php set filetype=php.html
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.vue set filetype=html
au BufRead,BufNewFile *.hbs set filetype=html
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.tsx set filetype=typescript
au BufRead,BufNewFile *.mdx set filetype=markdown

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g`\"" | endif

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$/








" fabios custom part lel

source /home/fabio/.vim/autoload/pathogen.vim

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

inoremap <forin <Esc>^"tc$for (const k in <Esc>"tpa) if (<Esc>"tpa.hasOwnProperty(k)) {<CR>}<Up><End><Cr>
inoremap <forof <Esc>^"tc$for (const item of <Esc>"tpa) {<CR>}<Up><End><Cr>
inoremap <foreach <Esc>^"tc$for (let i = 0; i < <Esc>"tpa.length; i++) {<Cr>}<Up><End><Cr>
inoremap <if <Esc>^"tc$if (typeof <Esc>"tpa !== 'undefined') {<Cr>}<Up><End><Cr>
inoremap <require <Esc>^"tc$const <Esc>"tpa = require('<Esc>"tpa')
inoremap <import <Esc>^"tc$import <Esc>"tpa from '<Esc>"tpa'

" Click to go to definition
nnoremap v<LeftMouse> <Esc>:ALEGoToDefinition -vsplit<Cr>
nnoremap s<LeftMouse> <Esc>:ALEGoToDefinition -split<Cr>

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

" Pathogen
execute pathogen#infect()

" disable Tsuquiomi on javascript files
autocmd BufNewFile,BufRead *.js let g:tsuquyomi_disable_quickfix = 1

" Don't let vimautosave change the updatetime, it fucks everything
let g:auto_save_no_updatetime = 1

" Have suda.vim automatically sudo you so you can edit system files
let g:suda_smart_edit = 1

" Allow nicer colors
if has("termguicolors")
set termguicolors
endif

" colors
" https://github.com/NLKNguyen/papercolor-theme#installation
set t_Co=256
set background=light
colorscheme PaperColor


" exit terminal with esc and massive scrollback
:tnoremap <Esc> <C-\><C-n>
set scrollback=99999

" Enable linters for rust
let g:ale_linters = {'rust': ['analyzer'], 'typescript': ['tsserver'], 'python': ['mypy']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_fix_on_save = 1

autocmd BufNewFile,BufRead * :set indentexpr=|set smartindent
