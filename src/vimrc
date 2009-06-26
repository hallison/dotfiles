" Format settings
" ===============
"
" Txt2tags
autocmd BufNewFile,BufRead *.t2t set filetype=txt2tags
autocmd BufNewFile,BufRead *.txt2tags set filetype=txt2tags
augroup txt2tags
  au!
  autocmd FileType txt2tags compiler txt2tags
augroup END
set autowrite
" Markdown
autocmd BufNewFile,BufRead *.mkd      set filetype=mkd
autocmd BufNewFile,BufRead *.mark     set filetype=mkd
autocmd BufNewFile,BufRead *.markdown set filetype=mkd
" Textile
autocmd BufNewFile,BufRead *.txl      set filetype=textile
autocmd BufNewFile,BufRead *.text     set filetype=textile
autocmd BufNewFile,BufRead *.textile  set filetype=textile
" HAML
autocmd BufNewFile,BufRead *.hml      set filetype=haml
autocmd BufNewFile,BufRead *.haml     set filetype=haml
" Ruby test unit
autocmd BufNewFile,BufRead test_*.rb  compiler rubyunit

" File options and formats
" ========================

" No backup
set nobackup
" Text should be encoded UTF-8
set encoding=utf8
setglobal encoding=utf-8
" File should be encoded UTF-8
set fileencoding=utf8
setglobal fileencoding=utf-8
" Show line numbers 
set number
" No line wraps
set nowrap
" Spell checking
set spell spelllang=en,pt

" The following configuration had been found in
" http://lena.franken.de/linux/vim.html

" Preserve current indent on new lines
set autoindent
" Make backspaces delete sensibly
set backspace=indent,eol,start
" Indentation levels every two columns
set tabstop=2
" Convert all tabs to space
set expandtab
" Indent/outdent by two columns
set shiftwidth=2
" Indent/outdent to nearest tabstops
set shiftround

" GUI style
" =========

" Status line information
set statusline=\ %Y\ \|\ %{&ff}\ \|\ %04lx%04v/%04p%%\ %L\ \|\ %F%m%r%h%w
set laststatus=2
" Adjust color scheme
colorscheme darkdevel

" Custom shortcuts
" ================

" Tabs
" ----

" New tab.
nnoremap <TAB>n          :tabnew<CR>
" Open a tab through plug-in Netrw.
nnoremap <TAB>o          :tabedit .<CR>
" Split tab to edit selected file.
nnoremap <TAB>s          :split .<CR>
nnoremap <TAB>v          :vsplit .<CR>
" Close current tab (quit).
nnoremap <TAB>q          :tabclose<CR>
" Previous tab.
nnoremap <TAB><PAGEUP>   :tabprevious<CR>
" Next tab.
nnoremap <TAB><PAGEDOWN> :tabnext<CR>
" First tab.
nnoremap <TAB><HOME>     :tabfirst<CR>
" Last tab.
nnoremap <TAB><END>      :tablast<CR>

" Buffers
" -------

nnoremap <TAB><UP>       :bfirst<CR>
nnoremap <TAB><RIGHT>    :bnext<CR>
nnoremap <TAB><DOWN>     :blast<CR>
nnoremap <TAB><LEFT>     :bprevious<CR>
nnoremap <TAB><INSERT>   :badd .<CR>
nnoremap <TAB><DELETE>   :bdelete<CR>

nnoremap ,b1 :buffer 1<Return>
nnoremap ,b2 :buffer 2<Return>
nnoremap ,b3 :buffer 3<Return>
nnoremap ,b4 :buffer 4<Return>
nnoremap ,b5 :buffer 5<Return>
nnoremap ,b6 :buffer 6<Return>
nnoremap ,b7 :buffer 7<Return>
nnoremap ,b8 :buffer 8<Return>
nnoremap ,b9 :buffer 9<Return>
nnoremap ,b0 :buffer 10<Return>


" File edit utils
" ---------------

" Quickly save
nnoremap <F2>   :write<CR>
"nnoremap <F3>   :find<CR>
"nnoremap e      :edit .<CR>

" Functions
" =========

" Function for tab completion
function! TabWrapper(direction)
    let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    if !hasmapto("<TAB>")
      return "\<TAB>"
    endif
  elseif "backward" == a:direction
    return "\<C-P>"
  elseif "forward" == a:direction
    return "\<C-N>"
  elseif "keyword"
    return "\<C-X>\<C-K>"
  endif
endfunction
inoremap <TAB>   <C-R>=TabWrapper("forward")<CR>
inoremap <S-TAB> <C-R>=TabWrapper("backward")<CR>
inoremap <C-TAB> <C-R>=TabWrapper("keyword")<CR>

noremap ,m   :make %<Return>
noremap ,r   :source %<Return>
noremap ,vr  :edit ~.vimrc<Return>
noremap ,gr  :edit ~.gvimrc<Return>

