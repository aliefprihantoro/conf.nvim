local status, lualine = pcall(require, 'lualine')
if not status then
  return
end
local statusNavic, navic = pcall(require, 'nvim-navic')
local navicSetup = {}
if statusNavic then
  navicSetup = {
    function()
      return navic.get_location()
    end,
    cond = function()
      return navic.is_available()
    end,
  }
end
local codeium = function()
	local status_codeium = require('codeium.virtual_text').status()

	if status_codeium.state == 'idle' then
		-- Output was cleared, for example when leaving insert mode
        return ' '
    end

	if status_codeium.state == 'waiting' then
		-- Waiting for response
		return "Waiting..."
    end

	if status_codeium.state == 'completions' and status_codeium.total > 0 then
        return string.format('%d/%d', status_codeium.current, status_codeium.total)
    end

	return ' 0 '
end

lualine.setup {
  options = {
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  winbar = {
    lualine_c = {
      navicSetup,
    },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = '' },
        right_padding = 2,
      },
    },
    lualine_b = { { 'filename', path = 1 } },
    lualine_x = {},
    lualine_y = { codeium, 'diff', 'diagnostics', 'filetype' },
    lualine_z = {
      {
        'branch',
        separator = { right = '' },
        left_padding = 2,
      },
    },
  },
  tabline = {},
  extensions = {},
}
local cmd = vim.api.nvim_create_user_command
cmd('LualineToggle', function()
  if _G.LUALINE_DISABLE == false then
    lualine.hide {}
    _G.LUALINE_DISABLE = true
  else
    lualine.hide { unhide = true }
    _G.LUALINE_DISABLE = false
  end
end, {})