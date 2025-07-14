return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    mason_lspconfig.setup {
      ensure_installed = { 'lua_ls', 'csharp_ls' }, -- Change this line
      handlers = {
        mason_lspconfig.default_setup,
      },
    }
  end,
}
