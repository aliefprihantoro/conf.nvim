local lsp = require 'lspconfig'
lsp.astro.setup {
  init_options = {
    typescript = {
      tsdk = vim.fs.normalize '$HOME/.pnpm/global/5/node_modules/typescript/lib/',
    },
  },
}