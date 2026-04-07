return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    {
      "<leader>gv",
      function()
        if next(require("diffview.lib").views) ~= nil then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen HEAD~1")
        end
      end,
      desc = "Toggle diff last commit",
    },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
  },
  opts = {},
}
