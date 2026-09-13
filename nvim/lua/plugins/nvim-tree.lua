return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local api = require("nvim-tree.api")

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = false,
            git_ignored = false,
        },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = { enable = false },
        },
      },
      on_attach = function(bufnr)
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<CR>", api.node.open.edit, {
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
          desc = "Open in editor",
        })
      end,
    })
  end,
}
