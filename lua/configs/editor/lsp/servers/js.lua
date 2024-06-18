local lsp = require 'lspconfig'
local inlayHints = {
  includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all'
  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  includeInlayVariableTypeHints = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}
local function rename_file()
  local source_file, target_file

  vim.ui.input({
    prompt = 'Source : ',
    completion = 'file',
    default = vim.api.nvim_buf_get_name(0),
  }, function(input)
    source_file = input
  end)
  vim.ui.input({
    prompt = 'Target : ',
    completion = 'file',
    default = source_file,
  }, function(input)
    target_file = input
  end)

  local params = {
    command = '_typescript.applyRenameFile',
    arguments = {
      {
        sourceUri = source_file,
        targetUri = target_file,
      },
    },
    title = '',
  }

  vim.lsp.util.rename(source_file, target_file)
  vim.lsp.buf.execute_command(params)
end

_G.TS_RENAME_FILE = rename_file
require('lspconfig').tsserver.setup {
  commands = {
    RenameFile = {
      rename_file,
      description = 'Rename File',
    },
  },
}
lsp.tsserver.setup {
  commands = {
    RenameFile = {
      rename_file,
      description = 'Rename File',
    },
  },
  settings = {
    typescript = {
      inlayHints = inlayHints,
    },
    javascript = {
      inlayHints = inlayHints,
    },
  },
  capabilities = {
    hoverProvider = true,
    codeActionProvider = true,
    snippetSupport = true,
  },
} -- js typescript
