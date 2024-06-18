local fmt = require 'configs.editor.formatter.fn'
local ListIgnore = require('configs.editor.formatter.opts').ignore
_G.FORMATTER_ACTIVE = true
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Auto format on save',
  group = vim.api.nvim_create_augroup('formatOnSave', { clear = true }),
  callback = function()
    local checkCurrentFileType = vim.bo.filetype
    if vim.tbl_contains(ListIgnore, checkCurrentFileType) then
      return
    end
    if _G.FORMATTER_ACTIVE then
      fmt()
    end
  end,
})
