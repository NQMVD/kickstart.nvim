vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { timeout = 200, visual = true }
  end,
})

-- oil(-leak) fix
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'oil',
  callback = function()
    vim.opt_local.colorcolumn = ''
  end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = vim.api.nvim_create_augroup('edit_text', { clear = true }),
  pattern = { 'gitcommit', 'markdown', 'txt' },
  desc = 'Enable spell checking and text wrapping for certain filetypes',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
