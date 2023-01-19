"-----------------------------------"
" Folding
" - default fold settings for non-css/non-html/non-js filetypes
"-----------------------------------"
"set nofoldenable       " dont fold by default
set foldenable          " Enable folds on file open

"" Default Folding (2022.0428 - use nvim folding)
"" TODO:FIXME: maybe remove the per-filetype foldmethods if
"" ... neovim folding works better than original Vim??
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"Original Vim fold-settings
""set foldmethod=indent   " default foldmethod - indent-based
set foldnestmax=10      " deepest fold is 10 levels
set foldlevel=20        " keep this many fold-levels open by default

" may be causing slowness by matchparen plugin settings.  These lower values
" might help.
" TODO:/FIXME: remove if find another way to fix slow RUBY!!
"
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

"enable manual folding as well -- from 'Vim Tips Wiki'
augroup other_folding
  au!

  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END



"-----------------------------------"
" Default/Basic folding for nginx:
"-----------------------------------"
augroup nginx_folds
  au!

  " nginx
  au BufRead,BufNewFile /usr/local/etc/nginx/nginx.conf   setlocal filetype=nginx
  au FileType nginx setlocal foldmethod=marker
  au FileType nginx setlocal foldmarker={,}
augroup END


"-----------------------------------"
" Default/Basic folding for ruby:
"-----------------------------------"
augroup ruby_folds
  au!

  " ruby
  " -- au Filetype ruby setlocal foldmethod=syntax
  "   .. syntax-folding might make ruby editing extremely slow
  "   .. fix the SLOOOW syntax highlighting
  " TODO:/FIXME: remove below lines if find another way to fix slow RUBY!!
  "
  au FileType ruby setlocal re=1 foldmethod=manual
  au FileType ruby setlocal ttyfast
  au FileType ruby setlocal lazyredraw
  au FileType ruby setlocal norelativenumber nocursorline
augroup END


"-----------------------------------"
" Default/Basic folding for VUE filetypes:
"-----------------------------------"
augroup html_folds
  au!

  " html
  au BufNewFile,BufRead *.vue set filetype=vue
  ""au FileType vue set syntax=html
  au FileType vue set foldmethod=indent
augroup END


"-----------------------------------"
" Default/Basic folding for HTML filetypes:
"-----------------------------------"
augroup html_folds
  au!

  " html
  au BufNewFile,BufRead *.html setlocal filetype=html
  au FileType html setlocal foldmethod=indent
augroup END


"-----------------------------------"
" Default/Basic folding for the following filetypes:
"  - CSS, SCSS and LessCSS
"-----------------------------------"
augroup cxx_folds
  au!

  " css, scss, less
  au BufNewFile,BufRead *.less set filetype=less
  au BufNewFile,BufRead *.scss set filetype=scss
  au BufNewFile,BufRead *.css set filetype=css
  au Filetype less,scss,css setlocal foldmethod=marker
  au Filetype less,scss,css setlocal foldmarker={,}
  au FileType css set omnifunc=csscomplete#CompleteCSS
  au Filetype less,scss,css setlocal iskeyword+=-

  " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
  " positioned inside of them AND the following code doesn't get unfolded.
  "au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END


"-----------------------------------"
" Default/Basic folding for Javascript files
"-----------------------------------"
augroup js_folds
  au!

  " js
  au FileType javascript setlocal foldmethod=marker
  au FileType javascript setlocal foldmarker={,}


  " use VSCode to open js files on this <leader>v command
  au FileType javascript nmap <leader>v :!/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron --log 'off' % &>/dev/null &<CR>

  " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
  " positioned inside of them AND the following code doesn't get unfolded.
  "au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END


"-----------------------------------"
"ASTRO: FileType SETTINGS
"-----------------------------------"
augroup astro_ft
  au!

  " treat astro files as html
  " TODO: check for an official ASTRO plugin in the future
  au BufNewFile,BufRead *.astro setfiletype astro
  au FileType astro   set syntax=astro
  au BufNewFile,BufRead *.astro   set syntax=astro
  ""au BufNewFile,BufRead *.astro setlocal filetype=astro
  ""au FileType astro setlocal foldmethod=indent
  ""au BufNewFile,BufRead *.astro   set syntax=markdown
  ""au BufNewFile,BufRead *.astro   set omnifunc=htmlcomplete#CompleteTags

  "au BufNewFile,BufRead *.astro setlocal filetype=html
  ""au FileType html setlocal foldmethod=indent

  "au BufNewFile,BufRead *.astro   set syntax=html
  ""au BufNewFile,BufRead *.astro   set omnifunc=htmlcomplete#CompleteTags
augroup END

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

  " allow conceal of links to only display as text
  set conceallevel=2

  " hopefully fixes markdown setting indentation of 4-spaces
  " beginning around 2021.1110 - for some reason the
  " setting for thee in settings-general.vim stopped
  " working this week.
  set softtabstop=2 shiftwidth=2 expandtab

  " indent settings in case they are being overwritten elsewhere
  let g:vim_markdown_new_list_item_indent = 2

  " some other settings
  let g:vim_markdown_folding_level = 6
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_json_frontmatter = 1
  let g:vim_markdown_strikethrough = 1

  " auto-save when following a link to another file using `ge`
  let g:vim_markdown_autowrite = 1

  " prevent vim-pandoc from setting *.md files as filetype 'pandoc'
  let g:pandoc#filetypes#pandoc_markdown=0

  let g:gruvbox_contrast_dark="hard"
  let g:solarized_termcolors=256
  "au BufEnter *.md colorscheme gruvbox
  "au BufEnter *.md colorscheme tender
  "au BufEnter *.md colorscheme dracula
  "au BufEnter *.md colorscheme solarized
  au BufEnter *.md colorscheme PaperColor
  "au BufEnter *.md colorscheme iceberg

  " Use <localleader>1/2/3 to add headings.
  au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
  au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
  au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space>`zllll <ESC>
augroup END


"-----------------------------------"
"Vim: FileType SETTINGS
"-----------------------------------"
augroup ft_vim
  au!

  au BufRead,BufNewFile ~/.vimrc   setlocal filetype=vim
  au BufRead,BufNewFile ~/.vimconfig/*   setlocal filetype=vim

  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END


"-----------------------------------"
"Vue: FileType SETTINGS
"-----------------------------------"
" Vue syntax highligting
""autocmd BufNewFile,BufRead *.vue set ft=html
au BufNewFile,BufReadPost *.vue set syntax=html


"-----------------------------------"
"JSON: map json files correctly
"-----------------------------------"
" Ensure json files set to the right type automatically"
au BufRead,BufNewFile *.json set filetype=json


"-----------------------------------"
" Basic (built-in) Autocompletion
" - css, html, js
"-----------------------------------"
" source: https://www.simplified.guide/vim/enable-auto-complete
augroup default_completes
  au!

  au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  au FileType html set omnifunc=htmlcomplete#CompleteTags
  au FileType css set omnifunc=csscomplete#CompleteCSS
augroup END

