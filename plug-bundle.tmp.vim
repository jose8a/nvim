
" Plugins {
        Plug 'MarcWeber/vim-addon-mw-utils'   "vim file caching
        Plug 'tomtom/tlib_vim'                "utility functions - remove only if sure that
                                              "other plugins don't need it

        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Plug 'mileszs/ack.vim'
        elseif executable('ack')
            Plug 'mileszs/ack.vim'
        elseif executable('ag')
            Plug 'mileszs/ack.vim'
            let g:ackprg = 'ag --nogroup --nocolor --column'
        endif


    " General
        if count(g:spf13_bundle_groups, 'general')
            " IDE-like plugins
            Plug 'wesleyche/SrcExpl'
            Plug 'tpope/vim-sensible'
            Plug 'Shougo/denite.nvim'
            Plug 'justinmk/vim-sneak'
            Plug 'tpope/vim-eunuch'
            Plug 'tpope/vim-repeat'
            Plug 'mbbill/undotree'

            Plug 'myusuf3/numbers.vim'
            Plug 'vim-scripts/TaskList.vim'
            Plug 'samsonw/vim-task'
            Plug 'godlygeek/tabular'
            Plug 'michaeljsmith/vim-indent-object'
            Plug 'tpope/vim-surround'
            Plug 'spf13/vim-autoclose'
              "available colorschemes below
            Plug 'zeis/vim-kolor'                         " this is my default for all but markdown
            Plug 'morhetz/gruvbox'
            Plug 'dracula/vim'
            Plug 'jacoborus/tender.vim'
            Plug 'altercation/vim-colors-solarized'
            Plug 'NLKNguyen/papercolor-theme'
            Plug 'cocopon/iceberg.vim'
              ""
            Plug 'itchyny/lightline.vim'
            Plug 'godlygeek/csapprox'             " make GUI colors work seamlessly in TERM
              ""
            Plug 'tomtom/ttags_vim'
            "Plug 'ludovicchabant/vim-gutentags'
            Plug 'romainl/vim-qf'
            Plug 'Konfekt/FastFold'
        endif

    " General Programming
        if count(g:spf13_bundle_groups, 'programming')
            Plug 'sheerun/vim-polyglot'
            Plug 'w0rp/ale'
            " Use release branch (recommend)
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
            Plug 'metakirby5/codi.vim'  " scratchpad/repl in vim buffer
            Plug 'tpope/vim-fugitive'
            Plug 'gregsexton/gitv'
            Plug 'airblade/vim-gitgutter'
            Plug 'tpope/vim-dispatch'
        endif

    " Markdown
        if count(g:spf13_bundle_groups, 'misc')
            Plug 'plasticboy/vim-markdown'
            Plug 'vim-pandoc/vim-pandoc'
            Plug 'vim-voom/VOoM'
            Plug 'nelstrom/vim-markdown-folding'
        endif

    " Snippets & AutoComplete
        if count(g:spf13_bundle_groups, 'completion')
            " Ultisnips is the best snippet solution as of today (2018)
            " Track the engine (ultisnips).
            " --- Plug 'SirVer/ultisnips'
            " --- Plug 'ajh17/VimCompletesMe'

            " Snippets are separated from the engine. Add this if you want them:
            " --- Plug 'andreyorst/SimpleSnippets.vim'

            "" Started using coc.nvim and the coc-snippets extension as of 2020.0708.
            ""  - 'coc-snippets' becomes the snippet-engine, and
            ""  - will now be using the 'honza/vim-snippets' bundle for the actual snippets.
            Plug 'honza/vim-snippets'
        endif

    " Python
        if count(g:spf13_bundle_groups, 'python')
            " Python-mode - python's all-in-one plugin
            Plug 'python-mode/python-mode', { 'branch': 'develop' }
            Plug 'alfredodeza/pytest'
        endif

    " Javascript
        if count(g:spf13_bundle_groups, 'javascript')
            " Use vim-polyglot instead - unless it turns out to be inferior
            "Plug 'jelera/vim-javascript-syntax'
            "Plug 'vim-scripts/JavaScript-Indent'
            Plug 'moll/vim-node'
            Plug 'mmalecki/vim-node.js'
            Plug 'othree/javascript-libraries-syntax.vim'
        endif

    " HTML/CSS
        if count(g:spf13_bundle_groups, 'html')
            Plug 'mattn/emmet-vim'
              " if html-closing is broken after removal, reinstall next plugin
            "Plug 'vim-scripts/HTML-AutoCloseTag'
            "Plug 'hail2u/vim-css3-syntax'
        endif

    " Vimux
        if count(g:spf13_bundle_groups, 'vimux')
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'benmills/vimux'
            Plug 'tpope/vim-tbone'
            "Plug 'jpalardy/vim-slime'
            "let g:slime_target = "tmux"
        endif

      "-----------------------------------"
      " UNUSED and OBSOLETE PLUGINS
      "   - the following file contains unused plugins
      "   - move groups of plugins from that file into
      "       this file as needed
      "-----------------------------------"
      "source ~/.vimconfig/unused-plugins.vim

    endif
" }

" --------------------------
" All Plugins must be added before this line:
" --------------------------
" ------- call vundle#end()
call plug#end()
