return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestArguments = function(defaultArguments, context)
            return defaultArguments
          end,
          jest_test_discovery = false,
          cwd = function(path)
            return vim.fn.getcwd()
          end,
          isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
        }),
        require("neotest-vitest"),
      },
    })
  end,
}
-- return {
--   "nvim-neotest/neotest",
--   dependencies = {
--     "nvim-neotest/neotest-jest",
--     "marilari88/neotest-vitest",
--   },
--   config = function()
--     local neotest = require("neotest")
--
--     neotest.setup({
--       adapters = {
--         require("neotest-jest")({
--           jestCommand = "npx jest --",
--           jest_test_discovery = true,
--           env = { CI = true },
--           cwd = function(path)
--             return vim.fn.getcwd()
--           end,
--         }),
--
--         -- Vitest solo si realmente lo necesitás
--         require("neotest-vitest")({
--           vitestCommand = "npx vitest",
--         }),
--       },
--     })
--   end,
-- }
