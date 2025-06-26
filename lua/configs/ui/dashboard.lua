local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local board = {
  -- [[  \_________________/  ]],
  -- [[ __/__|_________|__\__ ]],
  -- [[  /⭕⭕_________⭕⭕\   ]],
  -- [[ |__/___GTR-R34___\__| ]],
  -- [[ \©©___|_|_|_|_|___©©/ ]],
  [[.-.   .-..-. .-..----..-.  .-..----. ]],
  [[|  `.'  || { } || {}  }\ \/ / | {}  }]],
  [[| |\ /| || {_} || .-. \ }  {  | .--' ]],
  [[`-' ` `-'`-----'`-' `-' `--'  `-'    ]],
}

local data_exists, custom_dasboard = pcall(require, 'custom.dashboard')
if data_exists then
  if type(custom_dasboard) == 'table' then
    local data_board = custom_dasboard.dashboard
    if data_board ~= nil then
      board = data_board
    end
  end
end

local dashboard = require 'alpha.themes.dashboard'
dashboard.section.header.val = board

local ShortCut = {
  dashboard.button('F', '󰈞  Find file', ':Telescope find_files <CR>'),
  dashboard.button('w', '  NPM WORKSPACE', ':Telescope npm_workspace <CR>'),
  dashboard.button('e', '  Open File Tree', ':Neotree<CR>'),
  dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('p', '  Find project', ':Telescope work_space <CR>'),
  dashboard.button('o', '  Recently used files', ':Telescope oldfiles <CR>'),
  dashboard.button('g', '󰈞  Find text', ':Telescope live_grep <CR>'),
  dashboard.button('c', '  Configuration', ':e $MYVIMRC | Cdn<CR>'),
  dashboard.button('z', '  Packer', ':Packer'),
  dashboard.button('q', '󰿅  Quit Neovim', ':qa<CR>'),
  { type = 'padding', val = 1 },
  { type = 'text', val = 'Quick links', opts = { hl = 'SpecialComment', position = 'center' } },
}
-- start quick links
local getList = vim.fn.system('cat ' .. _G.MURYP_FILE.LIST_PROJECT)
local ListProject = vim.split(getList, '\n')
_G.LIST_SOME = {}
for key, val in pairs(ListProject) do
  local DIR_NAME = vim.split(val, ' => ')
  if #DIR_NAME > 1 then
    -- table.insert(_G.LIST_SOME, { key, NAME, DIR })
    local NAME = DIR_NAME[1]
    local DIR = DIR_NAME[2]
    table.insert(ShortCut, dashboard.button(tostring(key), '  ' .. NAME, ':e ' .. DIR .. '<CR>'))
  end
end
--- end quick links

dashboard.section.buttons.val = ShortCut -- btn shortcut

local function footer()
  return 'Muryp Nvim'
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = 'Type'
dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
