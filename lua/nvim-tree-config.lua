require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    -- float = {
    --   enable = true,
    --   open_win_config = {
    --     relative = "win",
    --     border = "rounded",
    --     width = 30,
    --     height = 30,
    --     row = 10,
    --     col = 10,
    --   },
    -- },
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


