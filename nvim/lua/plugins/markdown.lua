return {
  "tadmccorkle/markdown.nvim",
  ft = "markdown",
  opts = {
    toc = {
      markers = { "-", ".", ")" },
    },
    on_attach = function(bufnr)
      local map = vim.keymap.set
      local opts = { buffer = bufnr, desc = "Markdown: ..." }

      map({ "n", "i" }, "<M-l><M-o>", "<Cmd>MDListItemBelow<CR>", opts)
      map({ "n", "i" }, "<M-L><M-O>", "<Cmd>MDListItemAbove<CR>", opts)
      map("n", "<M-c>", "<Cmd>MDTaskToggle<CR>", opts)
      map("x", "<M-c>", ":MDTaskToggle<CR>", opts)
    end,
  },
}
