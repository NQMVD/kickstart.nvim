--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]

vim.opt.termguicolors = true

vim.opt.mouse = 'a'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
vim.opt.clipboard = 'unnamedplus'

-- Set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Auto indenting
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

-- Enable break indent (smart indenting)
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Folding
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.guicursor = {
  'n-v-c:block', -- normal, visual, command-line
  'i-ci-ve:ver20', -- insert, command-line insert, visual-exclude: vertical bar with 25% width
  'r-cr:hor20', -- replace, command-line replace: horizontal bar with 20% height
  'o:hor20', -- operator pending: horizontal bar with 50% height
  'a:blinkwait800-blinkoff700-blinkon700', -- blink for all modes
  'sm:block-blinkwait300-blinkoff300-blinkon300', -- showmatch blink settings
}

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Neovide Settings
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_refresh_rate = 170
vim.g.neovide_refresh_rate_idle = 5

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
