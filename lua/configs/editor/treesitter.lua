local status, ts = pcall(require, 'nvim-treesitter')
if not status then
  return
end
ts.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath 'data' .. '/site',
}
local install = {
  'tsx',
  'toml',
  'php',
  'phpdoc',
  'yaml',
  'css',
  'html',
  'lua',
  'javascript',
  'jsdoc',
  'json',
  'typescript',
  'astro',
  'bash',
  'rust',
  'python',
  'markdown',
  'markdown_inline',
  'go',
  'gomod',
  'regex',
  'http',
  'gitcommit',
  'gitignore',
  'git_config',
  'git_rebase',
  'gitattributes',
  'prisma',
  'sql',
}
ts.install(install)
-- hilight
local ft = { 'jsonc', unpack(install) }
vim.api.nvim_create_autocmd('FileType', {
  pattern = ft,
  callback = function()
    vim.treesitter.start()
  end,
})
--FOLD
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
-- INDENT
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- NOTE: OLD SETUP
-- ts.setup {
--   highlight = {
--     enable = true,
--     skip_missing_parsers = true,
--     disable = {},
--   },
--   indent = {
--     enable = true,
--     disable = {},
--   },
--   auto_install = true,
--   modules = {},
--   sync_install = true,
--   ignore_install = {},
--   ensure_installed = {
--     'tsx',
--     'toml',
--     'php',
--     'phpdoc',
--     'yaml',
--     'css',
--     'html',
--     'lua',
--     'javascript',
--     'jsdoc',
--     'json',
--     'typescript',
--     'astro',
--     'bash',
--     'rust',
--     'python',
--     'markdown',
--     'markdown_inline',
--     'go',
--     'gomod',
--     'regex',
--     'http',
--     'gitcommit',
--     'gitignore',
--     'git_config',
--     'git_rebase',
--     'gitattributes',
--     'prisma',
--     'sql',
--   },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = 'gv',
--     },
--   },
-- }

-- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx', 'typescript' }
-- vim.filetype.add {
--   extension = {
--     mdx = 'markdown.mdx',
--   },
-- }
-- vim.treesitter.language.register('markdown', 'mdx')

-- parser_config.blade = {
--   install_info = {
--     url = 'https://github.com/EmranMR/tree-sitter-blade',
--     files = { 'src/parser.c' },
--     branch = 'main',
--   },
--   filetype = 'blade',
-- }
vim.filetype.add {
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
}
