" These are the mappings for snipMate.vim. Putting it here ensures that it
" will be mapped after other plugins such as supertab.vim.
if !exists('loaded_snips') || exists('s:did_snips_mappings')
	finish
endif
let s:did_snips_mappings = 1

" This is put here in the 'after' directory in order for snipMate to override
" other plugin mappings (e.g., supertab).
"
" You can safely adjust these mappings to your preferences (as explained in
" :help snipMate-remap).
inoremap <silent><leader><tab> <c-r>=TriggerSnippet()<cr>
snoremap <silent><tab>         <esc>i<right><c-r>=TriggerSnippet()<cr>
inoremap <silent><s-tab>       <c-r>=BackwardsSnippet()<cr>
snoremap <silent><s-tab>       <esc>i<right><c-r>=BackwardsSnippet()<cr>
inoremap <silent><c-r><tab>    <c-r>=ShowAvailableSnips()<cr>

" The default mappings for these are annoying & sometimes break snipMate.
" You can change them back if you want, I've put them here for convenience.
snoremap   <bs>      b<bs>
snoremap   <right>   <esc>a
snoremap   <left>    <esc>bi
snoremap   '         b<bs>'
snoremap   `         b<bs>`
snoremap   %         b<bs>%
snoremap   U         b<bs>U
snoremap   ^         b<bs>^
snoremap   \         b<bs>\
snoremap   <c-x>     b<bs><c-x>

" By default load snippets in snippets_dir
if empty(snippets_dir)
	finish
endif

call GetSnippets(snippets_dir, '_') " Get global snippets

au FileType * if &ft != 'help' | call GetSnippets(snippets_dir, &ft) | endif
" vim:noet:sw=4:ts=4:ft=vim
