require'nvim-treesitter.configs'.setup {
  -- Install the servers first
  -- See the ./servers.md file for details

  ensure_installed = {
    "javascript",
    "typescript",
    "json",
    "jsdoc",
    "yaml",
    "vue",
    "astro",
    "svelte",
    "css",
    "scss",
    "html",
--     "markdown",   -- supports CommonMark,
                  -- not GFM - experimental
    "graphql",
    "python",
    "ruby",
    "dockerfile",
    "bash",
    "lua",
    "comment", -- for TODO/FIXME/etc
    "regex",
    "vim"
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "haskell" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- list of language that will be disabled
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    -- disable = { "jsx", "cpp" },

    -- Also highlight non-bracket delimiters like
    -- .. html tags, boolean or table: lang -> boolean
    extended_mode = true, --

    -- Do not enable for files with more than n lines, int
    max_file_lines = nil,
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  context_commentstring = {
    enable = true
  },

  indent = {
    -- dont enable this, messes up python indentation
    enable = false,
    disable = {},
  },
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
