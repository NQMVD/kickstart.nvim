return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Align text
    require('mini.align').setup()

    -- alt to comment.nvim
    require('mini.comment').setup()

    -- alt to neotree
    require('mini.files').setup()

    -- vscode like minimap
    require('mini.map').setup()

    -- prettyprint lua tables
    require('mini.misc').setup()

    -- move selections
    require('mini.move').setup()

    -- alt to nvim notify and noice
    -- require('mini.notify').setup()

    -- eval selected text
    require('mini.operators').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()

    -- autopairs
    require('mini.pairs').setup()

    -- show indent guide
    -- require('mini.indentscope').setup { symbol = '|' }
  end,
}
