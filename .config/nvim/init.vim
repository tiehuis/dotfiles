" vim-plug and things
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" general
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go'
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ciaranm/detectindent'
Plug 'nacitar/a.vim'

" lang-specific
Plug 'zig-lang/zig.vim'
Plug 'rust-lang/rust.vim'

" colorschemes
Plug 'tiehuis/0x4545-256.vim'

call plug#end()

let g:fzf_action = { 'enter': 'tab split' }
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" shortcut for fzf file searching
nnoremap <C-P> :Files<CR>

" indentation based on file-type is okay
filetype plugin indent on

" use the most minimal syntax highlighting possible
syntax on
colorscheme desert

" git
autocmd Filetype gitcommit setlocal spell tw=72

" markdown
au BufNewFile,BufFilePre,BufRead *.md set ft=markdown tw=80 fo+=t

" spellcheck markdown files only
autocmd FileType markdown setlocal spell spelllang=en_nz

" html uses two spaces
autocmd FileType html,yaml setlocal ts=2 sts=2 sw=2

" persistent undo for cross-sessions
set undofile
set undodir=~/.config/nvim/undo//
set undolevels=1000
set undoreload=1000

" backups are useful when you need them
set backup
set backupdir=~/.config/nvim/back//
set directory=~/.config/nvim/swap//

" ensure backup directories are present (Note: takes ~5ms)
silent !mkdir ~/.config/nvim/back// > /dev/null 2>&1
silent !mkdir ~/.config/nvim/swap// > /dev/null 2>&1
silent !mkdir ~/.config/nvim/undo// > /dev/null 2>&1

" @signify
let g:signify_vcd_list = [ 'git' ]

" @vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" need to know where those 80 lines are
set colorcolumn=81

" zig + set line length to 100
au BufNewFile,BufFilePre,BufRead *.zig set filetype=zig cc=101

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
set clipboard=unnamed

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

" disable syntax highlighting on long lines
set synmaxcol=200

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
set scrolloff=15

" if we forget to open a file as root, allow a write anyway
cmap w!! w !sudo tee > /dev/null %

" Change colours so colorcolumn has a really subtle effect
highlight ColorColumn cterm=reverse ctermfg=0 ctermbg=1
