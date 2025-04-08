--TODO: lsp/notify
-- TODO: add file type big file where not use lsp, treesitter
-- TODO: merge conf for filetype
-- TODO: try prettier use server like express js
--ntainer
require 'configs.basic'
require 'utils.importFolder'
_G.IMPORT_FOLDER { include = 'utils', exlude = { 'importFolder' } }

vim.g.mapleader = ' '
require 'configs.lazy'
require 'autoCmd'
require 'cmd'

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '.env*',
  command = 'set filetype=dotenv',
})