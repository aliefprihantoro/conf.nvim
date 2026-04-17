return {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  opts = true,
  config = function()
    require 'configs.editor.treesitter'
  end,
  dependencies = {
    -- {
    --   'windwp/nvim-ts-autotag',
    --   event = 'InsertEnter',
    --   opts = {
    --     -- Di versi baru, cukup begini saja jika ingin default
    --     opts = {
    --       enable_close = true,
    --       enable_rename = true,
    --       enable_close_on_slash = true,
    --     },
    --   },
    -- },
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        require('ts_context_commentstring').setup {
          enable_autocmd = false,
        }
      end,
      dependencies = {
        {
          'numToStr/Comment.nvim',
          opts = {},
          config = function()
            require('Comment').setup {
              pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
          end,
        },
      },
    },
  },
}
