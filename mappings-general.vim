"-----------------------------------"
" Mappings and Autocommands
"-----------------------------------"
" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Map escape key to jj -- much faster
imap jj <esc>
au FocusLost * :wa              " Saves file when Vim window loses focus

" Mapping for commenting out lines in javascript or python
:autocmd FileType javascript nnoremap <buffer> <leader>cc I//<esc>
:autocmd FileType python     nnoremap <buffer> <leader>cc I#<esc>

" Automatically strip trailing spaces on Save
autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------"
" QUICKLY FORCE filetypes for some files
"-----------------------------------"
nnoremap <leader>sj :setf javascript<cr>
nnoremap <leader>sh :setf html<cr>
nnoremap <leader>sm :setf markdown<cr>
nnoremap <leader>sv :setf vue<cr>


"-----------------------------------"
" NATIVE VIM COMPLETION
"-----------------------------------"
   " whole lines
imap <tab>yl <C-x><C-l>
imap <leader>xl <C-x><C-l>
		" omni-completion
imap <tab>yo <C-x><C-o>
imap <leader>xo <C-x><C-o>
		" tags
imap <tab>y] <C-x><C-]>
imap <leader>x] <C-x><C-]>
		" file names
imap <tab>yf <C-x><C-f>
imap <leader>xf <C-x><C-f>
		" defs or macros
imap <tab>yd <C-x><C-d>
imap <leader>xd <C-x><C-d>
		" vim command-line
imap <tab>yv <C-x><C-v>
imap <leader>xv <C-x><C-v>
    " keywords curr file
imap <tab>yn <C-x><C-n>
imap <leader>xn <C-x><C-n>
		" current and included files
imap <tab>yi <C-x><C-i>
imap <leader>xi <C-x><C-i>
    " dictionary
imap <tab>yk <C-x><C-k>
imap <leader>xk <C-x><C-k>
		" thesaurus
imap <tab>yt <C-x><C-t>
imap <leader>xt <C-x><C-t>
		" user-defined completion
imap <tab>yu <C-x><C-u>
imap <leader>xu <C-x><C-u>
		" spelling suggestions
imap <tab>ys <C-x><C-s>
imap <leader>xs <C-x><C-s>

"-----------------------------------"
" EASIER FOLDS
"-----------------------------------"
" other fold settings in the file ./settings-general.vim
" only the new mappings go in this file
"
        "CLOSE all folds in current buffer
nnoremap <leader>fa :set foldlevel=0<cr>
        "OPEN all folds in current buffer
nnoremap <leader>fA :set foldlevel=20<cr>

nnoremap <leader>fd zd| "delete fold at the cursor - manual/marker only
nnoremap <leader>fD zD| "Delete folds at cursor recursively - manual/marker only
nnoremap <leader>fE zE| "eliminate all folds in window
nnoremap <leader>fo zo| "open fold under cursor
nnoremap <leader>fO zO| "Open all folds under cursor recursively
nnoremap <leader>fc zc| "close one fold under cursor
nnoremap <leader>fC zC| "Close all folds under cursor recursively
nnoremap <leader>ft za| "toggle one fold under cursor
nnoremap <leader>fT zA| "Toggle folds recursively under the cursor


"-----------------------------------"
" Quick editing of a few settings files
"-----------------------------------"
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>ea :vsplit ~/.alias<cr>
nnoremap <leader>eb :vsplit ~/.alias<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>en :vsplit /usr/local/etc/nginx/nginx.conf<cr>


"-----------------------------------"
" Basic Completion Remaps
"-----------------------------------"
" sources: https://www.cs.oberlin.edu/~kuperman/help/vim/completion.html
" sources: https://stackoverflow.com/questions/2269005/how-can-i-change-the-keybinding-used-to-autocomplete-in-vim

" use <SPACE> to auto-complete
"inoremap <Nul> <C-n>
inoremap <leader>cn <C-n>
inoremap <leader>cp <C-p>
inoremap <leader>cl <C-x><C-l>

" dictionary completion
set dictionary=/usr/share/dict/words
inoremap <leader>cd <C-x><C-k>


"-----------------------------------"
" Save View
"-----------------------------------"
" source: * [Make views automatic](http://vim.wikia.com/wiki/Make_views_automatic)
"
" save folds when closing file for continuing on next open of same file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview


"-----------------------------------"
" EASIER SPLITS & PANE NAVIGATION
"-----------------------------------"
" easier window navigation
nmap wh <C-W>h
nmap wj <C-W>j
nmap wk <C-W>k
nmap wl <C-W>l

" MORE NATURAL SPLIT OPENING -- Open new split panes to
" the right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright


" Easier split resizing
:command Widen :vertical resize
:command Grow  :resize

"------------------------"
"Copy/Paste SETTINGS
"------------------------"
""" copy to clipboard
nmap cc "+
"" paste from clipboard
nmap cp "+p

"-----------------------------------"
" Quick open of current document in the browser
"-----------------------------------"
:set timeoutlen=1500
nmap <leader>x :!/Applications/Firefox.app/Contents/MacOS/firefox %<CR>
nmap <leader>b :!/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser %<CR>

"-----------------------------------"
" Vim Vertical Alignment:
"   - https://vimtricks.com/p/vertical-alignment/
"   - http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"-----------------------------------"
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/\\\@<!|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


"-----------------------------------"
" Finito
"-----------------------------------"

