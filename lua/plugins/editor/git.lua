return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    'muryp/muryp-git.nvim',
    keys = '<leader>gg',
    config = function()
      require 'muryp-git'
    end,
  },
  {
    'pwntester/octo.nvim',
    cmd = 'Octo',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup {
        suppress_missing_scope = {
          projects_v2 = true, -- WARNING: don't remove, this for fix bug
        },
      }
    end,
  },
  {
    'paopaol/telescope-git-diffs.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
  },
  'nvim-telescope/telescope.nvim',
  'folke/which-key.nvim',
  {
    'muryp/muryp-gh.nvim',
    config = function()
      require('muryp-gh').setup()
    end,
  },
  'nvim-lua/plenary.nvim',
  {
    'sindrets/diffview.nvim',
    keys = '<leader>ggd',
  },
  { 'akinsho/git-conflict.nvim', config = true, keys = '<leader>ggC' },
}
