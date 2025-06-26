local M = {}
M.formatter_list = {
  lua = { 'stylua' },
  json = { 'jq' },
  fish = { 'fish_indent' },
  sh = { 'shfmt' },
  zsh = { 'shfmt' },
  astro = { 'astro' },
  markdown = { 'cbfmt', 'prettierd' },
  ['markdown.mdx'] = { 'cbfmt', 'prettierd' },
}

local addFormatter = function(listLang, formatter)
  for _, val in pairs(listLang) do
    M.formatter_list[val] = formatter
  end
end

M.jsFam = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'typescriptreact',
}
M.ignore = { 'markdown', 'markdown.mdx' }
addFormatter(M.jsFam, { 'prettierd' })
addFormatter({
  'html',
  'css',
  'scss',
}, { 'prettierd' })

return M
