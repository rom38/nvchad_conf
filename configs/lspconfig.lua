-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- local lspconfig = require "lspconfig"

-- EXAMPLE
-- local servers = { "html", "cssls" }
-- local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
-- for _, lsp in ipairs(servers) do
-- lspconfig[lsp].setup {
-- on_attach = nvlsp.on_attach,
-- on_init = nvlsp.on_init,
-- capabilities = nvlsp.capabilities,
-- }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
local configs = require "nvchad.configs.lspconfig"

configs.defaults()

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  eslint = {},
  -- tailwindcss = {},
  emmet_ls = {
    filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "typescriptreact" },
  },
  jsonls = {},
  awk_ls = {},
  bashls = {},
  ruff = {
    init_options = {
      settings = {
        -- Any extra CLI arguments for `ruff` go here.
        args = {},
      },
    },
  },
  pyright = {
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          autoSearchPaths = true,
          -- typeCheckingMode = "basic",
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
