-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- current shell
---@return string
local function get_shell()
  if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
    return 'powershell'
  end

  if vim.fn.has 'zsh' == 1 then
    return 'zsh'
  end

  return 'bash'
end

vim.opt.shell = get_shell()

-- tabs & indents
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Set wrap line
vim.opt.wrap = true

-- Splite windows
vim.opt.splitright = true
vim.opt.splitbelow = true
