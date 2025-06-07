return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && pnpm install',
    init = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_filetypes = { 'markdown', 'html' }
      vim.g.mkdp_combine_preview = 1
      vim.g.mkdp_combine_preview_auto_refresh = 1

      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_open_ip = '127.0.0.1'
      vim.g.mkdp_port = 8080
      vim.g.mkdp_browserfunc = function(url)
        print(url)
        -- local cmd = 'lemonade open ' .. url
        -- vim.cmd('silent !' .. cmd)
      end
    end,
    ft = { 'markdown' },
  },
}