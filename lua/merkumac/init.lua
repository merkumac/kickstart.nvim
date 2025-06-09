require 'merkumac.options'

vim.g.kickstart_disable_lsp = true

require 'merkumac.lsp'
require('merkumac.colorcolumns').setup()
vim.notify('merkumac config loaded', vim.log.levels.INFO)

vim.keymap.set('n', '<leader>lr', function()
  vim.cmd(':!ruff check ' .. vim.fn.expand '%')
end, { desc = 'Run ruff on current file' })
