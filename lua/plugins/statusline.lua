return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "bradcush/nvim-base16",
  },
  opts = {
    options = {
      theme = "base16",
      icons_enabled = true,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = {},
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
lualine_x = {'encoding', 'fileformat', 'filetype', function()
        local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
        if #clients == 0 then
          return '%#DiagnosticError#✗ No LSP%*'
        end
        return '%#DiagnosticOk#⚡️ ' .. table.concat(vim.tbl_map(function(client) return client.name end, clients), ', ') .. '%*'
      end},
      lualine_y = {'progress'},
      lualine_z = {'location'},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
}
