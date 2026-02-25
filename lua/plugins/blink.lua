return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.confirm()
          end
        end,
        "snippet_forward",
        "fallback",
      },

      ["<S-Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_prev()
          end
        end,
        "snippet_backward",
        "fallback",
      },
    },

    completion = {
      trigger = {
        show_on_keyword = true,
        show_on_trigger_character = true,
      },
    },

    sources = {
      default = { "lsp", "copilot", "path", "snippets", "buffer" },
      -- providers = {
      --   copilot = {
      --     score_offset = -100,
      --   },
      -- },
    },
  },
}
