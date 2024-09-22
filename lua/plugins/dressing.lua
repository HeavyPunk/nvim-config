return {
  "stevearc/dressing.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  opts = {
      input = {
        win_options = {
          winhighlight = "NormalFloat:DiagnosticError",
        },
        mappings = {
          n = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
          }
        }
      },
      select = {
        get_config = function (opts)
          if opts.kind == "codeaction" then
            return {
              backend = "telescope",
              telescope = {
                relative = "cursor",
                max_width = 40,
              }
            }
          end
        end
      }
  },
  lazy = false
}
