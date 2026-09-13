return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      direction = "float",
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>rc", function()
      vim.cmd("2TermExec cmd='gcc % -o %< -g' dir='%:p:h'")
    end, vim.tbl_extend("force", opts, { desc = "Compile current file" }))

    map("n", "<leader>rr", function()
      vim.cmd("2TermExec cmd='./%<' dir='%:p:h'")
    end, vim.tbl_extend("force", opts, { desc = "Run current program" }))
  end,
}
