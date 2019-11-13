" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

  " THEMING
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
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-endwise'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'tomtom/tcomment_vim'  " Easily comment with gc
  Plug 'neomake/neomake'

  " JS TOOLS
  Plug 'pangloss/vim-javascript'
  
  " C,C++ TOOLS
  Plug 'deoplete-plugins/deoplete-clang'
  Plug 'octol/vim-cpp-enhanced-highlight'

  " PYTHON TOOLS
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

" General Bindings {{{
  " Change mapleader
  let mapleader = ","
  " Toggle paste mode (not needed for nvim)
  set pastetoggle=<F2>
  " Toggle Tagbar
  nmap <S-T> :TagbarToggle<CR>
  " Exit from vim in normal mode
  nnoremap <C-D> :q<cr>
  " Esc is too far 
  nnoremap <C-C> <Esc>
  vnoremap <C-C> <Esc>
  inoremap <C-C> <Esc>
  " Space opens/closes folds
  nnoremap <space> za
  " Edit/load init.vim bindings
  nnoremap <leader>ev :vsp $MYNVIMRC<CR> 
  nnoremap <leader>sv :source $MYNVIMRC<CR>
  " Use C-s for saving
  noremap <C-S> :update<CR>
  vnoremap <C-S> <C-C>:update<CR>
  inoremap <C-S> <Esc>:update<CR>
  " Quick switch tabs
  nnoremap <C-E> gt
  vnoremap <C-E> gt
  inoremap <C-E> gt
  nnoremap <C-Q> gT
  vnoremap <C-Q> gT
  inoremap <C-Q> gT
  " Delete for real
  nnoremap <leader>d "_d
  xnoremap <leader>d "_d
  nnoremap <leader>x "_x
  xnoremap <leader>x "_x
  xnoremap <leader>p "_dP
  " Copy to system clipboard
  noremap <leader>y "+y
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
  set mouse=a                               " Automatically enable mouse usage
  set mousehide                             " Hide the mouse cursor while typing
  set hidden                                " Buffer settings
  set showmode                              " Show current mode
  set nowrap                                " Do not wrap long lines
  set linebreak                             " Wrap lines at convenient points
  set title                                 " Show filename in titlebar
  set splitbelow                            " Show preview at bottom
  set scrolloff=3                           " Scroll 3 lines before window edge
  set showmatch                             " Highlight matching parenthesis
  set clipboard=unnamed                     " Use OS clipboard
  scriptencoding utf-8                      " Default to UTF-8 encoding
  set encoding=utf-8
" }}}

" Deoplete {{{
  " Close preview window after completion
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 100
  " Clang config
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-9/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-9/lib/clang'
" }}}

" Neomake {{{
  call neomake#configure#automake('w')
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_python_enabled_makers = ['flake8']
  nnoremap <leader>lo :lopen <CR>
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

" Better-Whitespace {{{
  let g:better_whitespace_ctermcolor=52 " dark red
  let g:better_whitespace_enabled=0
  let g:strip_whitespace_on_save=0
" }}}

" Supertab {{{
  " Reverse tab order in dropdown list
  let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" Vim-Airline {{
  let g:airline_powerline_fonts = 1
" }}}

" Base16 Shell {{{
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
" }}}

" Python {{{
  autocmd BufNewFile, BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=79 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix |
  autocmd BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" }}}

" C++ {{{
  au BufNewFile, BufRead *.cpp,*.cc,*.hpp,*.h,*.c
    \ setlocal expandtab |
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4
" }}}


set laststatus=2
