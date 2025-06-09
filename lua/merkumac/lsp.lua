local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
local lspconfig = require 'lspconfig'

mason.setup()

local servers = {
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  },
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup(servers[server_name] or {})
  end,
}
