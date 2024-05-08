return {
  {
    'nvim-telescope/telescope.nvim',
    Lazy = true,
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-symbols.nvim',
    },
  },
  {
    'nvim-pack/nvim-spectre', -- multi file replace text
    build = false,
    cmd = 'Spectre',
    opts = { open_cmd = 'noswapfile vnew' },
    -- stylua: ignore
    keys = {
      { "<leader>Sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
}