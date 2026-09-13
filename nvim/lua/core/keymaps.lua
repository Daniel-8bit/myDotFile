vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>nh", "<cmd>nohlsearch<CR>", vim.tbl_extend("force", opts, {
  desc = "Clear search highlight",
}))
map("n", "<leader>tn", "<cmd>tabnew<CR>", vim.tbl_extend("force", opts, {
  desc = "New tab",
}))
map("n", "<leader>tc", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, {
  desc = "Close tab",
}))
map("n", "<leader>to", "<cmd>tabonly<CR>", vim.tbl_extend("force", opts, {
  desc = "Keep only current tab",
}))
map("n", "<leader>t]", "<cmd>tabnext<CR>", vim.tbl_extend("force", opts, {
  desc = "Next tab",
}))
map("n", "<leader>t[", "<cmd>tabprev<CR>", vim.tbl_extend("force", opts, {
  desc = "Previous tab",
}))

local function focus_file_tree()
  local api = require("nvim-tree.api")
  if not api.tree.is_visible() then
    api.tree.open({ focus = true })
  elseif vim.bo.filetype == "NvimTree" then
    vim.cmd("wincmd p")
  else
    api.tree.focus()
  end
end

local function toggle_file_tree()
  require("nvim-tree.api").tree.toggle({ focus = true })
end

map("n", "<leader>e", focus_file_tree, vim.tbl_extend("force", opts, {
  desc = "Focus file tree or editor",
}))
map("n", "<M-e>", toggle_file_tree, vim.tbl_extend("force", opts, {
  desc = "Toggle file tree",
}))

local telescope = function(method)
  return function()
    require("telescope.builtin")[method]()
  end
end

map("n", "<leader>ff", telescope("find_files"), { desc = "Find files" })
map("n", "<leader>fg", telescope("live_grep"), { desc = "Live grep (regex)" })
map("n", "<leader>fb", telescope("buffers"), { desc = "Find buffers" })
map("n", "<leader>fh", telescope("help_tags"), { desc = "Help tags" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local lsp_opts = vim.tbl_extend("force", opts, {
      buffer = event.buf,
    })

    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", lsp_opts, {
      desc = "Go to definition",
    }))
    map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", lsp_opts, {
      desc = "Find references",
    }))
    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", lsp_opts, {
      desc = "Show hover documentation",
    }))
    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", lsp_opts, {
      desc = "Rename symbol",
    }))
    map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", lsp_opts, {
      desc = "Code action",
    }))
    map("n", "<leader>ci", vim.lsp.buf.incoming_calls, vim.tbl_extend("force", lsp_opts, {
      desc = "Incoming calls",
    }))
    map("n", "<leader>co", vim.lsp.buf.outgoing_calls, vim.tbl_extend("force", lsp_opts, {
      desc = "Outgoing calls",
    }))
  end,
})