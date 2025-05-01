local prompts = {
  -- Code related prompts
  Explain = 'Please explain how the following code works.',
  Review = 'Please review the following code and provide suggestions for improvement.',
  Tests = 'Please explain how the selected code works, then generate unit tests for it.',
  Refactor = 'Please refactor the following code to improve its clarity and readability.',
  FixCode = 'Please fix the following code to make it work as intended.',
  FixError = 'Please explain the error in the following text and provide a solution.',
  BetterNamings = 'Please provide better names for the following variables and functions.',
  Documentation = 'Please provide documentation for the following code.',
  SwaggerApiDocs = 'Please provide documentation for the following API using Swagger.',
  SwaggerJsDocs = 'Please write JSDoc for the following API using Swagger.',
  -- Text related prompts
  Summarize = 'Please summarize the following text.',
  Spelling = 'Please correct any grammar and spelling errors in the following text.',
  Wording = 'Please improve the grammar and wording of the following text.',
  Concise = 'Please rewrite the following text to make it more concise.',
}

return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      -- vim.keymap.set('i', '<C-g>', 'copilot#Accept()', { silent = true, expr = true, script = true })
      -- vim.keymap.set('i', '<C-g>', '<Plug>(copilot-accept-line)')
      vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set('i', '<C-e>', '<Plug>(copilot-accept-word)')
      vim.g.copilot_no_tab_map = true

      vim.api.nvim_set_keymap('i', '<C-n>', 'copilot#Next()', { silent = true, expr = true, script = true })
      vim.api.nvim_set_keymap('i', '<C-p>', 'copilot#Previous()', { silent = true, expr = true, script = true })
      vim.api.nvim_set_keymap('i', '<C-x>', 'copilot#Clear()', { silent = true, expr = true, script = true })

      -- Optionally, disable Copilot suggestions for specific file types
      vim.cmd [[
    let g:copilot_filetypes = {
      \ 'dotenv': v:false,
      \ 'markdown': v:false,
      \ }
    ]]
    end,
  },
  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      spec = {
        { '<leader>c', group = 'copilot' },
        { '<leader>gm', group = 'Copilot Chat' },
      },
    },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    -- version = "v3.3.0", -- Use a specific version to prevent breaking changes
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }, -- Use telescope for help actions
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      question_header = '## User ',
      answer_header = '## Copilot ',
      error_header = '## Error ',
      prompts = prompts,
      -- model = "claude-3.7-sonnet",
      mappings = {
        -- Reset the chat buffer
        reset = {
          normal = '<C-x>',
          insert = '<C-x>',
        },
        -- Accept the diff
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        -- Show help
        show_help = {
          normal = '?',
        },
      },
    },
    config = function(_, opts)
      local chat = require 'CopilotChat'
      chat.setup(opts)

      local select = require 'CopilotChat.select'
      vim.api.nvim_create_user_command('CopilotChatVisual', function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = '*', range = true })

      -- Restore CopilotChatBuffer
      vim.api.nvim_create_user_command('CopilotChatBuffer', function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = '*', range = true })
    end,
    event = 'VeryLazy',
    keys = {
      -- Show prompts actions with telescope
      {
        '<leader>cp',
        function()
          require('CopilotChat').select_prompt {
            context = {
              'buffers',
            },
          }
        end,
        desc = 'CopilotChat - Prompt actions',
      },
      {
        '<leader>cp',
        function()
          require('CopilotChat').select_prompt()
        end,
        mode = 'x',
        desc = 'CopilotChat - Prompt actions',
      },
      -- Code related commands
      { '<leader>ce', '<cmd>CopilotChatExplain<cr>', desc = 'CopilotChat - Explain code' },
      { '<leader>ct', '<cmd>CopilotChatTests<cr>', desc = 'CopilotChat - Generate tests' },
      { '<leader>cr', '<cmd>CopilotChatReview<cr>', desc = 'CopilotChat - Review code' },
      { '<leader>cR', '<cmd>CopilotChatRefactor<cr>', desc = 'CopilotChat - Refactor code' },
      { '<leader>cn', '<cmd>CopilotChatBetterNamings<cr>', desc = 'CopilotChat - Better Naming' },
      -- Chat with Copilot in visual mode
      {
        '<leader>cv',
        ':CopilotChatVisual',
        mode = 'x',
        desc = 'CopilotChat - Open in vertical split',
      },
      {
        '<leader>cx',
        ':CopilotChatInline',
        mode = 'x',
        desc = 'CopilotChat - Inline chat',
      },
      -- Custom input for CopilotChat
      {
        '<leader>ci',
        function()
          local input = vim.fn.input 'Ask Copilot: '
          if input ~= '' then
            vim.cmd('CopilotChat ' .. input)
          end
        end,
        desc = 'CopilotChat - Ask input',
      },
      -- Generate commit message based on the git diff
      {
        '<leader>cm',
        '<cmd>CopilotChatCommit<cr>',
        desc = 'CopilotChat - Generate commit message for all changes',
      },
      -- Quick chat with Copilot
      {
        '<leader>cq',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            vim.cmd('CopilotChatBuffer ' .. input)
          end
        end,
        desc = 'CopilotChat - Quick chat',
      },
      -- Fix the issue with diagnostic
      { '<leader>cf', '<cmd>CopilotChatFixError<cr>', desc = 'CopilotChat - Fix Diagnostic' },
      -- Clear buffer and chat history
      { '<leader>cl', '<cmd>CopilotChatReset<cr>', desc = 'CopilotChat - Clear buffer and chat history' },
      -- Toggle Copilot Chat Vsplit
      { '<leader>cc', '<cmd>CopilotChatToggle<cr>', desc = 'CopilotChat - Toggle' },
      -- Copilot Chat Models
      { '<leader>c?', '<cmd>CopilotChatModels<cr>', desc = 'CopilotChat - Select Models' },
      -- Copilot Chat Agents
      { '<leader>ca', '<cmd>CopilotChatAgents<cr>', desc = 'CopilotChat - Select Agents' },
    },
  },
}
