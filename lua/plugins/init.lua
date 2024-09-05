local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilitie

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "gopls",
        "csharp-language-server"
      }
    }
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    },
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("configs.dap")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function (_, opts)
      require("dapui").setup()
    end,
  },

  {
    "tanvirtin/vgit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function (_, opts)
      require("vgit").setup()
    end,
  },

  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to GitHub releases
    dependencies = {
        "nvim-lua/plenary.nvim", -- For standard functions
        "MunifTanjim/nui.nvim", -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = true,
    lazy = false
  },

  {
    "kwkarlwang/bufresize.nvim",
    config = function(_, opts)
      require("bufresize").setup({
        resize = {
          keys = {},
          trigger_events = {"VimResized"},
          increment = 5
        }
      })
    end,
    lazy = false
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      auto_install = true,
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "rust",
        "go", "c_sharp", "json",
        "yaml", "bash", "c", "python",
        "java", "javascript"
  		},
      ignore_install = {},
      modules = {
        highlight = {
          additional_vim_regex_highlighting = false,
          custom_captures = {},
          disable = {},
          enable = true,
          loaded = true,
          module_path = "nvim-treesitter.highlight",
          use_languagetree = true
        },
        incremental_selection = {
          disable = {},
          enable = false,
          keymaps = {
            init_selection = "gnn",
            node_decremental = "grm",
            node_incremental = "grn",
            scope_incremental = "grc"
          },
          module_path = "nvim-treesitter.incremental_selection"
        },
        indent = {
          disable = {},
          enable = true,
          loaded = true,
          module_path = "nvim-treesitter.indent"
        }
      },
      sync_install = false
  	},
  },
}
