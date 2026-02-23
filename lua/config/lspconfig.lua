local M = {}

vim.lsp.set_log_level("warn")

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰁨",
      [vim.diagnostic.severity.HINT] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})

M.on_init = function(client, _)
  if client:supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.on_attach = function(_, bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp-nvim-lsp')
if has_cmp_nvim_lsp then
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

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

vim.lsp.config("*", {
  root_markers = {".git"},
})

vim.lsp.config("lua_ls", {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  on_init = M.on_init,
  filetypes = {"lua"},
  cmd = {'lua-language-server'},
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
vim.lsp.enable("lua_ls", vim.fn.executable('lua-language-server') == 1)

vim.lsp.config("gopls", {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  on_init = M.on_init,
  cmd = {"gopls"},
  filetypes = {"go", "golang"},
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
vim.lsp.enable("gopls", vim.fn.executable('gopls') == 1)

vim.lsp.config("rust_analyzer", {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  on_init = M.on_init,
  cmd = {"rust-analyzer"},
  filetypes = { 'rust' },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true
      }
    }
  }
})
vim.lsp.enable("rust_analyzer", vim.fn.executable('rust-analyzer') == 1)

vim.lsp.config("csharp_ls", {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = {"cs"},
  cmd = {"csharp-ls"},
  init_options = {
    AutomaticWorkspaceInit = true
  }
})
vim.lsp.enable("csharp_ls", vim.fn.executable('csharp-ls') == 1)

vim.lsp.config("clangd", {
  on_attach = M.on_attach,
  on_init = M.on_init,
  capabilities = M.capabilities,
  filetypes = {"c", "h", "cpp", "hpp"},
  settings = {
    ["clangd"] = {
      cmd = {"clangd", "--background-index", "--clang-tidy", "--log=verbose"},
      init_options = {
        fallback_flags = {"-std=c++17"}
      }
    }
  }
})
vim.lsp.enable("clangd", vim.fn.executable('clangd') == 1)

vim.lsp.config("ts_ls", {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
  cmd = {"typescript-language-server"}
})
vim.lsp.enable("ts_ls", vim.fn.executable('typescript-language-server') == 1)

