local M = {}
M.sc1 = {
  {
    name = 'html-css',
  },
  { name = 'nvim_lsp' },
  { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'zsh' },
  -- { name = 'snippy' },
  { name = 'nvim_lua' },
  -- { name = 'cmp-tw2css'},
  {
    name = 'vim-dadbod-completion',
    option = {
      filetypes = {
        'sql',
        'mysql',
        'plsql',
      },
    },
  },
  { name = 'path', priority = 7 },
}
M.sc2 = {
  { name = 'buffer', priority = 7 },
  {
    name = 'emmet_vim',
    priority = 9,
    option = {
      filetypes = {
        'html',
        'xml',
        'typescriptreact',
        'javascriptreact',
        'css',
        'sass',
        'scss',
        'less',
        'heex',
        'tsx',
        'jsx',
        'js',
        'ts',
        'typescript',
        'javascript',
        'php',
      },
    },
  },
  -- { name = 'emoji' },
}
return M