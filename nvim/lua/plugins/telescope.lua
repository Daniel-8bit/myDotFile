return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local telescope = require("telescope")

    local function absolute_path(path)
      return vim.fn.fnamemodify(path, ":p")
    end

    local function find_open_file(path)
      local target = absolute_path(path)
      for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
          local buffer = vim.api.nvim_win_get_buf(win)
          local name = vim.api.nvim_buf_get_name(buffer)
          if name ~= "" and absolute_path(name) == target then
            return tabpage, win
          end
        end
      end
    end

    local function select_file(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      if not selection then
        return
      end

      local path = selection.path or selection.filename or selection.value
      actions.close(prompt_bufnr)

      local tabpage, win = find_open_file(path)
      if tabpage and win then
        vim.api.nvim_set_current_tabpage(tabpage)
        vim.api.nvim_set_current_win(win)
      else
        vim.cmd("tabedit " .. vim.fn.fnameescape(path))
      end
    end

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<CR>"] = select_file,
          },
          n = {
            ["<CR>"] = select_file,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
