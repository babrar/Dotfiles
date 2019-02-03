" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" "Plug 'junegunn/seoul256.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-endwise'
Plug 'flazz/vim-colorschemes'
Plug 'lifepillar/vim-solarized8'
" "Plug 'altercation/vim-colors-solarized'
" Plug 'Valloric/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Better colorscheme over the default
" let g:solarized_termcolors=16
" set t_Co=256
" syntax enable
" set background=dark
" let g:solarized_termtrans = 1 " This gets rid of the grey background
" colorscheme solarized
" highlight Comment cterm=bold
" let g:solarized_term_italics = 1  " set to 1 to enable italics in the terminal
let g:solarized_termtrans = 1 " This gets rid of the grey background
set background=dark
colorscheme solarized8_flat " remove the _flat suffix to obtain the OG scheme



" Set syntax highlighting for *.ejs same as html
au BufNewFile,BufRead *.ejs set filetype=html

" Toggle for annoying indent on text paste
set pastetoggle=<F2>

" Traditional select all mapping
" map <C-a> <esc>ggVG<CR>  # reserved for tmux

" Crtl + c for copy visual selection
map <C-c> "+y<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

set number  " Set line numbers
set undodir^=~/.vim/undo/  " Directory to put undo files
set undofile
set nobackup               " No backup files
set nowritebackup          " No backup files while editing
set noswapfile             " No swap files tagbar settings


" Miscellaneous {
    set showcmd                               " Show partial command while typing
    set ruler                                 " Show line/column number of cursor
    " set spell                                 " Spell checking on
    set nostartofline                         " Don't reset cursor to line start  
    set backspace=indent,eol,start            " Backspace for dummies
    set linespace=0                           " No extra spaces between rows
    set autowrite                             " Automatically save before :next
    set autoread                              " Automatically reread changed files
    set mouse=a                               " Automatically enable mouse usage
    set mousehide                             " Hide the mouse cursor while typing
    set hidden                                " Buffer settings
    set showmode                              " Show current mode
    set nowrap                                " Do not wrap long lines
    set linebreak                             " Wrap lines at convenient points
    set title                                 " Show filename in titlebar
    set scrolloff=3                           " Scroll 3 lines before window edge
    set showmatch                             " Highlight matching parenthesis
    set clipboard=unnamed                     " Use OS clipboard
    scriptencoding utf-8                      " Default to UTF-8 encoding
" }
nmap <F8> :TagbarToggle<CR>
