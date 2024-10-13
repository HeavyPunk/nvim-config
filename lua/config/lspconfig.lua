local M = {}

M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.on_attach = function(_, bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  on_init = M.on_init,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

lspconfig.csharp_ls.setup({
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  handlers = {
    ["textDocument/definition"] = require('csharpls_extended').handler,
    ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
  },
  filetypes = {"cs"},
  cmd = {"csharp-ls"},
  init_options = {
    AutomaticWorkspaceInit = true
  }
})

lspconfig.rust_analyzer.setup({
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = {"rust"},
  cargo = {
    allFeature = true
  }
})

lspconfig.clangd.setup({
  on_attach = M.on_attach,
  on_init = M.on_init,
  capabilities = M.capabilities,
  filetypes = {"c", "h", "cpp", "hpp"},
  root_dir = function() return vim.fn.getcwd() end,
  settings = {
    ["clangd"] = {
      cmd = {"clangd", "--background-index", "--clang-tidy", "--log=verbose"},
      init_options = {
        fallback_flags = {"-std=c++17"}
      }
    }
  }
})

lspconfig.gopls.setup({
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = {"go", "golang"},
  root_dir = function() return vim.fn.getcwd() end,
  settings = {
    ["gopls"] = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

lspconfig.kotlin_language_server.setup({
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = {"kotlin"},
  -- root_dir = function () return vim.fn.getcwd() end,
  -- init_options = {
  --  storagePath = vim.fn.resolve(vim.fn.stdpath("cache") .. "/kotlin_language_server")
  --} -- https://github.com/neovim/nvim-lspconfig/issues/3239
})

lspconfig.ts_ls.setup({
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = {"typescript", "typescriptreact"},
  root_dir = function() return vim.fn.getcwd() end
})

