return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
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
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          -- MCP Tools
          make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true,      -- Show tool results directly in chat buffer
          format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          make_vars = true,                -- Convert MCP resources to #variables for prompts
          -- MCP Prompts
          make_slash_commands = true,      -- Add MCP prompts as /slash commands
        }
      }
    },
    prompt_library = {
      ["Edit<->Test workflow"] = {
        strategy = "workflow",
        description = "Use a workflow to repeatedly edit then test code",
        opts = {
          index = 5,
          is_default = true,
          short_name = "et",
        },
        prompts = {
          {
            {
              name = "Setup Test",
              role = "user",
              opts = { auto_submit = false },
              content = function()
                local approvals = require("codecompanion.interactions.chat.tools.approvals")
                approvals:toggle_yolo_mode()
                return
[[### Instructions
Your instructions here

### Steps to Follow

You are required to write code following the instructions provided above and test the correctness by running the designated test suite. Follow these steps exactly:

1. Update the code in #{buffer} using the @{insert_edit_into_file} tool
2. Then use the @{cmd_runner} tool to run the test suite with `<test_cmd>` (do this after you have updated the code)
3. Make sure you trigger both tools in the same response

We'll repeat this cycle until the tests pass. Ensure no deviations from these steps.]]
              end,
            },
          },
          {
            {
              name = "Repeat On Failure",
              role = "user",
              opts = { auto_submit = true },
              condition = function(chat)
                return chat.tools.tool and chat.tools.tool.name == "cmd_runner"
              end,
              repeat_until = function(chat)
                return chat.tool_registry.flags.testing == true
              end,
              content = "The tests have failed. Can you edit the buffer and run the test suite again?",
            },
          },
        }
      }
    },
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default", -- default|mini_diff
      },
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
    },
    interactions = {
      chat = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4-20250514"
        }
      }
    }
  }
}
