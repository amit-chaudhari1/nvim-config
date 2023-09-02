local install_path = vim.fn.stdpath("data") ..
                         "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

-- install packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " ..
                       install_path)
    vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
    -- writing 
    use("junegunn/goyo.vim") -- Distraction-free writing in Vim
    use("junegunn/limelight.vim") -- Hyperfocus-writing in Vim
    use('simrat39/rust-tools.nvim') -- rust tools
    use("xiyaowong/transparent.nvim") -- transparent
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons"},
        tag = "nightly"
    })
    use({"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}) -- Add git related info in the signs columns and popups
    use({"hrsh7th/nvim-cmp", requires = {"hrsh7th/cmp-nvim-lsp"}}) -- Autocompletion
    use({"hrsh7th/cmp-buffer"}) -- Autocompletion
    use({"github/copilot.vim"}) -- Autocompletion
    use({"hrsh7th/cmp-path"})   -- Autocompletion
    use({"hrsh7th/cmp-nvim-lua"}) -- Autocompletion
    use({"hrsh7th/cmp-calc"}) -- Autocompletion
    use({"hrsh7th/cmp-emoji"}) -- Autocompletion
    use({"L3MON4D3/LuaSnip", requires = {"saadparwaiz1/cmp_luasnip"}}) -- Snippet Engine and Snippet Expansion
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}) -- A Lua module for asynchronous programming using coroutines
    use({"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}) -- Fuzzy Finder (files, lsp, etc)  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = vim.fn.executable("make") == 1
    })
    use("sbdchd/neoformat") -- prettier
    use("b0o/schemastore.nvim") -- provide access to JSON schemastore
    use("amitchaudhari9121/karma.nvim") -- colorscheme
    use("ellisonleao/gruvbox.nvim") -- colorscheme
    use("folke/tokyonight.nvim") -- colorscheme
    use("kdheepak/monochrome.nvim") -- colorscheme
    use("mjlbach/onedark.nvim") -- colorscheme
    use({"catppuccin/nvim", as = "catppuccin"}) -- colorscheme
    use("wbthomason/packer.nvim") -- Package manager
    use("tpope/vim-fugitive") -- Git commands in nvim
    use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
    use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
    use("nvim-treesitter/nvim-treesitter") -- Highlight, edit, and navigate code
    use("nvim-treesitter/nvim-treesitter-textobjects") -- Additional textobjects for treesitter
    use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
    use("williamboman/mason.nvim") -- mason.nvim manages LSP servers, DAP servers, linters, and formatters through a single interface.
    use("williamboman/mason-lspconfig.nvim") -- mason-lspconfig.nvim is a plugin for mason.nvim that provides a collection of LSP configurations.
    use("mfussenegger/nvim-dap") -- Debug Adapter Protocol client implementation for Neovim
    use({"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}) -- UI for nvim-dap
    use({"ldelossa/nvim-dap-projects"}) -- A plugin to manage projects for nvim-dap
    use({"folke/neodev.nvim"})
    use({ "dnlhc/glance.nvim", -- glance.nvim is a plugin for Neovim that displays the context of the currently visible buffer contents in the statusline.
        config = function() require("glance").setup({}) end
    })
    use("mfussenegger/nvim-lint")
    use("nvim-lualine/lualine.nvim") -- Fancier statusline
    use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
    use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {"nvim-lua/plenary.nvim"}
    }) -- pops out lazygit
    use({
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
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
    })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    if is_bootstrap then require("packer").sync() end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
-- This did not work haha
if is_bootstrap then
    print("==================================")
    print("    Plugins are being installed")
    print("    Wait until Packer completes,")
    print("       then restart nvim")
    print("==================================")
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerCompile",
    group = packer_group,
    pattern = vim.fn.expand("$MYVIMRC")
})
