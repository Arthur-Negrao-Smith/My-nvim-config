local keyset = vim.keymap.set
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Change split window position
keyset('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
keyset('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
keyset('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
keyset('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Neo-tree keybinds
keyset('n', '<leader>er', '<Cmd>Neotree reveal<CR>', { desc = 'Reveal current file on Neotree' })

-- File manipulation
keyset({ 'n', 'v', 'i' }, '<leader>ww', '<Cmd>:w<CR>', { desc = 'Save file' })
keyset({ 'n', 'v', 'i' }, '<leader>wq', '<Cmd>:q<CR>', { desc = 'Quit file' })
keyset({ 'n', 'v', 'i' }, '<leader>wc', '<Cmd>:qa!<CR>', { desc = 'Force quit file' })
keyset({ 'n', 'v', 'i' }, '<leader>ws', '<Cmd>:wq<CR>', { desc = 'Save and quit file' })

-- BUFFERS --
-- Leader keys
keyset({ 'n', 'v', 'i' }, '<leader>bq', '<Cmd>BufferClose<CR>', { desc = 'Close actual tab' })
keyset({ 'n', 'v', 'i' }, '<leader>bl', '<Cmd>BufferNext<CR>', { desc = 'Change to next tab' })
keyset({ 'n', 'v', 'i' }, '<leader>bh', '<Cmd>BufferPrevious<CR>', { desc = 'Change to previous tab' })
keyset({ 'n', 'v', 'i' }, '<leader>b<', '<Cmd>BufferMoveNext<CR>', { desc = 'Move to next tab position' })
keyset({ 'n', 'v', 'i' }, '<leader>b>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move to previous tab position' })

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)
