" GUI style
" =========

" Adjust color scheme
colorscheme murphy
if &term == "pcterm"
  set background=dark
endif
" Font for gvim
set guifont=Terminus\ 12

" Custom shortcuts
" ================

  " Tabs
  " ----
  "
" Open tab to edit selected file.
nnoremap <TAB>e :browse edit<CR>
" Open new tab and edit selected file.
nnoremap <TAB>o :browse tabedit<CR>

" File utils
" ----------
"
" Save as ...
nnoremap <S-F2>  :browse saveas<CR>
" Find a word, only gvim.
nnoremap <F4>    :promptfind<CR>
" Find and replace a word, only gvim.
nnoremap <S-F4>  :promptrepl<CR>
" Find file in current directory.
"vmap <F4>           :find<CR>
" Move current line to up.
inoremap <C-S-UP>        <ESC>Vd-1gP-1gi
" Move current line to down.
inoremap <C-S-DOWN>      <ESC>Vd+1gP-1gi
" Copy to clip current position
vnoremap <C-c>       <ESC>"+y<CR>
" Paste clip to current position
inoremap <C-v>       <ESC>"+pa
" Turn off useless toolbar (toggle with <F9>)
set guioptions-=T
" Turn off menu bar (toggle with <F11>)
set guioptions-=m
" Turn off right-hand scroll-bar (toggle with <F12>)
set guioptions-=R
set guioptions-=L
set guioptions-=r
set guioptions-=l
" Show/hidden tool bar
nnoremap <F9>    :set guioptions+=T<CR>
nnoremap <S-F9>  :set guioptions-=T<CR>
" Turn on/off the menu bar
nnoremap <F11>   :set guioptions+=m<CR>
nnoremap <S-F11> :set guioptions-=m<CR>
" Toggle the right-hand scroll bar
nnoremap <F12>   :set guioptions+=r<CR>
nnoremap <S-F12> :set guioptions-=r<CR>
"
" Editing
" -------
" http://vim.wikia.com/wiki/Quick_yank_and_paste

