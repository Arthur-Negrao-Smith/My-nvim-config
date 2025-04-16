local keyset = vim.keymap.set

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
