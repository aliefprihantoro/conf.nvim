local fmt = require 'configs.editor.formatter.fn'
local fmtList = require('configs.editor.formatter.opts').formatter_list
require 'configs.editor.formatter.autoCmd'
return {
  'stevearc/conform.nvim',
  lazy = true,
  cmd = 'ConformInfo',
  keys = {
    {
      '<c-f>',
      fmt,
      mode = { 'n', 'v' },
      desc = 'Format Injected Langs',
    },
  },
  opts = function()
    ---@class ConformOpts
    local opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      format = {
        timeout_ms = 99999,
        async = false,
        quiet = true,
        lsp_fallback = true, -- not recommended to change
      },
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = fmtList,
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2', '-ci' },
        },

        prettierd = {
          cwd = nil,
        },
        astro = {
          command = 'astrofm',
          args = { '$FILENAME' },
        },
      },
    }
    return opts
  end,
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}