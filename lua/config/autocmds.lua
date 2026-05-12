-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Notify on file save (batched for multiple files with list)
local save_count = 0
local save_timer = nil
local saved_files = {}
local timer_active = false

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("save_notify", { clear = true }),
  callback = function(event)
    local filename = vim.fn.fnamemodify(event.file, ":t")
    save_count = save_count + 1
    table.insert(saved_files, filename)
    
    -- Only start timer if not already active
    if not timer_active then
      timer_active = true
      
      -- Set new timer to show notification after 1000ms of silence
      save_timer = vim.fn.timer_start(1000, function()
        local message = "✅ " .. save_count .. " files saved:\n"
        
        -- Add each filename with a dash
        for i, file in ipairs(saved_files) do
          message = message .. "  - " .. file
          if i < #saved_files then
            message = message .. "\n"
          end
        end
        
        vim.schedule(function()
          vim.notify(message, vim.log.levels.INFO, {
            title = "Files Saved",
            timeout = 2000,
          })
        end)
        
        -- Reset everything
        save_count = 0
        saved_files = {}
        save_timer = nil
        timer_active = false
      end)
    end
  end,
})
