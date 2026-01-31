-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

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

-- current shell
---@return string
local function get_shell()
  ---@type boolean
  local is_windows = vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1

  if is_windows then
    if vim.fn.executable 'pwsh' then
      return 'pwsh.exe'
    elseif vim.fn.executable 'powershell' then
      return 'powershell.exe'
    else
      return 'cmd.exe'
    end
  end

  if vim.fn.executable 'zsh' == 1 then
    return 'zsh'
  end

  return 'bash'
end

vim.opt.shell = get_shell()

---@type string
local current_shell = vim.o.shell:lower()
if current_shell:find 'powershell' or current_shell:find 'pwsh' then
  vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
  vim.opt.shellpipe = '| Out-File -Encoding UTF8 %s; if($?) { exit $LASTEXITCODE } else { exit 1 }'
  vim.opt.shellredir = '| Out-File -Encoding UTF8 %s; if($?) { exit $LASTEXITCODE } else { exit 1 }'
  vim.opt.shellxquote = ''
  vim.opt.shellquote = ''
end
