--[[ 
  CTRL + hjkl: switch between windows
  ALT + hjkl: move selection
  SHIFT + enter: accept suggestion (CTRL+y)

  LEADER:
  keys left: h, g, x

  b: [b]uffers
    - b: last buffer
    - B: fzf search buffers
    - d: delete buffer
    - n: next
    - p: previous
    - A: all (stupid)
    - also split
  c: code
    - insert (fzf disable diagnostic type)
    - also coplilot toggle
  s: search (files, etc)
  f: find (code, etc)
  d: diagnostics
  u: UI
    - U: delete all ui overlays
  W: windows
    - just take all CTRL+w keybinds
    - resize (by 5 chars each time tho)
  m: minimap?
  y/p: void?
  t: terminals
  e: neo-tree explorer

  FIXES:
  - remove ctrl + f/b
  - replace selection without cutting to register

  OTHER:
  open github page for plugin under cursor
  "lua vim.ui.open(LINK)"
  nset("gx", ":sil !open <cWORD><cr>", { silent = true })

Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
  require("spectre").toggle()
end)
]]

local set = vim.keymap.set
local nset = function(...)
  vim.keymap.set('n', ...)
end

nset('<Esc>', '<cmd>nohlsearch<CR>')

-- Press 'U' for redo
nset('U', '<C-r>')
-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nset('L', '$')
nset('H', '^')
-- Press 'H', 'L' to jump to start/end of a line (first/last char)
set('v', 'L', '$<left>')
set('v', 'H', '^')

-- Save with leader key
nset('<leader>w', '<cmd>w<cr>', { silent = false })

-- Quit with leader key
nset('<leader>q', '<cmd>q<cr>', { silent = false })

-- Save and Quit with leader key
nset('<leader>z', '<cmd>wq<cr>', { silent = false })

-- Diagnostic keymaps

-- Goto next diagnostic of any severity
-- nnoremap("]d", function()
--   vim.diagnostic.goto_next({})
--   vim.api.nvim_feedkeys("zz", "n", false)
-- end)
--
-- -- Goto previous diagnostic of any severity
-- nnoremap("[d", function()
--   vim.diagnostic.goto_prev({})
--   vim.api.nvim_feedkeys("zz", "n", false)
-- end)
--
-- -- Goto next error diagnostic
-- nnoremap("]e", function()
--   vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
--   vim.api.nvim_feedkeys("zz", "n", false)
-- end)
--
-- -- Goto previous error diagnostic
-- nnoremap("[e", function()
--   vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
--   vim.api.nvim_feedkeys("zz", "n", false)
-- end)
--
-- -- Goto next warning diagnostic
-- nnoremap("]w", function()
--   vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
--   vim.api.nvim_feedkeys("zz", "n", false)
-- end)
--
-- -- Goto previous warning diagnostic
-- nnoremap("[w", function()
--   vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
--   vim.api.nvim_feedkeys("zz", "n", false)
-- end)
--
-- -- Open the diagnostic under the cursor in a float window
-- nnoremap("<leader>d", function()
--   vim.diagnostic.open_float({
--     border = "rounded",
--   })
-- end)
--
-- -- Place all dignostics into a qflist
-- nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })
--
-- -- Navigate to next qflist item
-- nnoremap("<leader>cn", ":cnext<cr>zz")
--
-- -- Navigate to previos qflist item
-- nnoremap("<leader>cp", ":cprevious<cr>zz")
--
-- -- Open the qflist
-- nnoremap("<leader>co", ":copen<cr>zz")
--
-- -- Close the qflist
-- nnoremap("<leader>cc", ":cclose<cr>zz")
-- nset('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- nset(']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- nset('<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- nset('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

nset('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
nset('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
nset('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
nset('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Center buffer while navigating
nset('<C-u>', '<C-u>zz')
nset('<C-d>', '<C-d>zz')
nset('{', '{zz')
nset('}', '}zz')
nset('N', 'Nzz')
nset('n', 'nzz')
nset('G', 'Gzz')
nset('gg', 'ggzz')
nset('<C-i>', '<C-i>zz')
nset('<C-o>', '<C-o>zz')
nset('%', '%zz')
nset('*', '*zz')
nset('#', '#zz')

-- folds
-- nvim-ufo keybinds
nset('zR', require('ufo').openAllFolds)
nset('zM', require('ufo').closeAllFolds)

-- move line up and down
set('v', '<A-j>', ":m '>+1<CR>gv=gv")
set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Oil and Neotree
nset('<leader>o', function()
  require('oil').toggle_float()
end, { desc = '[o]il (float)' })
nset('<leader>O', '<cmd>Oil<CR>', { desc = '[O]il' })
nset('<leader>e', '<cmd>Neotree<CR>', { desc = '[E]xplore Neotree' })
nset('<leader>E', MiniFiles.open, { desc = '[E]xplore Neotree' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
set('t', 'jj', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- Window navigation from terminal
set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
