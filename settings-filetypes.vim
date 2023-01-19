"-----------------------------------"
" Folding
" - default fold settings for non-css/non-html/non-js filetypes
"-----------------------------------"
"set nofoldenable       " dont fold by default
""set foldenable          " Enable folds on file open
""
"""Original Vim fold-settings
""set foldmethod=indent   " default foldmethod - indent-based
""set foldnestmax=10      " deepest fold is 10 levels
""set foldlevel=20        " keep this many fold-levels open by default

"=== "set foldlevel=20
"=== "set foldmethod=expr
"=== "set foldexpr=nvim_treesitter#foldexpr()

"-----------------------------------"
"Markdown: FileType SETTINGS
"-----------------------------------"
augroup ft_markdown
  au!

  " set the appropriate filetype based on file extension"
  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *.m*down set filetype=markdown

  " disable spellcheck for markdown files
  au BufRead,BufNewFile *.md setlocal nospell

  " open these files with Brave Browser
  nmap <leader>o :!/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser %<CR>

  " colorscheme for Markdown files-only"
  " au BufEnter *.md colorscheme tokyodark
  au BufEnter *.md colorscheme PaperColor
augroup END


