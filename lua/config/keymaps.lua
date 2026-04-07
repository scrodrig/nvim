-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Search current buffer as popup (override LazyVim default ivy layout)

vim.keymap.set("n", "<leader>sb", function()
  Snacks.picker.lines({ layout = { preset = "telescope", reverse = false } })
end, { desc = "Buffer Lines" })
