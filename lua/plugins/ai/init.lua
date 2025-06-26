-- {
--   'kiddos/gemini.nvim',
--   config = function()
--     require('gemini').setup {
--       completion = {
--         enabled = false,
--       },
--     }
--   end,
-- },
-- return {
--   'Exafunction/windsurf.nvim',
--   cmd = 'CodeiumToggle',
--   lazy = true,
--   init = function()
--     vim.g.codeium_disable_bindings = 1
--     vim.g.codeium_enabled = false
--   end,
--   config = function()
--     vim.api.nvim_create_user_command('CodeiumChat', function()
--       vim.fn['codeium#Chat']()
--     end, {})
--     local key = vim.keymap.set
--     local opts = { expr = true, silent = true }
--     key('i', '<C-g>', function()
--       return vim.fn['codeium#Accept']()
--     end, opts)
--     key('i', '<c-p>', function()
--       return vim.fn['codeium#CycleCompletions'](1)
--     end, opts)
--     key('i', '<c-n>', function()
--       return vim.fn['codeium#CycleCompletions'](-1)
--     end, opts)
--     key('i', '<c-x>', function()
--       return vim.fn['codeium#Clear']()
--     end, opts)
--   end,
-- }
return {
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup {
      bin_path = '/data/data/com.termux/files/home/.codeium/bin',
      -- Optionally disable cmp source if using virtual text only
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,

        -- These are the defaults

        -- Set to true if you never want completions to be shown automatically.
        manual = false,
        -- A mapping of filetype to true or false, to enable virtual text.
        filetypes = {},
        -- Whether to enable virtual text of not for filetypes not specifically listed above.
        default_filetype_enabled = true,
        -- How long to wait (in ms) before requesting completions after typing stops.
        idle_delay = 75,
        -- Priority of the virtual text. This usually ensures that the completions appear on top of
        -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
        -- desired.
        virtual_text_priority = 65535,
        -- Set to false to disable all key bindings for managing completions.
        map_keys = true,
        -- The key to press when hitting the accept keybinding but no completion is showing.
        -- Defaults to \t normally or <c-n> when a popup is showing.
        accept_fallback = nil,
        -- Key bindings for managing completions in virtual text mode.
        key_bindings = {
          -- Accept the current completion.
          accept = '<C-g>',
          -- Accept the next word.
          accept_word = '<C-e>',
          -- Accept the next line.
          accept_line = '<C-r>',
          -- Clear the virtual text.
          clear = '<C-x>',
          -- Cycle to the next completion.
          next = '<C-n>',
          -- Cycle to the previous completion.
          prev = '<C-p>',
        },
        enable_chat = true,
      },
    }
    require('codeium.virtual_text').status_string()
  end,
}