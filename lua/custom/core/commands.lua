-- to restaure n key
vim.defer_fn(function()
  vim.cmd 'nmap n n'
end, 100)
