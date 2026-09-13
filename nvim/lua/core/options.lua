local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.statuscolumn = "%l %s%C"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = false
opt.smartindent = true
opt.wrap = false
opt.foldmethod = "manual"
opt.foldenable = false

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.list = true
opt.listchars = {
  lead = "·",
  tab = "->",
  trail = "·",
}
opt.termguicolors = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
  if vim.fn.executable("wl-copy") == 1 then
    vim.g.clipboard = {
      name = "wl-clipboard (wsl)",
      copy = {
        ["+"] = "wl-copy --foreground --type text/plain",
        ["*"] = "wl-copy --foreground --primary --type text/plain",
      },
      paste = {
        ["+"] = function()
          return vim.fn.systemlist('wl-paste --no-newline | sed -e "s/\\r$//"', { "" }, 1)
        end,
        ["*"] = function()
          return vim.fn.systemlist('wl-paste --primary --no-newline | sed -e "s/\\r$//"', { "" }, 1)
        end,
      },
      cache_enabled = true,
    }
  else
    vim.notify("wl-clipboard not found, clipboard integration won't work", vim.log.levels.WARN)
  end
end
