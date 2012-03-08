autocmd BufNewFile,BufRead *.{t2t,txt2tags}         set filetype=txt2tags
autocmd BufNewFile,BufRead *.{md,mkd,mark,markdown} set filetype=markdown
autocmd BufNewFile,BufRead *.{tx,txl,text,textile}  set filetype=textile
autocmd BufNewFile,BufRead *.ru                     set filetype=ruby
autocmd BufNewFile,BufRead *.{rd,rdoc}              set filetype=rdoc

augroup ruby
  autocmd!
  " includes gems path
  autocmd FileType ruby set path+=/usr/lib/ruby/gems/*/gems/**
  autocmd BufNewFile,BufRead *.rb compiler ruby
  autocmd BufNewFile,BufRead *_test.rb compiler rubyunit
augroup END

augroup txt2tags
  autocmd!
  autocmd FileType txt2tags compiler txt2tags

