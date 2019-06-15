call plug#begin('~/.config/nvim/plugged')
    " general
    Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/vim-peekaboo'
    Plug 'junegunn/vim-easy-align'
    Plug 'mhinz/vim-signify'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ciaranm/detectindent'
    Plug 'nacitar/a.vim'

    " lang-specific
    Plug 'zig-lang/zig.vim'
    Plug 'fatih/vim-go'

    " colorschemes
    Plug 'tiehuis/0x4545-256.vim'
call plug#end()

" @general
    set nocompatible

    " minimal syntax highlighting
    set synmaxcol=200
    syntax on
    colorscheme 0x4545-256

    " indentation based on file-type is okay
    filetype plugin indent on

    " long-line marker, inverted for subtle effect
    set colorcolumn=81

    " use the system clipboard by default: linux
    set clipboard=unnamed

    " use 4 spaces by default
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

    " prompt instead of failing
    set confirm

    " dont redraw during macros
    set lazyredraw

    " show matching brackets and things
    set showmatch matchtime=2

    " while not used often, mouse is nice to have
    set mouse=a

    " make messages fit in prompt
    set shortmess=at

    " ignore case when searching, except if explicit uppercase
    set ignorecase smartcase

    " some automatic indentation
    set autoindent smartindent

    " usual defaults
    set background=dark
    set encoding=utf8
    set fileformats=unix,dos,mac

    " disable automatic wrapping and soft visual wrapping
    set nowrap formatoptions-=t

    " dont need ! modifier when saving files
    set writeany

    " don't need folding
    set nofoldenable

    " keep some space around above and below current line
    set scrolloff=15

    " persistent undo across sessions
    set undofile

    " backups are invaluable when you accidently rm something
    set backup
    silent !mkdir ~/.local/share/nvim/backup// > /dev/null 2>&1
    set backupdir=~/.local/share/nvim/backup//

" @plugin config
    " @fzf
        let g:fzf_action = { 'enter': 'tab split' }
        let g:fzf_buffers_jump = 1
        let g:fzf_tags_command = 'ctags -R'

        " ctrl-p mimic
        nnoremap <C-P> :GitFiles<CR>
        nnoremap <C-O> :Files<CR>

    " @vim-easy-align
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)

    " @zig
        let g:zig_fmt_command = ['zig', 'fmt', '--color', 'off']
        let g:zig_fmt_autosave = 1

    " @signify
        let g:signify_vcd_list = [ 'git' ]

" @key remapping
    nore ; :
    nore : ;

    " move lines visually and not by actual lines
    map j gj
    map k gk

    let mapleader=","

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

    " who can remember which keys switch/open tabs?
    nnoremap <silent> <c-right> :tabnext<CR>
    nnoremap <silent> <c-left> :tabprevious<CR>
    nnoremap <silent> <c-t> :tabnew<CR>

    " hjkl now move pages with ctrl modifier
    nnoremap <silent> <c-h> zH
    nnoremap <silent> <c-j> <PageDown>
    nnoremap <silent> <c-k> <PageUp>
    nnoremap <silent> <c-l> zL

    " if we forget to open a file as root, allow a write anyway
    cmap w!! w !sudo tee > /dev/null %

    " disable search hl with ', '
    nnoremap <leader><space> :nohlsearch<CR>

" @file overrides
    augroup FileSettings
        autocmd!
        autocmd FileType gitcommit setlocal spell spelllang=en_nz tw=72
        autocmd FileType markdown setlocal spell spelllang=en_nz tw=80 fo+=t
        autocmd FileType html,yaml setlocal ts=2 sts=2 sw=2
        autocmd FileType zig set cc=101
    augroup END

    " don't ask for confirmation on opening already open file
    augroup MultipleEdit
        autocmd!
        autocmd SwapExists * :let v:swapchoice = 'e'
    augroup END

