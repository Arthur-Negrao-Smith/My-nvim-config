return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { '<leader>st', '<cmd>TodoTelescope<cr>', desc = '[S]earch TODOs' },
    { '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = '[S]earch TODO/FIX/FIXME' },
  },
}
