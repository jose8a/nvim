"------------------------"
"" Modify the default leader-key for Emmet
"------------------------"
let g:user_emmet_leader_key='<C-E>'

"------------------------"
" Vim-task mappings
"------------------------"
inoremap <silent> <buffer> <leader>tk <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <leader>tk :call Toggle_task_status()<CR>


"------------------------"
" Gutentags settings
"------------------------"
"Hiding tags files
let g:gutentags_cache_dir = '~/.gutentags'
