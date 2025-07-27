return {
  "sindrets/diffview.nvim",
  opts = {
    keymaps = {
      file_panel = {
        {
          "n", "cc",
          function()
            vim.ui.input({ prompt = "Commit message: " }, function(msg)
              if not msg then return end
              local results = vim.system({ "git", "commit", "-m", msg }, { text = true }):wait()

              if results.code ~= 0 then
                vim.notify(
                  "Commit failed with the message: \n"
                    .. vim.trim(results.stdout .. "\n" .. results.stderr),
                  vim.log.levels.ERROR,
                  { title = "Commit" }
                )
              else
                vim.notify(results.stdout, vim.log.levels.INFO, { title = "Commit" })
              end
            end)
          end,
        },
        {
          "n", "cp",
          function ()
            vim.ui.input({prompt = "Push commits: y/n"}, function (ans)
              if not ans then return end
              if ans == "y" or ans == "Y" then
                vim.notify("Pushhhhh...", vim.log.levels.INFO, {title = "Push"})
                local results = vim.system({"git", "push"}, {text = true}):wait()
                if results.code ~= 0 then
                  vim.notify(
                    "Push failed with the message: \n"
                      .. vim.trim(results.stdout .. "\n" .. results.stderr),
                    vim.log.levels.ERROR,
                    {title = "Push"}
                  )
                else
                  vim.notify("Commits pushed succesfully", vim.log.levels.INFO, {title = "Push"})
                end
              end
            end)
          end
        },
      },
    }
  },
  lazy = false
}
