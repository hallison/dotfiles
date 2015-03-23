set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
      \ 'file': '\.exe$\|\.so$\|\.dll$|\.gif$|\.jpg$|\.png$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" nnoremap <silent><leader>f :CtrlP<cr> 
" nnoremap <silent><leader>b :CtrlPBuffer<cr>
