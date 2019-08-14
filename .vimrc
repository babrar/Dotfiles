" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" THEMING
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'powerline/powerline'
  Plug 'chriskempson/base16-vim'

" NAVIGATION TOOLS
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'majutsushi/tagbar'

" TEXTUAL PRODUCTIVITY TOOLS
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

" MISC TOOLS
  Plug 'Valloric/YouCompleteMe'
  Plug 'tpope/vim-fugitive'

" PYTHON TOOLS
  Plug 'nvie/vim-flake8'
  Plug 'vim-scripts/indentpython.vim'
call plug#end()

" Set syntax highlighting for *.ejs same as html
au BufNewFile,BufRead *.ejs set filetype=html
" Set syntax highlighting for *.dev same as Dockerfile
au BufNewFile,BufRead Dockefile.dev set filetype=Dockerfile

" Spacing {{{
  set expandtab                             " Tabs are spaces
  set tabstop=2 shiftwidth=2 softtabstop=2  " Default tabwidth
" }}}

" Bindings {{{

  " Change mapleader
  let mapleader = ","

  " Toggle for annoying indent on text paste
  set pastetoggle=<F2>

  " Set Shift-t for TagBar toggling
  nmap <S-t> :TagbarToggle<CR>
  " Quicker exit
  nnoremap <C-d> :q<cr>
  " Quicker exit from insert mode
  noremap <C-q> <Esc>
  vnoremap <C-q> <Esc>
  inoremap <C-q> <Esc>

  " Space opens/closes folds
  nnoremap <space> za

  " Edit/load .vimrc bindings
  nnoremap <leader>ev :vsp $MYVIMRC<CR>
  nnoremap <leader>sv :source $MYVIMRC<CR>

  " Use CTRL-S for saving, also in Insert mode
  noremap <C-S> :update<CR>
  vnoremap <C-S> <C-C>:update<CR>
  inoremap <C-S> <C-O>:update<CR>
" }}}

" Folding {{{
  set foldenable
  set foldlevelstart=10                     " Opens most folds by default
  set foldnestmax=7                         " 8 nested fold max
  set foldmethod=syntax                     " Folding based on file syntax
" }}}

" Backup {{{
  set number                 " Set line numbers
  set undodir^=~/.vim/undo/  " Directory to put undo files
  set undofile
  set nobackup               " No backup files
  set nowritebackup          " No backup files while editing
  set noswapfile             " No swap files tagbar settings
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
  let g:ycm_autoclose_preview_window_after_completion=1
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let python_highlight_all=1
  syntax on
  let g:ycm_use_clangd = 0
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

" Powerline bar {{{
  set rtp+=$HOME/.local/lib/python3.7/site-packages/powerline/bindings/vim
" }}}

set laststatus=2

