local HEIGHT_RATIO = 0.8 -- You can change this

local WIDTH_RATIO = 0.5  -- You can change this too

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)

        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
  },
  renderer = {
    group_empty = true,
    add_trailing = true,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})


-- local function on_attach(bufnr)
--     local api = require("nvim-tree.api")
--     local FloatPreview = require("float-preview")
--
--     FloatPreview.attach_nvimtree(bufnr)
--     local float_close_wrap = FloatPreview.close_wrap
--
--     --- There are keymaps must to wrap for correct work
--     -- ...
--     vim.keymap.set("n", "<C-t>", float_close_wrap(api.node.open.tab), opts("Open: New Tab"))
--     vim.keymap.set("n", "<C-v>", float_close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
--     vim.keymap.set("n", "<C-s>", float_close_wrap(api.node.open.horizontal), opts("Open: Horizontal Split"))
--     vim.keymap.set("n", "<CR>", float_close_wrap(api.node.open.edit), opts("Open"))
--     vim.keymap.set("n", "<Tab>", float_close_wrap(api.node.open.preview), opts("Open"))
--     vim.keymap.set("n", "o", float_close_wrap(api.node.open.edit), opts("Open"))
--     vim.keymap.set("n", "O", float_close_wrap(api.node.open.no_window_picker), opts("Open: No Window Picker"))
--     vim.keymap.set("n", "q", float_close_wrap(api.tree.close), opts("Close"))
--     vim.keymap.set("n", "a", float_close_wrap(api.fs.create), opts("Create"))
--     vim.keymap.set("n", "d", float_close_wrap(api.fs.remove), opts("Delete"))
--     vim.keymap.set("n", "r", float_close_wrap(api.fs.rename), opts("Rename"))
-- end
