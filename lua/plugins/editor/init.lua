return {
  { 'mg979/vim-visual-multi' },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {
      mappings = {
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\`].', register = { cr = false } },
      },
    },
    keys = {
      {
        '<leader>tp',
        function()
          vim.g.minipairs_disable = not vim.g.minipairs_disable
          if vim.g.minipairs_disable then
            print 'Disabled auto pairs'
          else
            print 'Enabled auto pairs'
          end
        end,
        desc = 'Toggle Auto Pairs',
      },
    },
  },
  {
    'muryp/muryp-md.nvim',
    config = function()
      require('muryp-md').setup()
    end,
    import = 'muryp-md/plugins',
  },
}
