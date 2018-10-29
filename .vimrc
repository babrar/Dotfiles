" Better colorscheme over the default
colorscheme molokai
highlight Comment cterm=bold

" Toggle for annoying indent on text paste
set pastetoggle=<F2>

" Traditional select all mapping
map <C-a> <esc>ggVG<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>


