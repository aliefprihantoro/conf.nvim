local formatting = require 'configs.editor.cmp.icons'
local mapping = require 'configs.editor.cmp.maps'
local cmp = require 'cmp'
local window = require 'configs.editor.cmp.window'
local sources = require 'configs.editor.cmp.sources'
local defaults = require 'cmp.config.default'()

-- command
vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  experimental = {
    ghost_text = {
      hl_group = 'CmpGhostText',
    },
  },
  sorting = defaults.sorting,
  view = {
    window = window,
    experimental = {
      ghost_text = true,
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
    end,
  },
  mapping = mapping,
  sources = cmp.config.sources(sources.sc1, sources.sc2),
  window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = formatting,
}

require 'configs.editor.cmp.cmdLine'
require("completion.cpp")