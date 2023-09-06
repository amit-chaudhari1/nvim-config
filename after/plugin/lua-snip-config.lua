local ls = require("luasnip")


-- this is where it grabs the snippets from.
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/"})

ls.config.set_config({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[require("luasnip.util.types").choiceNode] = {
			active = { virt_text = { { "● ", "GruvboxOrange" } } }
		}
	}
})

local setup = require("lazy").setup({
   "junegunn/goyo.vim", -- Distraction-free writing in Vim
   "saadparwaiz1/cmp_luasnip",
   "rafamadriz/friendly-snippets",
   "junegunn/limelight.vim", -- Hyperfocus-writing in Vim
   "simrat39/rust-tools.nvim", -- rust tools
   "xiyaowong/transparent.nvim", -- transparent
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {"kyazdani42/nvim-web-devicons"},
        tag = "nightly"
    },
    {"lewis6991/gitsigns.nvim", dependencies = {"nvim-lua/plenary.nvim"}}, -- Add git related info in the signs columns and popups
    {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-nvim-lsp"}}, -- Autocompletion
    {"hrsh7th/cmp-buffer"}, -- Autocompletion
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "right", -- | top | left | right
                        ratio = 0.4
                    }
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 35,
                    keymap = {
                        accept = "<C-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>"
                    }
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false
                },
                copilot_node_command = 'node', -- Node.js version must be > 16.x
                server_opts_overrides = {}
            })
        end
    },
    {"hrsh7th/cmp-path"},-- Autocompletion
    {"hrsh7th/cmp-nvim-lua"}, -- Autocompletion
    {"hrsh7th/cmp-calc"}, -- Autocompletion
    {"hrsh7th/cmp-emoji"}, -- Autocompletion
    {"L3MON4D3/LuaSnip", dependencies = {"saadparwaiz1/cmp_luasnip"}}, -- Snippet Engine and Snippet Expansion
    {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"}, -- A Lua module for asynchronous programming using coroutines
    {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}}, -- Fuzzy Finder (files, lsp, etc)  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1
    },
    "sbdchd/neoformat", -- prettier
    "b0o/schemastore.nvim", -- provide access to JSON schemastore
    "amitchaudhari9121/karma.nvim", -- colorscheme
    "ellisonleao/gruvbox.nvim", -- colorscheme
    "folke/tokyonight.nvim", -- colorscheme
    "kdheepak/monochrome.nvim", -- colorscheme
    "mjlbach/onedark.nvim", -- colorscheme
    {"catppuccin/nvim", as = "catppuccin"}, -- colorscheme
    "tpope/vim-fugitive", -- Git commands in nvim
    "tpope/vim-rhubarb", -- Fugitive-companion to interact with github
    "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
    "nvim-treesitter/nvim-treesitter", -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for treesitter
    "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
    "williamboman/mason.nvim", -- mason.nvim manages LSP servers, DAP servers, linters, and formatters through a single interface.
    "williamboman/mason-lspconfig.nvim", -- mason-lspconfig.nvim is a plugin for mason.nvim that provides a collection of LSP configurations.
    "mfussenegger/nvim-dap", -- Debug Adapter Protocol client implementation for Neovim
    {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"}}, -- UI for nvim-dap
    {"ldelossa/nvim-dap-projects"}, -- A plugin to manage projects for nvim-dap
    {"folke/neodev.nvim"},
    {
        "dnlhc/glance.nvim", -- glance.nvim is a plugin for Neovim that displays the context of the currently visible buffer contents in the statusline.
        config = function() require("glance").setup({}) end
    },
    "mfussenegger/nvim-lint",
    "nvim-lualine/lualine.nvim", -- Fancier statusline
    "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
        {
            "kdheepak/lazygit.nvim",
            -- optional for floating window border decoration
            dependencies = {"nvim-lua/plenary.nvim"}
        }, -- pops out lazygit
    {
        "folke/trouble.nvim",
        dependencies = {"kyazdani42/nvim-web-devicons"},
        opts = {
            position = "bottom", -- position of the list can be: bottom, top, left, right
            height = 10, -- height of the trouble list when position is top or bottom
            width = 50, -- width of the list when position is left or right
            icons = true, -- use devicons for filenames
            mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
            fold_open = "", -- icon used for open folds
            fold_closed = "", -- icon used for closed folds
            group = true, -- group results by file
            padding = true, -- add an extra new line on top of the list
            cycle_results = true, -- cycle item list when reaching beginning or end of list
            action_keys = { -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping, for example:
                -- close = {},
                close = "q", -- close the list
                cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r", -- manually refresh
                jump = {"<cr>", "<tab>", "<2-leftmouse>"}, -- jump to the diagnostic or open / close folds
                open_split = {"<c-x>"}, -- open buffer in new split
                open_vsplit = {"<c-v>"}, -- open buffer in new vsplit
                open_tab = {"<c-t>"}, -- open buffer in new tab
                jump_close = {"o"}, -- jump to the diagnostic and close the list
                toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
                toggle_preview = "P", -- toggle auto_preview
                hover = "K", -- opens a small popup with the full multiline message
                preview = "p", -- preview the diagnostic location
                close_folds = {"zM", "zm"}, -- close all folds
                open_folds = {"zR", "zr"}, -- open all folds
                toggle_fold = {"zA", "za"}, -- toggle fold of current file
                previous = "k", -- previous item
                next = "j" -- next item
            },
            multiline = true, -- render multi-line messages
            indent_lines = true, -- add an indent guide below the fold icons
            auto_open = false, -- automatically open the list when you have diagnostics
            auto_close = false, -- automatically close the list when you have no diagnostics
            auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
            auto_fold = false, -- automatically fold a file trouble list at creation
            auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
            signs = {
                -- icons / text used for a diagnostic
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = ""
            },
            use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
        }
    },
    {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

})

return setup
