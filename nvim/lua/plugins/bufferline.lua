return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        name_formatter = function(buf)
          if vim.bo[buf.bufnr].filetype == "NvimTree" then
            return ""
          end
          return vim.fn.fnamemodify(buf.name, ":t")
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
    vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
    end
  end,
}
