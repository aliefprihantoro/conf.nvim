---NOTE:all lsp configs on folder `after/plugin/config/lsp`
return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require 'lspconfig'
      local lsp_defaults = lsp.util.default_config

      --- settings
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true, -- folding
      }
      lsp_defaults.capabilities =
        vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())
      _G.IMPORT_FOLDER { include = 'configs/editor/lsp' }
    end,
  },
  {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = { -- totally optional
      'hrsh7th/nvim-cmp', -- if using nvim-cmp
    },
    ft = { 'blade', 'php' }, -- optional, improves startup time
    opts = {
      close_tag_on_complete = true, -- default: true
    },
  },
}
