-- oil (files buffer)
-- neo-tree
-- vim-sleuth (auto detect tabstop and shiftwidth)
-- lazygit
-- bufferline
-- lualine
-- toggleterm (toggle terminals)
-- markdown-preview
-- spectre (search panel)
-- trouble (diagnostics panel)
-- illuminate (highlight word under cursor)
-- ufo (modern folding)

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

  { 'nvim-lualine/lualine.nvim', opts = {}, dependencies = { 'nvim-tree/nvim-web-devicons' } },

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

  {
    'kevinhwang91/nvim-ufo',
    event = 'BufEnter',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      --- @diagnostic disable: unused-local
      require('ufo').setup {
        provider_selector = function(_bufnr, _filetype, _buftype)
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },
}
