return {
  "Redoxahmii/json-to-types.nvim",
  build = "sh install.sh pnpm", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
  ft = "json",
  keys = {
    {
      "<leader>cU",
      "<CMD>ConvertJSONtoLang typescript<CR>",
      desc = "Convert JSON to TS",
    },
    {
      "<leader>cJ",
      "<CMD>ConvertJSONtoLang typescript<CR>",
      desc = "Convert JSON to JS",
    },
  },
}
