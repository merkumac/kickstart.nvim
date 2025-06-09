-- Highlight overflow lines past a soft limit with bg color
local M = {}

local function set_colorcolumn_highlight(limit)
  vim.cmd 'silent! call matchdelete(9999)'
  vim.fn.matchadd('OverLength', string.format('\\%%%dv.*', limit), 100, 9999)
end

function M.setup()
  vim.cmd [[highlight OverLength ctermbg=darkred guibg=#51202A]]

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
      set_colorcolumn_highlight(89)
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp', 'h', 'hpp' },
    callback = function()
      set_colorcolumn_highlight(81)
    end,
  })
end

return M
