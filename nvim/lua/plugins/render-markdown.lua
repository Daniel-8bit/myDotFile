return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  opts = {
    render_modes = { "n", "c", "t" },

    anti_conceal = {
      enabled = true,
      above = 0,
      below = 0,
    },

    code = {
      enabled = true,
      style = "language",
      position = "left",
      border = "hide",
    },

    inline_code = {
      enabled = true,
      highlight = "RenderMarkdownInlineCode",
    },

    bullet = {
      icons = { "●", "○", "◆", "◇" },
    },
    pipe_table = {
      enabled = true,
      style = "full",
    },

    debounce = 100,

    max_file_size = 10.0,
  },
}