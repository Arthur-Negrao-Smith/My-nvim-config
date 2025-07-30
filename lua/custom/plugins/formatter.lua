return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        python = { 'isort', 'black' },
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        go = { 'gofmt' },
        markdown = { 'prettier' },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    }
  end,
}
