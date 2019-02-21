" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-sensible'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-endwise'
Plug 'flazz/vim-colorschemes'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
" Plug 'Valloric/YouCompleteMe' " too slow
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Colors {{{
  " Better colorscheme over the default
  " let g:solarized_termcolors=16
  " let g:solarized_term_italics = 1    " set to 1 to enable italics in the terminal
  " let g:solarized_termtrans = 1       " This gets rid of the grey background
  let g:solarized_use16 = 0
  set background=dark
  colorscheme solarized8                " remove the _flat suffix to obtain the OG scheme
  " hi Comment ctermfg = 241            " darken comment color for solarized theme  
" }}}

" Set syntax highlighting for *.ejs same as html
au BufNewFile,BufRead *.ejs set filetype=html

" Toggle for annoying indent on text paste
set pastetoggle=<F2>

" Traditional select all mapping
" map <C-a> <esc>ggVG<CR>  # reserved for tmux

" Crtl + c for copy visual selection
imap <C-c> "+y<CR>

" Map Ctrl+V to paste, Ctrl+C to copy, paste shortcut with paste toggle
" imap <C-V> <C-R>*
" vmap <C-C> "+y
" nmap <C-V> "+p

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

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
" }}}

" Rust {{{
  let g:rustfmt_autosave = 1                " Run :RustFmt on save
" }}}

" NERDTree {{{
  " Open NERDTree automatically when vim opens a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " Assign F9 for toggling NERDTree
  map <F12> :NERDTreeToggle<CR>
  " Close vim if NERDTree is the only open window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Change default arrows
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
" }}}

" FastFold {{{
  let g:fastfold_savehook = 0
  let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
  let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
  let g:vimsyn_folding = 'af'
  let g:tex_fold_enabled = 1
" }}}

" Base16 Shell
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

" Powerline bar
set rtp+=$HOME/anaconda3/lib/python3.6/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Set Shift-t for TagBar toggling
nmap <S-t> :TagbarToggle<CR>
