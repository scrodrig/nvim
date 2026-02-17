return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Add this to override or define the scroll actions
    {
      "<C-u>",
      "<cmd>lua require('telescope.actions').preview_scrolling_up(vim.api.nvim_get_current_win())<cr>",
      ft = "TelescopePrompt",
    },
    {
      "<C-d>",
      "<cmd>lua require('telescope.actions').preview_scrolling_down(vim.api.nvim_get_current_win())<cr>",
      ft = "TelescopePrompt",
    },
  },
  opts = function(_, opts)
    -- Ensure default mappings are set
    local actions = require("telescope.actions")
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      mappings = {
        i = {
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,
        },
      },
    })
  end,
}
