local lsp = vim.lsp.config
local runtime_path = {}
table.insert(runtime_path, 'lua/init.lua')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local CONFIGS_DIR = vim.fn.stdpath 'config' .. '/lazy'

local function getFiles(dir)
  local files = vim.fn.readdir(dir)
  local output = {}
  for _, file in ipairs(files) do
    if file ~= '.' and file ~= '..' then
      table.insert(output, file)
    end
  end
  return output
end

local LIST_DIR = {
  vim.env.VIMRUNTIME,
}
local EXCLUDE_FILE = {}
for _, file in ipairs(getFiles(CONFIGS_DIR)) do
  if not vim.tbl_contains(EXCLUDE_FILE, file) then
    table.insert(LIST_DIR, string.format('%s/%s', CONFIGS_DIR, file))
  end
end

_G.LIST_DIR_LUA = LIST_DIR

-- lsp.luau_lsp = {} --- lua
lsp('lua_ls', {
  single_file_support = true,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        completion = {
          callSnippet = 'replace',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        ['hint.enable'] = true,
        workspace = {
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      })
      return
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      completion = {
        callSnippet = 'replace',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      ['hint.enable'] = true,
      workspace = {
        checkThirdParty = false,
        library = LIST_DIR,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    })
  end,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {},
  },
})
vim.lsp.enable('lua_ls')