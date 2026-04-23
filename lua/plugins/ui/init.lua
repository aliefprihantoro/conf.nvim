return {
  {
    'folke/noice.nvim',
    event = 'CmdlineEnter',
    ---@type NoiceConfig
    opts = {

      notify = {
        enabled = true,
        view = 'notify',
      },
      lsp = {
        hover = {
          silent = true,
        },
        progress = {
          enabled = false,
        },
      },
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = 'cmp', -- backend to use to show regular cmdline completions
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        config = function()
          require 'configs.ui.notify'
        end,
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'configs.ui.lualine'
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
      'TheGLander/indent-rainbowline.nvim',
    },
    config = function()
      require 'configs.ui.indentBlank'
    end,
  },
  {
    'folke/which-key.nvim',
    ---TODO: UPGRADE TO VERSION 2
    version = 'v2',
    config = function()
      require 'configs.ui.wichKey'
    end,
  },
  -- dashboard
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    enabled = true,
    init = false,
    config = function()
      require 'configs.ui.dashboard'
    end,
  },
  -- fold like vscode
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require 'configs.ui.ufo'
    end,
  },
  -- for winbar icon
  {
    'SmiteshP/nvim-navic',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'BufRead',
    config = function()
      require 'configs.ui.breadcrumb'
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- This is your opts table
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {
              -- even more opts
            },

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      }
      require('telescope').load_extension 'ui-select'
    end,
  },
}