-- vim.cmd("autocmd!")
local set = vim.opt
set.swapfile = false
set.background = 'dark'
set.compatible = false
vim.scriptencoding = 'utf-8'
set.spelllang = { 'en', 'id' }
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
vim.wo.number = true
set.title = true
set.autoindent = true
set.smartindent = true
set.smarttab = true
set.backspace = { 'start', 'eol', 'indent' }
set.shiftround = true -- Round indent
set.softtabstop = 2
set.shiftwidth = 2
set.tabstop = 2
set.expandtab = true
set.hlsearch = true
set.backup = false
set.showcmd = true
set.showtabline = 0
set.cmdheight = 0
set.laststatus = 0
set.scrolloff = 10
set.shell = 'zsh'
set.backupskip = { '/tmp/*', '/private/tmp/*' }
set.inccommand = 'split'
set.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
set.breakindent = true
set.wrap = false -- No Wrap lines
set.wildignore:append { '*/node_modules/*' }
-- enable line and column display
set.ruler = true
-- scroll a bit horizontally when at the end of the line
set.sidescroll = 6
-- Make it easier to work with buffers
-- http://vim.wikia.com/wiki/Easier_buffer_switching
set.hidden = true
set.confirm = true
-- open new split panes to right and below (as you probably expect)
set.splitright = true
set.splitbelow = true
vim.o.lazyredraw = false
set.conceallevel = 2
set.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
set.wildmode = 'longest:full,full' -- Command-line completion mode
set.winminwidth = 5 -- Minimum window width
set.termguicolors = true -- True color support
set.timeoutlen = 300
set.undofile = true
set.undolevels = 10000
set.shortmess:append { W = true, I = true, c = true, C = true }
set.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
set.smartcase = true -- Don't ignore case with capitals
vim.g.markdown_recommended_style = 0
vim.cmd [[
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd TermOpen * normal i
]]
