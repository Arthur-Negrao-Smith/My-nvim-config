-- to restaure n key
vim.defer_fn(function()
  vim.cmd 'nmap n n'
end, 100)

-- REPLACE STRINGS
function Sub(opts)
  local args = vim.split(opts.args, ' ')
  local old
  local new

  -- :Sub old new
  if #args == 2 then
    old = args[1]
    new = args[2]
  -- visual + :Sub new
  elseif #args == 1 then
    new = args[1]

    local mode = vim.fn.mode()
    if mode ~= 'v' and mode ~= 'V' and mode ~= 'n' then
      print 'Error: select text in visual mode or use :Sub <old> <new>'
      return
    end

    -- collect the text in visual mode
    local _, ls, cs = unpack(vim.fn.getpos "'<")
    local _, le, ce = unpack(vim.fn.getpos "'>")
    local lines = vim.api.nvim_buf_get_text(0, ls - 1, cs - 1, le - 1, ce - 1, {})
    old = table.concat(lines, '')
  -- If number of arguments is invalid
  else
    print 'Usage: :Sub <old> <new> or visual + :Sub <new>'
  end

  local old_is_not_valid = string.match(old, '[/\\*%%]')
  local new_is_not_valid = string.match(new, '[/\\*%%]')
  if old_is_not_valid or new_is_not_valid then
    print 'Error: String have invalid characters. Use :help Sub to see the help guide.'
    return
  end

  local cmd = string.format('%%s/%s/%s/g', old, new)
  vim.cmd(cmd)
end

-- add Sub and Substitute commands
vim.api.nvim_create_user_command('Sub', Sub, {
  desc = 'Simple string substitution: :Sub old new or visual + :Sub new',
  nargs = '*',
})
vim.api.nvim_create_user_command('Substitute', Sub, {
  desc = 'Simple string substitution: :Substitute old new or visual + :Sub new',
  nargs = '*',
})

-- Add help guides from doc
vim.cmd 'helptags ~/.config/nvim/doc'
