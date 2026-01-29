local ls = require 'luasnip'

---- KEYMAPS ----

-- expand snipet menu
vim.keymap.set({ 'i' }, '<C-K>', function()
  ls.expand()
end, { silent = true })

-- jump to next selection
vim.keymap.set({ 'i', 's' }, '<C-A-L>', function()
  ls.jump(1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-Right>', function()
  ls.jump(1)
end, { silent = true })

-- jump to previous selection
vim.keymap.set({ 'i', 's' }, '<C-A-H>', function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-Left>', function()
  ls.jump(-1)
end, { silent = true })

-- to next choice nodes
vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-Down>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- to previous choice nodes
vim.keymap.set({ 'i', 's' }, '<C-S-E>', function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-Up>', function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true })

---- SNIPPETS ----

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require 'luasnip.extras'
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt
local c = ls.choice_node

-- python
ls.add_snippets('python', {
  -- def
  s(
    'def',
    fmt(
      [[
    def {}({}) -> {}:
      {}
    ]],
      {
        i(1),
        i(2, 'args'),
        i(3, 'None'),
        i(4, 'pass'),
      }
    )
  ),

  -- try/except
  s(
    'try',
    fmt(
      [[
    try:
      {}
    except:
      {}
    ]],
      { i(1, '# try body'), i(2, '# handle the exception') }
    )
  ),

  -- from
  s(
    'from',
    fmt(
      [[
      from {} import {}
      ]],
      { i(1, 'foo'), i(2, 'bar') }
    )
  ),
})

-- java
ls.add_snippets('java', {
  -- class
  s(
    'class',
    fmt(
      [[
    {} class {} {{
      public {}({}) {{
        {}
      }}
    }}
    ]],
      { c(1, { t 'public', t 'private', t 'protected' }), i(2, 'className'), rep(2), i(3, 'args'), i(4) }
    )
  ),

  -- try/catch
  s(
    'try',
    fmt(
      [[
    try {{
      {}
    }} catch ({} e) {{
      {}
    }}
    ]],
      { i(1, '// try body'), i(2, 'Exception'), i(3, '// default catch') }
    )
  ),
})
