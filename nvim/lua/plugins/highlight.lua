return {
  "Mr-LLLLL/interestingwords.nvim",
  event = "VeryLazy",
  config = function()
    require("interestingwords").setup({
        color_key = "<leader>h",
        cancel_color_key = "<leader>H",
    })
  end,
}
