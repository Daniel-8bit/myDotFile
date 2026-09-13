return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "rust_analyzer" },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders=true",
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("compile_commands.json")(fname)
        end,
        -- 可选：禁止单文件模式，强制要求项目上下文
        single_file_support = false,
      })
      vim.lsp.enable("clangd")
      -- 配置 ctags_lsp 服务器, 通过 ctags-lsp 提供对 C/C++ 的支持
      vim.lsp.config("ctags_lsp", {
        cmd = { "ctags-lsp" },
        filetypes = { "c", "cpp" },
        root_dir = vim.uv.cwd(),
      })
      vim.lsp.enable("ctags_lsp")

      vim.lsp.config("rust_analyzer", {
        cmd = { "rust-analyzer"},
        filetypes = { "rust" },
        root_dir = vim.fs.root(0, { "Cargo.toml"}),
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            check = {
                command = "clippy",
            },
          },
        },
     })
    vim.lsp.enable("rust_analyzer")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
