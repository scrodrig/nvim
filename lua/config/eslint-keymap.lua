-- Lista de filetypes donde queremos que funcione
local filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }

for _, ft in ipairs(filetypes) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      -- Map <leader>ce -> LspEslintFixAll solo para este buffer
      vim.keymap.set("n", "<leader>ce", function()
        -- Verifica si hay un cliente ESLint activo en este buffer
        local clients = vim.lsp.get_active_clients({ name = "eslint" })
        for _, client in pairs(clients) do
          if client.attached_buffers[vim.api.nvim_get_current_buf()] then
            vim.cmd("LspEslintFixAll")
            return
          end
        end
        print("No ESLint LSP active in this buffer")
      end, { buffer = true, desc = "Run ESLint Fix All" })
    end,
  })
end
