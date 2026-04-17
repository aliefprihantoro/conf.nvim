local actions = require 'telescope.actions'
local layouts = require 'telescope.actions.layout'
local action_state = require 'telescope.actions.state'
local action_utils = require 'telescope.actions.utils'

local function single_or_multi_select(prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local CWD = current_picker.cwd or vim.fn.getcwd()
  local has_multi_selection = (next(current_picker:get_multi_selection()) ~= nil)

  if has_multi_selection then
    local results = {}
    action_utils.map_selections(prompt_bufnr, function(selection)
      table.insert(results, CWD .. '/' .. selection[1])
    end)

    -- load the selections into buffers list without switching to them
    for _, filepath in ipairs(results) do
      -- not the same as vim.fn.bufadd!
      vim.cmd.badd { args = { filepath } }
    end

    require('telescope.pickers').on_close_prompt(prompt_bufnr)

    -- switch to newly loaded buffers if on an empty buffer
    if vim.fn.bufname() == '' and not vim.bo.modified then
      vim.cmd.bwipeout()
      vim.cmd.buffer(results[1])
    end
    return
  end

  -- if does not have multi selection, open single file
  -- require('telescope.actions').file_edit(prompt_bufnr)
  actions.open_qflist(prompt_bufnr)
end
return {
  i = {
    ['<c-j>'] = actions.move_selection_next,
    ['<c-k>'] = actions.move_selection_previous,
    ['<c-p>'] = actions.preview_scrolling_up,
    ['<c-n>'] = actions.preview_scrolling_down,
    ['<C-f>'] = layouts.toggle_preview,
    ['<C-o>'] = single_or_multi_select,
    ['<c-u>'] = false,
    ['<c-l>'] = actions.preview_scrolling_right,
    ['<c-h>'] = actions.preview_scrolling_left,
    ['<C-a>'] = actions.toggle_all,
  },
  n = {
    q = actions.close,
    o = single_or_multi_select,
    ['<C-c>'] = actions.close,
    ['<leader>p'] = layouts.toggle_preview,
    ['<leader>a'] = actions.toggle_all,
  },
}