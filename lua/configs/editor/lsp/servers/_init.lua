local enable = vim.lsp.enable
-- lang, core
enable 'cssls'
-- enable 'tailwindcss'
enable 'gopls'
-- enable('phpactor')
-- enable('svelte')
-- enable('cssmodules_ls')
enable 'bashls'
enable 'pyright'
enable 'taplo'
enable 'prismals'
--- lint
enable 'stylelint_lsp'
enable 'eslint'

-- Mengaktifkan clangd secara global untuk filetype cpp/c
vim.lsp.enable('clangd')

-- Opsional: Tambahkan keybindings standar biar bisa navigasi
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})