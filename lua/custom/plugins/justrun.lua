return {
  'Arthur-Negrao-Smith/JustRun.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },

  version = '*',

  -- Lazy Loading
  cmd = { 'JustRun', 'JustRunUnderCursor', 'JustRunFind', 'JustRunFile' },

  config = function()
    require('justrun').setup {}
  end,
}
