" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

  " THEMING
  " Plug 'powerline/powerline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'chriskempson/base16-vim'

  " NAVIGATION/POWER TOOLS
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-fugitive'

  " TEXTUAL PRODUCTIVITY TOOLS
  Plug 'ervandew/supertab'
  Plug 'Konfekt/FastFold'
  Plug 'tpope/vim-sensible'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-endwise'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'Yggdroot/indentLine'
  Plug 'tomtom/tcomment_vim'  " Easily comment with gc

  " C,C++ TOOLS
  Plug 'deoplete-plugins/deoplete-clang'

  " PYTHON TOOLS
  Plug 'nvie/vim-flake8'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'deoplete-plugins/deoplete-jedi'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
call plug#end()

filetype plugin indent on
" Set syntax highlighting for *.ejs same as html
au BufNewFile,BufRead *.ejs set filetype=html
" Set syntax highlighting for *.dev same as Dockerfile
au BufNewFile,BufRead Dockefile.dev set filetype=Dockerfile

" Spacing {{{
  set expandtab                             " Tabs are spaces
  set tabstop=2 shiftwidth=2 softtabstop=2  " Default tabwidth
" }}}

" Bindings {{{
  let mapleader = ","                        " Change mapleader
  set pastetoggle=<F2>                       " Toggle paste mode (not needed for nvim)
  nnoremap <C-d> :q<cr>                      " Quick exit from vim in normal mode
  noremap <C-q> <Esc>                        " Jump from visual to normal mode
  vnoremap <C-q> <Esc>                       " Jump from insert to normal mode
  inoremap <C-q> <Esc>                       " Idempotent C-q binding
  nnoremap <space> za                        " Space opens/closes folds
  nnoremap <leader>ev :vsp $MYNVIMRC<CR>     " Edit/load init.vim bindings
  nnoremap <leader>sv :source $MYNVIMRC<CR>  " Edit/load init.vim bindings
  nmap <S-t> :TagbarToggle<CR>               " Set Shift-t for TagBar toggling
  noremap <C-S> :update<CR>                  " Use C-s for saving in normal mode
  vnoremap <C-S> <C-C>:update<CR>            " Use C-s for saving in visual mode
  inoremap <C-S> <C-O>:update<CR>            " Use C-s for saving in insert mode
" }}}

" Folding {{{
  set foldenable
  set foldlevelstart=10      " Opens most folds by default
  set foldnestmax=7          " 8 nested fold max
  set foldmethod=syntax      " Folding based on file syntax
" }}}

" Backup {{{
  set number                          " Set line numbers
  set undodir^=~/.config/nvim/undo/   " Directory to put undo files
  set undofile                        " Create undo files
  set nobackup                        " No backup files
  set nowritebackup                   " No backup files while editing
  set noswapfile                      " No swap files tagbar settings
" }}}

" Miscellaneous {{{
  set showcmd                               " Show partial command while typing
  set ruler                                 " Show line/column number of cursor
  set nostartofline                         " Don't reset cursor to line start
  set backspace=indent,eol,start            " Backspace for dummies
  set linespace=0                           " No extra spaces between rows
  set autowrite                             " Automatically save before :next
  set autoread                              " Automatically reread changed files
  set mouse=                                " Automatically enable mouse usage
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
  set encoding=utf-8
" }}}

" Python {{{
  au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
  au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" }}}

" Deoplete {{{
  " Close preview window after completion
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 100
  " Clang config
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-8/lib/libclang-8.0.0.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-8/lib/clang'
" }}}

" NERDTree {{{
  " Open NERDTree automatically when vim opens a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " Assign Crtl-n for toggling NERDTree
  map <C-n> :NERDTreeToggle<CR>
  " Close vim if NERDTree is the only open window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Change default arrows
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  let g:NERDTreeShowHidden=1
" }}}

" FastFold {{{
  let g:fastfold_savehook = 0
  let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
  let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
  let g:vimsyn_folding = 'af'
  let g:tex_fold_enabled = 1
" }}}

" Base16 Shell {{{
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
" }}}

" Better-Whitespace {{{
  let g:better_whitespace_ctermcolor=52 " dark red
  let g:better_whitespace_enabled=0
  let g:strip_whitespace_on_save=0
" }}}

" Vim-Airline {{
  let g:airline_powerline_fonts = 1
" }}}

set laststatus=2
