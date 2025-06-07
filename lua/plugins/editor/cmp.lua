return {
  'hrsh7th/nvim-cmp',
  version = false, -- last release is way too old
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'tamago324/cmp-zsh',
    'Shougo/deol.nvim',
    --   "jcha0713/cmp-tw2css",
    'dcampos/cmp-emmet-vim',
    'mattn/emmet-vim',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    -- 'dcampos/cmp-snippy',
    {
      'L3MON4D3/LuaSnip',
      -- follow latest release.
      version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = 'make install_jsregexp',
      config = function()
        -- require 'muryp-completion.configs.snippets'
      end,
      opts = {
        history = true,
        delete_check_events = 'TextChanged',
      },
      dependencies = {
        'onsails/lspkind.nvim',
        {
          'muryp/nvim-muryp-snippet-collection',
          -- 'rafamadriz/friendly-snippets',
          config = function()
            require 'configs.editor.cmp.snippets'
          end,
        },
      },
    },
    -- {
    --   'Jezda1337/nvim-html-css',
    --   dependencies = { 'hrsh7th/nvim-cmp', 'nvim-treesitter/nvim-treesitter' }, -- Use this if you're using nvim-cmp
    --   -- dependencies = { "saghen/blink.cmp", "nvim-treesitter/nvim-treesitter" }, -- Use this if you're using blink.cmp
    --   opts = {
    --     enable_on = { -- Example file types
    --       'html',
    --       'htmldjango',
    --       'tsx',
    --       'jsx',
    --       'erb',
    --       'svelte',
    --       'vue',
    --       'blade',
    --       'php',
    --       'templ',
    --       'astro',
    --       'ts',
    --       'js',
    --       'typescript',
    --     },
    --     handlers = {
    --       definition = {
    --         bind = 'gd',
    --       },
    --       hover = {
    --         bind = 'K',
    --         wrap = true,
    --         border = 'none',
    --         position = 'cursor',
    --       },
    --     },
    --     documentation = {
    --       auto_show = true,
    --     },
    --     style_sheets = {
    --       '/index.css', -- `./` refers to the current working directory.
    --     },
    --   },
    -- },
  },
}