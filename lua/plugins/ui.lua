-- dashboard
-- which-key (keybinds popup)
-- gitsigns (gitsigns and tools)
-- indent-blankline
-- todo-comments (highlight todo comments)
-- dressing (modern ui components)
-- noice (modern ui components)
-- twilight
-- > Check for Neovide here
-- neoscroll (smooth scroll)
--
-- TODO: extract kaymaps to own file

return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup()
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup()
    end,
  },

  { 'folke/noice.nvim', event = 'VeryLazy', opts = {}, dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' } },

  { 'folke/twilight.nvim', opts = {} },

  {
    'karb94/neoscroll.nvim',
    config = function()
      if not vim.g.neovide then
        require('neoscroll').setup()
      end
    end,
  },
}
