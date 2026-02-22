local M = {}

-- vim.lsp.set_log_level("error")

-- vim.diagnostic.config({
--   virtual_lines = {
--     current_line = true,
--   },
--   severity_sort = true,
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "",
--       [vim.diagnostic.severity.WARN] = "",
--       [vim.diagnostic.severity.INFO] = "󰁨",
--       [vim.diagnostic.severity.HINT] = "",
--     },
--     numhl = {
--       [vim.diagnostic.severity.ERROR] = "",
--       [vim.diagnostic.severity.WARN] = "",
--       [vim.diagnostic.severity.INFO] = "",
--       [vim.diagnostic.severity.HINT] = "",
--     },
--   },
-- })

-- M.on_init = function(client, _)
--   if client.supports_method "textDocument/semanticTokens" then
--     client.server_capabilities.semanticTokensProvider = nil
--   end
-- end
--
-- M.on_attach = function(_, bufnr)
-- end
--
-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities.textDocument.completion.completionItem = {
--   documentationFormat = { "markdown", "plaintext" },
--   snippetSupport = true,
--   preselectSupport = true,
--   insertReplaceSupport = true,
--   labelDetailsSupport = true,
--   deprecatedSupport = true,
--   commitCharactersSupport = true,
--   tagSupport = { valueSet = { 1 } },
--   resolveSupport = {
--     properties = {
--       "documentation",
--       "detail",
--       "additionalTextEdits",
--     },
--   },
-- }

-- local lspconfig = require("lspconfig")
-- local lspconfig = vim.lsp.config

local lspconfig = function (server, opts)
  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

vim.lsp.config("*", {
  root_markers = {".git"},
})

vim.lsp.config("gopls", {
  cmd = {"gopls"},
  filetypes = {"go", "golang"},
  -- settings = {
  --   ["gopls"] = {
  --     analyses = {
  --       unusedparams = true,
  --     },
  --     staticcheck = true,
  --     gofumpt = true,
  --   },
  -- },
})
vim.lsp.enable("gopls", vim.fn.executable('gopls') == 1)

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
--       vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--       vim.keymap.set('i', '<C-Space>', function()
--         vim.lsp.completion.get()
--       end)
--     end
--   end,
-- })

-- vim.lsp.start({
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   -- filetypes = {"rust"},
--   root_markers = {".git", "Cargo.toml"},
--
--   -- root_dir = function(fname)
--   --   print("root_dir called with:", fname)
--   --   local cwd = vim.fn.getcwd()
--   --   print("Returning cwd as root_dir:", cwd)
--   --   return cwd
--   -- end,
--   cmd = {"rust-analyzer"},
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true
--       }
--     },
--   }
-- })

-- lspconfig("rust_analyzer", {
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   -- filetypes = {"rust"},
--   root_markers = {".git", "Cargo.toml"},
--
--   -- root_dir = function(fname)
--   --   print("root_dir called with:", fname)
--   --   local cwd = vim.fn.getcwd()
--   --   print("Returning cwd as root_dir:", cwd)
--   --   return cwd
--   -- end,
--   -- cmd = {"rust-analyzer"},
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true
--       }
--     },
--   }
-- })

-- lspconfig("lua_ls", {
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   on_init = M.on_init,
--
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           vim.fn.expand "$VIMRUNTIME/lua",
--           vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
--           vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
--           vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
--           "${3rd}/luv/library",
--         },
--         maxPreload = 100000,
--         preloadFileSize = 10000,
--       },
--     },
--   },
-- })

-- lspconfig("csharp_ls", {
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   handlers = {
--     ["textDocument/definition"] = require('csharpls_extended').handler,
--     ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
--   },
--   filetypes = {"cs"},
--   cmd = {"csharp-ls"},
--   init_options = {
--     AutomaticWorkspaceInit = true
--   }
-- })

