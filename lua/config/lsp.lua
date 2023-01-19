local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=false }
  local opts2 = { focusable = false,
           close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
           border = 'rounded',
           source = 'always',  -- show source in diagnostic popup window
           prefix = ' '}

-- DEBUG /  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- DEBUG /  buf_set_keymap('n', 'gd', '<Cmd>tab split | lua vim.lsp.buf.definition()<CR>', opts)
-- DEBUG /  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- DEBUG /  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- DEBUG /  buf_set_keymap('n', '<leader>t', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- DEBUG /  buf_set_keymap('n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- DEBUG /  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- DEBUG /  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, {{opts2}, scope="line", border="rounded"})<CR>', opts)
-- DEBUG /  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>', opts)
-- DEBUG /  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>', opts)
-- DEBUG /  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist({open = true})<CR>", opts)
-- DEBUG /
-- DEBUG /
-- DEBUG /  -- LSPSaga: Jump LSP diagnostics
-- DEBUG /  --       Vim commands to move through diagnostics.
-- DEBUG /  buf_set_keymap("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
-- DEBUG /  buf_set_keymap("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
-- DEBUG /  buf_set_keymap("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
-- DEBUG /
-- DEBUG /  -- Rename symbol
-- DEBUG /  buf_set_keymap("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
-- DEBUG /
-- DEBUG /  -- Find references
-- DEBUG /  buf_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
-- DEBUG /
-- DEBUG /  -- Doc popup scrolling
-- DEBUG /  buf_set_keymap("n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
-- DEBUG /  buf_set_keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
-- DEBUG /  buf_set_keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
-- DEBUG /
-- DEBUG /  -- codeaction
-- DEBUG /  buf_set_keymap("n", "gx", "<cmd>Lspsaga code_action<cr>", opts)
-- DEBUG /  buf_set_keymap("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)

  -- Floating terminal
  -- NOTE: Use `vim.cmd` since `buf_set_keymap` is not working with `tnoremap...`
  vim.cmd [[
  nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
  tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
  ]]

  -- Set some keybinds conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
  if client.server_capabilities.document_formatting then
      buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- if client.resolved_capabilities.document_range_formatting then
  if client.server_capabilities.document_range_formatting then
      buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end


-- DEBUG / -- NOTE: Don't use more than 1 servers otherwise nvim is unstable
-- DEBUG / local capabilities = vim.lsp.protocol.make_client_capabilities()
-- DEBUG / -- DEPRECATED:
-- DEBUG / -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- DEBUG / capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- DEBUG / capabilities.textDocument.completion.completionItem.snippetSupport = true
-- DEBUG /
-- DEBUG / -- use Graphql
-- DEBUG / nvim_lsp.graphql.setup {
-- DEBUG /   on_attach = on_attach,
-- DEBUG /   filetypes = { "graphql" }
-- DEBUG / }

-- DEBUG / -- Use a loop to conveniently call 'setup' on multiple servers and
-- DEBUG / -- map buffer local keybindings when the language server attaches
-- DEBUG / local servers = { 'astro', 'emmet_ls', 'dockerls', 'tsserver', 'volar', 'svelte', 'awk_ls', 'bashls' }
-- DEBUG / for _, lsp in pairs(servers) do
-- DEBUG /   nvim_lsp[lsp].setup {
-- DEBUG /     on_attach = on_attach,
-- DEBUG /     capabilities = capabilities,
-- DEBUG /     flags = {}
-- DEBUG /   }
-- DEBUG / end

require('lspconfig').tsserver.setup {}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.astro.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.awk_ls.setup{}
-- DEBUG / require'lspconfig'.dockerls.setup{}


-- FIXME/TODO: figure out why volar doesn't attach to buffer (via :LspInfo)
-- require'lspconfig'.volar.setup{}
--   filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
-- }


-- DEBUG / -- Use pylsp
-- DEBUG / nvim_lsp.pylsp.setup({
-- DEBUG /   on_attach = on_attach,
-- DEBUG /   settings = {
-- DEBUG /     pylsp = {
-- DEBUG /       plugins = {
-- DEBUG /         pylint = { enabled = true, executable = "pylint" },
-- DEBUG /         pyflakes = { enabled = true },
-- DEBUG /         pycodestyle = { enabled = false },
-- DEBUG /         jedi_completion = { fuzzy = true },
-- DEBUG /         pyls_isort = { enabled = true },
-- DEBUG /         pylsp_mypy = { enabled = true },
-- DEBUG /       },
-- DEBUG /   }, },
-- DEBUG /   flags = {
-- DEBUG /     debounce_text_changes = 200,
-- DEBUG /   },
-- DEBUG /   capabilities = capabilities,
-- DEBUG / })

-- Markdown LSP server
-- require'lspconfig'.marksman.setup{}

-- global config for diagnostic
vim.diagnostic.config({
  underline = false,
  virtual_text = true,
  signs = true,
  severity_sort = true,
})

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
