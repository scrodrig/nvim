return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      local cwd = vim.fn.getcwd() -- Cachear el cwd al inicio

      require("neotest").setup({
        adapters = {
          require("neotest-vitest")({
            is_test_file = function(file_path)
              return string.match(file_path, "/packages/")
                and (string.match(file_path, "%.spec%.") or string.match(file_path, "%.test%."))
            end,
          }),
          require("neotest-jest")({
            jestCommand = "npx jest --runInBand",
            is_test_file = function(file_path)
              if string.match(file_path, "/packages/") then
                return false
              end
              return string.match(file_path, "%.spec%.") or string.match(file_path, "%.test%.")
            end,
            jestConfigFile = function(file)
              if string.match(file, "/apps/wealth%-planning%-api/") then
                return cwd .. "/apps/wealth-planning-api/jest.config.cjs"
              end
              local root_jest = cwd .. "/jest.config.js"
              if vim.loop.fs_stat(root_jest) then
                return root_jest
              end
              return nil
            end,
            cwd = function(file)
              if string.match(file, "/apps/wealth%-planning%-api/") then
                return cwd .. "/apps/wealth-planning-api"
              end
              return cwd
            end,
            env = { CI = true },
          }),
        },
      })
    end,
  },
}
