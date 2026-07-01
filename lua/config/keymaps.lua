-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Search current buffer as popup (override LazyVim default ivy layout)

vim.keymap.set("n", "<leader>sb", function()
  Snacks.picker.lines({ layout = { preset = "telescope", reverse = false } })
end, { desc = "Buffer Lines" })

-- Navigate to preview window from keyboard (when preview is open)
vim.keymap.set("n", "<M-o>", function()
  vim.cmd("wincmd w")
end, { desc = "Jump to next window" })
