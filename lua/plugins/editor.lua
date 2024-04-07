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
    config = function()
      require('oil').setup {
        use_default_keymaps = false,
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-\\>'] = 'actions.select_split',
          ['<C-enter>'] = 'actions.select_vsplit', -- this is used to navigate left
          ['<C-t>'] = 'actions.select_tab',
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['<C-r>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
        },
        view_options = {
          show_hidden = true,
        },
      }
    end,
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

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      local none_types = {
        'neo-tree',
        'dashboard',
        'Trouble',
      }

      local function has_mode()
        return true --not vim.list_contains(none_types, vim.bo.filetype)
      end

      ---@diagnostic disable-next-line: undefined-field
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          -- '%=', --[[ add your center components here ]]
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 1, cond = has_mode } },
          lualine_b = { { 'filename', cond = has_mode } },
          lualine_c = { { 'diagnostics', cond = has_mode } },
          lualine_x = {},
          lualine_y = { 'filetype' },
          lualine_z = {
            { 'progress', separator = { right = '' }, left_padding = 1 },
          },
        },
        inactive_sections = {
          lualine_a = { { 'filename', cond = has_mode } },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'filetype' },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        float_opts = {
          border = 'rounded',
        },
      }
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  {
    'nvim-pack/nvim-spectre',
    lazy = true,
    cmd = { 'Spectre' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'catppuccin/nvim',
    },
    config = function()
      local theme = require('catppuccin.palettes').get_palette 'mocha'

      vim.api.nvim_set_hl(0, 'SpectreSearch', { bg = theme.red, fg = theme.base })
      vim.api.nvim_set_hl(0, 'SpectreReplace', { bg = theme.green, fg = theme.base })

      require('spectre').setup {
        highlight = {
          search = 'SpectreSearch',
          replace = 'SpectreReplace',
        },
        mapping = {
          ['send_to_qf'] = {
            map = '<C-q>',
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = 'send all items to quickfix',
          },
        },
      }
    end,
  },

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