--
-- lspconfig.lua_ls.setup({
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   on_init = M.on_init,
--
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           vim.fn.expand "$VIMRUNTIME/lua",
--           vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
--           vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
--           vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
--           "${3rd}/luv/library",
--         },
--         maxPreload = 100000,
--         preloadFileSize = 10000,
--       },
--     },
--   },
-- })

-- lspconfig.csharp_ls.setup({
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   handlers = {
--     ["textDocument/definition"] = require('csharpls_extended').handler,
--     ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
--   },
--   filetypes = {"cs"},
--   cmd = {"csharp-ls"},
--   init_options = {
--     AutomaticWorkspaceInit = true
--   }
-- })

-- lspconfig.rust_analyzer.setup({
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   filetypes = {"rust"},
--   cargo = {
--     allFeature = true
--   }
-- })


-- lspconfig("clangd", {
--   on_attach = M.on_attach,
--   on_init = M.on_init,
--   capabilities = M.capabilities,
--   filetypes = {"c", "h", "cpp", "hpp"},
--   root_dir = function() return vim.fn.getcwd() end,
--   settings = {
--     ["clangd"] = {
--       cmd = {"clangd", "--background-index", "--clang-tidy", "--log=verbose"},
--       init_options = {
--         fallback_flags = {"-std=c++17"}
--       }
--     }
--   }
-- })

-- lspconfig.clangd.setup({
--   on_attach = M.on_attach,
--   on_init = M.on_init,
--   capabilities = M.capabilities,
--   filetypes = {"c", "h", "cpp", "hpp"},
--   root_dir = function() return vim.fn.getcwd() end,
--   settings = {
--     ["clangd"] = {
--       cmd = {"clangd", "--background-index", "--clang-tidy", "--log=verbose"},
--       init_options = {
--         fallback_flags = {"-std=c++17"}
--       }
--     }
--   }
-- })

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function()
--     -- Mnemonic: k = "kill (toggle) line diagnostics"
--     vim.keymap.set('n', '<Leader>k', function()
--       if vim.diagnostic.config().virtual_lines then
--         vim.diagnostic.config({ virtual_lines = false })
--       else
--         vim.diagnostic.config({ virtual_lines = true })
--       end
--     end, { buffer = true, silent = true })
--
--     -- Mnemonic: l = "toggle line diagnostics floating window"
--     vim.keymap.set('n', '<Leader>l', function()
--       vim.diagnostic.open_float({ border = 'single' })
--     end, { buffer = true, silent = true })
--
--     vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition, { buffer = true, silent = true })
--     vim.keymap.set('n', 'K', function()
--       vim.lsp.buf.hover({ border = 'single' })
--     end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { buffer = true, silent = true })
--
--     vim.wo.signcolumn = 'yes'
--   end,
-- })

-- lspconfig("gopls", {
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   filetypes = {"go", "golang"},
--   root_markers = { 'go.work', 'go.mod' },
--   root_dir = nil,
--   -- root_dir = function() return vim.fn.getcwd() end,
--   settings = {
--     ["gopls"] = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--       gofumpt = true,
--     },
--   },
-- })


-- lspconfig.gopls.setup({
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   filetypes = {"go", "golang"},
--   root_dir = function() return vim.fn.getcwd() end,
--   settings = {
--     ["gopls"] = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--       gofumpt = true,
--     },
--   },
-- })

-- lspconfig.kotlin_language_server.setup({
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   filetypes = {"kotlin"},
--   -- root_dir = function () return vim.fn.getcwd() end,
--   -- init_options = {
--   --  storagePath = vim.fn.resolve(vim.fn.stdpath("cache") .. "/kotlin_language_server")
--   --} -- https://github.com/neovim/nvim-lspconfig/issues/3239
-- })

-- lspconfig("ts_ls", {
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
--   root_dir = function() return vim.fn.getcwd() end
-- })

-- lspconfig.ts_ls.setup({
--   on_init = M.on_init,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--   filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
--   root_dir = function() return vim.fn.getcwd() end
-- })

