-- telescope Config
require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    layout_config = {
      width = 0.85,
      -- preview_cutoff = 120,
      -- horizontal = {
      --   preview_width = function(_, cols, _)
      --     if cols < 120 then
      --       return math.floor(cols * 0.5)
      --     end
      --     return math.floor(cols * 0.6)
      --   end,
      --   mirror = false,
      -- },
      -- vertical = { mirror = false },
    },
    -- config_key = value,
    mappings = {

    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

