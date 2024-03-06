-- oil (files buffer)
-- neo-tree
-- vim-sleuth (auto detect tabstop and shiftwidth)
-- lazygit
-- bufferline
-- lualine
-- toggleterm
-- markdown-preview
-- spectre
-- trouble
-- illuminate (highlight word under cursor)

return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' } },

  { 'tpope/vim-sleuth' },

  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },

  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  { 'akinsho/toggleterm.nvim', version = '*', config = true },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  { 'nvim-pack/nvim-spectre', dependencies = { 'nvim-lua/plenary.nvim' } },

  { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },

  { 'RRethy/vim-illuminate' },
}
