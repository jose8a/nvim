"-----------------------------------"
" Ack mappings
"-----------------------------------"
nnoremap <leader>ak :Ack!<space>

"-----------------------------------"
" Fugitive mappings
"-----------------------------------"
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup end

augroup gitsigns
  au!

  autocmd FileType * highlight GitSignsAdd guibg=NONE
augroup end

"gitHub
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>


"-----------------------------------"
" ALE Linter configs
" -- DISABLED: 2022.0506
"-----------------------------------"
" --- let g:ale_linters = {
" --- \   'javascript': ['eslint'],
" --- \}
" ---
" --- let g:ale_completion_enabled = 1
" ---
" --- " keep the sign gutter open at all times
" --- let g:ale_sign_column_always = 1
" ---
" --- " Use these options to specify what text should be used for ALE signs:
" --- let g:ale_sign_error = 'xx'
" --- let g:ale_sign_warning = '--'
" ---

"-----------------------------------"
" pymode configs
" -- DISABLED: 2022.0506
"-----------------------------------"
" --- " Turn on python code-linting, and
" --- " check code on every save - if modified
" --- let g:pymode_lint = 1
" --- let g:pymode_lint_on_write = 1
" ---

"-----------------------------------"
" neoclide/coc.nvim LSP/Intellisense configs
" -- DISABLED: 2022.0506
"-----------------------------------"
" --- let g:coc_global_extensions = [
" ---   \ 'coc-tsserver',
" ---   \ 'coc-json',
" ---   \ 'coc-vetur',
" ---   \ 'coc-html',
" ---   \ 'coc-lit-html',
" ---   \ 'coc-css',
" ---   \ 'coc-cssmodules',
" ---   \ 'coc-svg',
" ---   \ 'coc-snippets'
" ---   \ ]
" ---
" --- " Conditional plugin install of neoclide/coc-eslint and
" --- "   neoclide/coc-prettier based on whether or not those tools are
" --- "   installed in the local node_modules folder
" --- if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
" ---   let g:coc_global_extensions += ['coc-prettier']
" --- endif
" ---
" --- if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
" ---   let g:coc_global_extensions += ['coc-eslint']
" --- endif


"-----------------------------------"
" snippets mappings
" -- DISABLED: ??? (long before 2022.0506)
"-----------------------------------"
" Use <tab> as in VSCode for:
"   - trigger completion,
"   - completion confirm,
"   - snippet expand, and
"   - jump

" before mapping <tab> as completion for coc, remove
" these mapping triggers for Ultisnips and SimpleSnippets
" which also utilize <tab>, etc and may conflict
"" --- let g:UltiSnipsExpandTrigger = "<nop>"
"" --- let g:UltiSnipsJumpForwardTrigger="<nop>"
"" --- let g:UltiSnipsJumpBackwardTrigger="<nop>"
"" --- let g:SimpleSnippetsExpandOrJumpTrigger = "<nop>"
"" --- let g:SimpleSnippetsJumpBackwardTrigger = "<nop>"
"" --- let g:SimpleSnippetsJumpToLastTrigger = "<nop>"


"-----------------------------------"
" neoclide/coc.nvim mappings (move to other file?)
" -- DISABLED: 2022.0506
"-----------------------------------"
" --- inoremap <silent><expr> <TAB>
" ---       \ pumvisible() ? coc#_select_confirm() :
" ---       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
" ---       \ <SID>check_back_space() ? "\<TAB>" :
" ---       \ coc#refresh()
" ---
" --- function! s:check_back_space() abort
" ---   let col = col('.') - 1
" ---   return !col || getline('.')[col - 1]  =~# '\s'
" --- endfunction
" ---
" --- let g:coc_snippet_next = '<tab>'
" ---
" --- " -----
" --- " NOTE: mapping from neoclide/coc.nvim unused (what it do??)
" --- " --- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" --- " -----
" ---
" --- " Use <c-space> to trigger completion.
" --- inoremap <silent><expr> <c-space> coc#refresh()
" ---
" --- " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" --- " position. Coc only does snippet and additional edit on confirm.
" --- " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" --- if exists('*complete_info')
" ---   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" --- else
" ---   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" --- endif
" ---
" --- " Use `[g` and `]g` to navigate diagnostics
" --- " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" --- nmap <silent> [g <Plug>(coc-diagnostic-prev)
" --- nmap <silent> ]g <Plug>(coc-diagnostic-next)
" ---
" --- " GoTo code navigation.
" --- nmap <silent> gd <Plug>(coc-definition)
" --- nmap <silent> gy <Plug>(coc-type-definition)
" --- nmap <silent> gi <Plug>(coc-implementation)
" --- nmap <silent> gr <Plug>(coc-references)
" ---
" --- " Use K to show documentation in preview window.
" --- nnoremap <silent> K :call <SID>show_documentation()<CR>
" ---
" --- function! s:show_documentation()
" ---   if (index(['vim','help'], &filetype) >= 0)
" ---     execute 'h '.expand('<cword>')
" ---   else
" ---     call CocAction('doHover')
" ---   endif
" --- endfunction


"" -----------
"" coc-snippts mappings
" -- DISABLED: 2022.0506
"" -----------
" --- " Use <C-l> for trigger snippet expand.
" --- imap <C-l> <Plug>(coc-snippets-expand)
" ---
" --- " Use <C-j> for select text for visual placeholder of snippet.
" --- vmap <C-j> <Plug>(coc-snippets-select)
" ---
" --- " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" --- let g:coc_snippet_next = '<c-j>'
" ---
" --- " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" --- let g:coc_snippet_prev = '<c-k>'
" ---
" --- " Use <C-j> for both expand and jump (make expand higher priority.)
" --- imap <C-j> <Plug>(coc-snippets-expand-jump)


"-----------------------------------"
" vim-css-color mappings
" -- DISABLED: 2022.0506
"-----------------------------------"
" --- let g:cssColorVimDoNotMessMyUpdatetime = 1


"-----------------------------------"
" 'Fenced' markdown syntax highlighting
"   }--> ensure syntax highlighting for 'fenced' code in Markdown files
"
"   NOT NEEDED IF TPOPE's vim-markdown plugin is installed.  All recent Vim
"   versions now include this plugin
"-----------------------------------"
let g:vim_markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 4


