return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    "nvim-treesitter/nvim-treesitter",
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    -- {
    --   "milanglacier/minuet-ai.nvim",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "hrsh7th/nvim-cmp",
    --   }
    -- }
  },
  opts = {
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default", -- default|mini_diff
      },
    },
    adapters = {
      http = {
        kontur_llm = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://srs-litellm.kontur.host",
              api_key = vim.env.CLAUDE_API_KEY,
              chat_url = "/v1/chat/completions",
              models_endpoint = "/v1/models"
            },
            schema = {
              temperature = {
                order = 2,
                mapping = "parameters",
                type = "number",
                optional = true,
                default = 0.8,
                validate = function (n)
                  return n >= 0 and n <= 2, "Must be between 0 and 2"
                end
              },
              max_completion_tokens = {
                order = 3,
                mapping = "parameters",
                type = "integer",
                optional = true,
                default = nil,
                desc = "An upper bound for the number of tokens that can be generated for a completion.",
                validate = function(n)
                  return n > 0, "Must be greater than 0"
                end,
              },
              stop = {
                order = 4,
                mapping = "parameters",
                type = "string",
                optional = true,
                default = nil,
                desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
                validate = function(s)
                  return s:len() > 0, "Cannot be an empty string"
                end,
              },
              logit_bias = {
                order = 5,
                mapping = "parameters",
                type = "map",
                optional = true,
                default = nil,
                desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
                subtype_key = {
                  type = "integer",
                },
                subtype = {
                  type = "integer",
                  validate = function(n)
                    return n >= -100 and n <= 100, "Must be between -100 and 100"
                  end,
                },
              }
            }
          })
        end,
      }
    },
    strategies = {
      chat = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514"
      },
      inline = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
        keymaps = {
          accept_change = {
            modes = { n = "ct" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "co" },
            description = "Reject the suggested change",
          }
        }
      },
      agent = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514"
      },
      cmd = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514"
      },

      -- chat = {
      --   opts = {
      --     completion_provider = "cmp",
      --   },
      --   roles = {
      --     ---@type string|fun(adapter: CodeCompanion.Adapter): string
      --     llm = function (adapter)
      --       return "KonturLLM (" .. adapter.formatted_name .. ")"
      --     end,
      --     user = "Me",
      --   },
      --   adapter = {
      --     name = "kontur_llm",
      --     model = "claude_opus_4",
      --   },
      -- },
      -- inline = {
      --   adapter = {
      --     name = "kontur_llm",
      --     model = "gpt4_o_mini",
      --   },
      --   keymaps = {
      --     accept_change = {
      --       modes = { n = "ct" },
      --       description = "Accept the suggested change",
      --     },
      --     reject_change = {
      --       modes = { n = "co" },
      --       description = "Reject the suggested change",
      --     }
      --   }
      -- },
      -- agent = {
      --   adapter = {
      --     name = "kontur_llm",
      --     model = "gpt4_o_mini",
      --   }
      -- }
    },
  }
}
