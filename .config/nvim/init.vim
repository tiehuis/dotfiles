" vim-plug and things
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" general
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'reedes/vim-colors-pencil'
Plug 'tiehuis/0x4545-256.vim'
Plug 'vim-scripts/a.vim'

" lang-specific
Plug 'rust-lang/rust.vim'

call plug#end()

" indentation based on file-type is okay
filetype plugin indent on

" use the most minimal syntax highlighting possible
syntax on
colorscheme 0x4545-256

" git
autocmd Filetype gitcommit setlocal spell textwidth=72

" markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown tw=80 fo+=t

" adjust colorscheme for markdown
autocmd FileType markdown colorscheme pencil

" spellcheck markdown files only
autocmd FileType markdown setlocal spell spelllang=en_nz

" backups are useful when you need them
set backup
set backupdir=~/.config/nvim/back//
set directory=~/.config/nvim/swap//

" ensure backup directories are present (Note: takes ~5ms)
silent !mkdir ~/.config/nvim/back// > /dev/null 2>&1
silent !mkdir ~/.config/nvim/swap// > /dev/null 2>&1

" @ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_cache_dir = '~/.cache/ctrlp'

" @signify
let g:signify_vcd_list = [ 'git' ]

" easier to open in new tabs
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")' : ['<c-t>'],
    \ 'AcceptSelection("t")' : ['<cr>', '<2-LeftMouse>'],
    \ }

" @vim-colors-pencil
let g:pencil_gutter_color = 1
let g:pencil_terminal_italics = 1

" need to know where those 80 lines are
set colorcolumn=80

" key mappings
map j gj
map k gk

" set new leader
let mapleader=","

" don't ask for confirmation on opening already open file
augroup MultipleEdit
    autocmd!
    autocmd SwapExists * :let v:swapchoice = 'e'
augroup END

" avoid some annoying c brace 'errors'
let c_no_curly_error=1

" use the system clipboard by default: linux
let g:clipbrdDefaultReg = '+'

" use jj to leave insert mode
inoremap jj <esc>

" disable documentation on Shift-K
map <S-K> <nop>
map <S-J> <nop>

" remove accidental shift-j annoying functionality
nnoremap JJJJ <nop>

" disable accidental shift-up documentation open
nnoremap <S-k> <nop>

" move between lines more obviously
nnoremap <silent> k gk
nnoremap <silent> j gj

" who can remember which keys switch tabs?
nnoremap <silent> <c-right> :tabnext<CR>
nnoremap <silent> <c-left> :tabprevious<CR>

" allow moving pages in files a litlle easier
nnoremap <silent> <c-h> zH
nnoremap <silent> <c-j> <PageDown>
nnoremap <silent> <c-k> <PageUp>
nnoremap <silent> <c-l> zL

" and opening new tabs
nnoremap <silent> <c-t> :tabnew<CR>

" this is a pretty useful tip
nore ; :
nore : ;

" use 4 spaces by default
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" show the command bar
set showcmd

" the long cursorline is ugly, blinking is enough
set nocursorline

" use the wildmenu of course
set wildmenu

" prompt instead of failing
set confirm

" automatically change to directory of file when editing
set autochdir

" always show current position
set ruler

" dont redraw during macros
set lazyredraw

" show matching brackets and things
set showmatch
set matchtime=2

" highlight search matches
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" while not used often, mouse is nice to have
set mouse=a

" don't keep buffers lying around if not visible
set hidden

" take note off external file changes
set autoread

" make messages fit in prompt
set shortmess=at

" ignore case when searching
set ignorecase

" except if explicit uppercase characters
set smartcase

" try keep to the same column when moving rows
set nostartofline

" some automatic indentation
set autoindent
set smartindent

" backspace over everything
set backspace=2

" allow special characters during searches
set magic

" usual defaults
set background=dark
set encoding=utf8
set fileformats=unix,dos,mac

" disable automatic wrapping
set formatoptions-=t

" dont wrap lines
set nowrap

" dont need ! modifier when saving files
set writeany

" set fold settings
set foldmethod=syntax
set nofoldenable

" allow some terminal performance improvements
set ttyfast

" keep some space around above and below current line
set scrolloff=20

" if we forget to open a file as root, allow a write anyway
cmap w!! w !sudo tee > /dev/null %

" Change colours so colorcolumn has a really subtle effect
highlight ColorColumn cterm=reverse ctermfg=0 ctermbg=1
