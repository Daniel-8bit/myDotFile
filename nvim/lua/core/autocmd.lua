local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("FileTypeIndent", { clear = true })

-- C/C++：4 空格缩进
autocmd("FileType", {
  group = augroup,
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Go：强制使用 Tab，且宽度为 4（Go 官方约定）
autocmd("FileType", {
  group = augroup,
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false -- Go 官方要求用 Tab
  end,
})

-- Python：4 空格缩进（PEP 8 约定）
autocmd("FileType", {
  group = augroup,
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Makefile：必须使用 Tab
autocmd("FileType", {
  group = augroup,
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- YAML：2 空格缩进
autocmd("FileType", {
  group = augroup,
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
-- Lua: 2 空格缩进
autocmd("FileType", {
  group = augroup,
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.cindent = false
    vim.opt_local.indentexpr = ""
    vim.opt_local.smartindent = false
  end,
})
-- Markdown：2 空格缩进（可自行调整）
autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
