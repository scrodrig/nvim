-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- -- then you need to set the option below.
-- ==============================
-- Configuración general de LazyVim
-- ==============================
vim.g.lazyvim_picker = "telescope"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

-- ==============================
-- Undo persistente
-- ==============================
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo//"

-- Desactivar undo solo en rutas profundas de tu proyecto (evita E828)
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  callback = function()
    local path = vim.fn.expand("%:p")
    if path:match("/Documents/dvag/dfs%-shopping%-cart/") then
      vim.opt_local.undofile = false
    end
  end,
})
