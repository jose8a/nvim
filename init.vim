" --------------------------
"  required by vim-textobj
" --------------------------
" ":runtime macros/matchit.vim

" ---------------------------
" Enable syntax highlighting & validation
" ---------------------------
syntax on

" enables filetype detection
filetype on

" required by Vundle! & enable loading the plugin
"   indent file for filetype
filetype plugin on
filetype indent on

"Switch between buffers without saving
set hidden

" --------------------------
"  speed-up your neovim start
" --------------------------
" -- DEBUG / lua require('impatient')

" This script contains all config for Plugins
" "source ~/.vimconfig/plug-bundle.vim
lua require('plugins')


" peitalin/vim-jsx-typescript {{{
""autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
""autocmd BufNewFile,BufRead *.md,*.mdx,*.markdown :set filetype=markdown
""autocmd BufNewFile,BufRead *.astro setfiletype astro

"-----------------------------------"
" General SETTINGS
"-----------------------------------"
source ~/.config/nvim/settings-general.vim

"-----------------------------------"
" Mappings and Autocommands
"-----------------------------------"
source ~/.config/nvim/mappings-general.vim

"------------------------"
"FileType SETTINGS
"------------------------"
source ~/.config/nvim/settings-filetypes.vim

"------------------------"
"FileType Plugins SETTINGS
"------------------------"
source ~/.config/nvim/settings-ftplugins.vim

"------------------------"
"Other Plugins SETTINGS
"------------------------"
source ~/.config/nvim/settings-plugins.vim

"------------------------"
" Outdated Configs (usually all disabled)
"------------------------"
" DO NOT IMPORT THESE SETTINGS IF POSSIBLE
""source ~/.vimconfig/outdated-configs.vim

"------------------------"
"More SETTINGS .. at end of setup in case they
"are getting over-written (2022.0518)
"------------------------"
lua require('settings')

"------------------------"
" Acknowledgements
"------------------------"
" SPF13 Vim Distro: https://vim.spf13.com/
" Steve Losh's VIMRC: http://bitbucket.org/sjl/dotfiles/src/tip/vim/
" Thoughtbot's dotfiles
"

" Disable lang-provider warnings for some unused langs"
" disable the Perl provider for neovim
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0


" disable live-substitution due to super-slow neovim, or even
" hangup of neovim in larger files. Disable it for all.
set inccommand=
