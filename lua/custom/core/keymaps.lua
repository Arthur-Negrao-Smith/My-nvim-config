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
keyset({ 'n', 'v' }, '<leader>ww', '<Cmd>:w<CR>', { desc = 'Save file' })
keyset({ 'n', 'v' }, '<leader>wq', '<Cmd>:q<CR>', { desc = 'Quit file' })
keyset({ 'n', 'v' }, '<leader>wc', '<Cmd>:qa!<CR>', { desc = 'Force quit file' })
keyset({ 'n', 'v' }, '<leader>ws', '<Cmd>:wq<CR>', { desc = 'Save and quit file' })
map('n', '<C-s', '<Cmd>:w<CR>', opts)

-- BUFFERS --
-- Leader keys
keyset({ 'n', 'v' }, '<leader>bq', '<Cmd>BufferClose<CR>', { desc = 'Close actual tab' })
keyset({ 'n', 'v' }, '<leader>bl', '<Cmd>BufferNext<CR>', { desc = 'Change to next tab' })
keyset({ 'n', 'v' }, '<leader>bh', '<Cmd>BufferPrevious<CR>', { desc = 'Change to previous tab' })
keyset({ 'n', 'v' }, '<leader>bL<', '<Cmd>BufferMoveNext<CR>', { desc = 'Move to next tab position' })
keyset({ 'n', 'v' }, '<leader>bH>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move to previous tab position' })

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-S-h>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-S-l>', '<Cmd>BufferMoveNext<CR>', opts)

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

-- Toggle Term
keyset({ 'n', 'v' }, '<leader>tf', '<Cmd>ToggleTerm dir=. direction=float size=50<CR>', { desc = 'Open floating terminal' })
keyset({ 'n', 'v' }, '<leader>tv', '<Cmd>ToggleTerm dir=. direction=vertical size=50<CR>', { desc = 'Open vertical terminal' })
keyset({ 'n', 'v' }, '<leader>th', '<Cmd>ToggleTerm dir=. direction=horizontal size=10<CR>', { desc = 'Open horizontal terminal' })

map('t', '<C-q>', '<Cmd>close<CR>', opts)
