return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    local languages = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "rust",
      "bash",
      "cmake",
      "yaml",
      "json",
      "markdown",
      "markdown_inline",
    }
    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}