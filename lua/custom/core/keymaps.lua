local keyset = vim.keymap.set
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Change split window position
keyset('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
keyset('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
keyset('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
keyset('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Indent the text
keyset('v', '<Tab>', '>', { desc = 'Indent line to Right' })
keyset('v', '<S-Tab>', '<', { desc = 'Indent line to left' })

-- Delete text
keyset('v', '<BS>', 'd', { desc = 'Delete selected text' }) -- <BS> is backspace
keyset('i', '<C-BS>', '<C-w>', { desc = 'Delete section' }) -- <C-BS> is ctrl + backspace

-- Neo-tree keybinds
keyset('n', '<leader>er', '<Cmd>Neotree reveal<CR>', { desc = 'Reveal current file on Neotree' })

-- File manipulation
keyset({ 'n', 'v' }, '<leader>ww', '<Cmd>:w<CR>', { desc = 'Save file' })
keyset({ 'n', 'v' }, '<leader>wq', '<Cmd>:q<CR>', { desc = 'Quit file' })
keyset({ 'n', 'v' }, '<leader>wc', '<Cmd>:qa!<CR>', { desc = 'Force quit file' })
keyset({ 'n', 'v' }, '<leader>ws', '<Cmd>:wq<CR>', { desc = 'Save and quit file' })
map('n', '<C-s>', '<Cmd>:w<CR>', opts)
map('i', '<C-s>', '<Cmd>:w<CR>', opts)

-- show lsp help
keyset({ 'n', 'i' }, '<C-p>', vim.lsp.buf.signature_help, { desc = 'Signature help from lsp' })

-- cut text selected
keyset('v', '<C-x>', 'c', { desc = 'Cut selected text' })

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
keyset({ 'n', 'v' }, '<leader>tv', '<Cmd>ToggleTerm dir=. direction=vertical<CR>', { desc = 'Open vertical terminal' })
keyset({ 'n', 'v' }, '<leader>th', '<Cmd>ToggleTerm dir=. direction=horizontal<CR>', { desc = 'Open horizontal terminal' })

function _G.set_terminal_keymaps()
  local opts_t = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts_t)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts_t)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts_t)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts_t)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts_t)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts_t)
  vim.keymap.set('t', '<C-w>', '<Cmd>exit<CR>', opts_t) -- close terminal: ctrl + w
end
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()' -- to add keymaps

-- Lazy
keyset({ 'n', 'v' }, '<leader>ll', '<Cmd>:Lazy<CR>', { desc = 'Open Lazy panel' })
keyset({ 'n', 'v' }, '<leader>lc', '<Cmd>:Lazy check<CR>', { desc = 'Lazy check updates' })
keyset({ 'n', 'v' }, '<leader>lh', '<Cmd>:Lazy health<CR>', { desc = 'Lazy health' })
keyset({ 'n', 'v' }, '<leader>lp', '<Cmd>:Lazy help<CR>', { desc = 'Lazy help guide' })
keyset({ 'n', 'v' }, '<leader>lm', '<Cmd>:Lazy home<CR>', { desc = 'Lazy home page' })

-- Lsp
keyset({ 'n', 'v' }, '<leader>mp', '<Cmd>:Mason<CR>', { desc = 'Mason home page' })
keyset({ 'n', 'v' }, '<leader>mh', '<Cmd>:checkhealth mason<CR>', { desc = 'Checkhealth of mason' })
keyset({ 'n', 'v' }, '<leader>mu', '<Cmd>:MasonUpdate<CR>', { desc = 'Mason update all languages' })
keyset({ 'n', 'v' }, '<leader>mr', '<Cmd>:MasonUninstallAll<CR>', { desc = 'Mason uninstall all servers' })
keyset({ 'n', 'v' }, '<leader>ml', '<Cmd>:MasonLog<CR>', { desc = 'Log of the mason' })

-- Git
keyset({ 'n', 'v' }, '<leader>gs', '<Cmd>:Gitsigns stage_hunk<CR>', { desc = 'Stage/Unstage the current hunk' })
keyset({ 'n', 'v' }, '<leader>gr', '<Cmd>:Gitsigns reset_hunk<CR>', { desc = 'Reset the current hunk' })
keyset({ 'n', 'v' }, '<leader>gi', '<Cmd>:Gitsigns preview_hunk_inline<CR>', { desc = 'Show the preview hunk inline' })
keyset({ 'n', 'v' }, '<leader>gp', '<Cmd>:Gitsigns preview_hunk<CR>', { desc = 'Show the preview hunk in a popup' })
keyset({ 'n', 'v' }, '<leader>gk', '<Cmd>:Gitsigns nav_hunk prev<CR>', { desc = 'Previous hunk' })
keyset({ 'n', 'v' }, '<leader>gj', '<Cmd>:Gitsigns nav_hunk next<CR>', { desc = 'Next hunk' })
keyset({ 'n', 'v' }, '<leader>gl', '<Cmd>:Gitsigns setqflist<CR>', { desc = 'List hunks' })
keyset({ 'n', 'v' }, '<leader>gs', '<Cmd>:Gitsigns show<CR>', { desc = 'Show the old buffer commited' })
keyset({ 'n', 'v' }, '<leader>gb', '<Cmd>:Gitsigns blame<CR>', { desc = 'Show the commits of each line' })
