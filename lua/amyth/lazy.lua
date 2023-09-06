-- NOTE THAT LAZY REQUIRES YOU TO SET YOUR LEADER KEYMAPS BEFORE IT SO THAT YOUR KEYMAPS ARE LOADED PROPERLY
-- install lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)
-- next to setup lazy
-- require("lazy").setup(plugins, opts)
-- plugins: this should be a table or a string
--     table: a list with your Plugin Spec
--     string: a Lua module name that contains your Plugin Spec. See Structuring Your Plugins
-- opts: see Configuration (optional)

require("lazy").setup({
    { "junegunn/goyo.vim" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { "junegunn/limelight.vim" },
    { "simrat39/rust-tools.nvim" },
    { "xiyaowong/transparent.nvim" },
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {"kyazdani42/nvim-web-devicons"},
        tag = "nightly"
    }, {"lewis6991/gitsigns.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-nvim-lsp"}},
    {"hrsh7th/cmp-buffer"},
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
                        position = "right",
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
                copilot_node_command = 'node',
                server_opts_overrides = {}
            })
        end
    }, {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-nvim-lua"},
    {"hrsh7th/cmp-calc"},
    {"hrsh7th/cmp-emoji"},
    {"L3MON4D3/LuaSnip", dependencies = {"saadparwaiz1/cmp_luasnip"}},
    {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1
    }, "sbdchd/neoformat",
    { "b0o/schemastore.nvim" },
    { "amitchaudhari9121/karma.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "folke/tokyonight.nvim" },
    { "kdheepak/monochrome.nvim" },
    { "mjlbach/onedark.nvim" },
    {"catppuccin/nvim", name = "catppuccin"},
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },
    { "numToStr/Comment.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "mfussenegger/nvim-dap" },
    {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"}},
    {"ldelossa/nvim-dap-projects"},
    {"folke/neodev.nvim"}, {
        "dnlhc/glance.nvim",
        config = function() require("glance").setup({}) end
    }, "mfussenegger/nvim-lint", "nvim-lualine/lualine.nvim",
    { "lukas-reineke/indent-blankline.nvim" },
    { "tpope/vim-sleuth" },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {"nvim-lua/plenary.nvim"}
    },
    {
        "folke/trouble.nvim",
        dependencies = {"kyazdani42/nvim-web-devicons"},
        opts = {
            position = "bottom", 
            height = 10, 
            width = 50, 
            icons = true, 
            mode = "workspace_diagnostics", 
            severity = nil, 
            fold_open = "", 
            fold_closed = "", 
            group = true, 
            padding = true, 
            cycle_results = true, 
            action_keys = { 
                
                
                close = "q", 
                cancel = "<esc>", 
                refresh = "r", 
                jump = {"<cr>", "<tab>", "<2-leftmouse>"}, 
                open_split = {"<c-x>"}, 
                open_vsplit = {"<c-v>"}, 
                open_tab = {"<c-t>"}, 
                jump_close = {"o"}, 
                toggle_mode = "m", 
                switch_severity = "s", 
                toggle_preview = "P", 
                hover = "K", 
                preview = "p", 
                close_folds = {"zM", "zm"}, 
                open_folds = {"zR", "zr"}, 
                toggle_fold = {"zA", "za"}, 
                previous = "k", 
                next = "j" 
            },
            multiline = true, 
            indent_lines = true, 
            auto_open = false, 
            auto_close = false, 
            auto_preview = true, 
            auto_fold = false, 
            auto_jump = {"lsp_definitions"}, 
            signs = {
                
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = ""
            },
            use_diagnostic_signs = false
        }
    }, {
        "kylechui/nvim-surround",
        version = "*",
        config = function()
            require("nvim-surround").setup({
            })
        end
    }

})
