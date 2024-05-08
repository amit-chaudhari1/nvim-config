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

require("lazy").setup({
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            local elixir = require("elixir")
            local elixirls = require("elixir.elixirls")

            elixir.setup {
                nextls = {enable = true},
                credo = {},
                elixirls = {
                    enable = true,
                    settings = elixirls.settings {
                        dialyzerEnabled = false,
                        enableTestLenses = false
                    },
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>",
                                       {buffer = true, noremap = true})
                        vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>",
                                       {buffer = true, noremap = true})
                        vim.keymap.set("v", "<space>em",
                                       ":ElixirExpandMacro<cr>",
                                       {buffer = true, noremap = true})
                    end
                }
            }
        end,
        dependencies = {"nvim-lua/plenary.nvim"}
    }, {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},
    {"junegunn/goyo.vim"}, {"saadparwaiz1/cmp_luasnip"},
    {"rafamadriz/friendly-snippets"}, {"junegunn/limelight.vim"},
    {"simrat39/rust-tools.nvim"}, {"xiyaowong/transparent.nvim"}, {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            {"nvim-neotest/nvim-nio"}, {"kyazdani42/nvim-web-devicons"}, {
                "JMarkin/nvim-tree.lua-float-preview",
                lazy = true,
                opts = {
                    -- lines for scroll
                    scroll_lines = 20,
                    mapping = {
                        -- scroll down float buffer
                        down = {"<C-d>"},
                        -- scroll up float buffer
                        up = {"<C-e>", "<C-u>"},
                        -- enable/disable float windows
                        toggle = {"<C-x>"},
                        -- hooks if return false preview doesn't shown
                        hooks = {
                            pre_open = function(path)
                                -- if file > 5 MB not preview
                                return
                                    require("float-preview.utils").get_buf_size(
                                        path) < 5
                            end,
                            post_open = function(bufnr)
                                return true
                            end
                        }
                    }
                }
            }
        },
        tag = "nightly"
    }, {"lewis6991/gitsigns.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-nvim-lsp"}},
    {"hrsh7th/cmp-buffer"},
    {"zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter"},
    {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-nvim-lua"}, {"hrsh7th/cmp-calc"},
    {"hrsh7th/cmp-emoji"},
    {"L3MON4D3/LuaSnip", dependencies = {"saadparwaiz1/cmp_luasnip"}},
    {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1
    }, "sbdchd/neoformat", {"b0o/schemastore.nvim"},
    {"amitchaudhari9121/karma.nvim"}, {"ellisonleao/gruvbox.nvim"},
    {"rose-pine/neovim", name = "rose-pine"}, {"folke/tokyonight.nvim"},
    {"kdheepak/monochrome.nvim"}, {"mjlbach/onedark.nvim"},
    {"catppuccin/nvim", name = "catppuccin"}, {"tpope/vim-fugitive"},
    {"tpope/vim-rhubarb"}, {"numToStr/Comment.nvim"},
    {"nvim-treesitter/nvim-treesitter"},
    {"nvim-treesitter/nvim-treesitter-textobjects"}, {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"}, {"williamboman/mason-lspconfig.nvim"},
    {"mfussenegger/nvim-dap"},
    {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"}},
    {"ldelossa/nvim-dap-projects"}, {"folke/neodev.nvim"},
    {"dnlhc/glance.nvim", config = function() require("glance").setup({}) end},
    {"mfussenegger/nvim-lint"}, {"nvim-lualine/lualine.nvim"},
    {"lukas-reineke/indent-blankline.nvim"}, {"tpope/vim-sleuth"},
    {"kdheepak/lazygit.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {"folke/trouble.nvim", dependencies = {"kyazdani42/nvim-web-devicons"}}, {
        "kylechui/nvim-surround",
        version = "*",
        config = function() require("nvim-surround").setup({}) end
    }

})
