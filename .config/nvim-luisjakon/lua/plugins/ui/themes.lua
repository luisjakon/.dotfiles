return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "github_light",
        },
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        -- Add in any other configuration;
        --   event = foo,
        --   config = bar
        --   end,
    },
    {
        "malbernaz/monokai.nvim",
        config = function()
            require("monokai").setup({
                custom_hlgroups = {
                    FlashCurrent = { fg = "#FF0000", bg = "#FF0000" },
                    FlashLabel = { fg = "#FBF3CB", bg = "#FF007C" },
                    FlashMatch = { fg = "#000000", bg = "#000000" },
                    FoldColumn = { bg = "None" },
                },
            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "frappe",
            transparent_background = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                notify = true,
                mini = true,
            },
        },
    },
    {
        "projekt0n/github-nvim-theme",
        -- enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({
                options = {
                    terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    -- terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    darken = { -- Darken floating windows and sidebar-like windows
                        floats = true,
                        sidebars = {
                            enabled = true,
                            -- list = { "neo-tree", "terminal", "toggleterm" }, -- Apply dark background to specific windows
                        },
                    },
                    styles = {
                        -- comments = "italic",
                        -- keywords = "bold",
                        -- types = "italic,bold",
                    },
                },
                modules = {
                    cmp = true,
                    dapui = true,
                    diagnostic = true,
                    gitsigns = true,
                    indent_blankline = true,
                    lsp_trouble = true,
                    mini = true,
                    native_lsp = true,
                    neotree = true,
                    notify = true,
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                    whichkey = true,
                },
                specs = {
                    all = {},
                    github_light = {
                        git = {
                            added = "#159bbe",
                            changed = "#e5510b",
                            removed = "#da0040",
                        },
                    },
                },
                groups = {
                    all = {
                        AlphaButtons = { link = "Normal" },
                        AlphaShortcut = { link = "Identifier" },
                        AlphaHeader = { link = "Title" },
                        AlphaFooter = { link = "NonText" },
                        -- StatusLineNC = { bg = "#00ff8b", fg = "#aaff8b", sp = "#00222b", style = "underline" },
                        -- StatusLineNC = { bg = "#00ff8b", fg = "#aaff8b", sp = "#00222b", style = "underline" },
                    },
                    github_light = {
                        ["@namespace"] = { fg = "#333333" },
                        ["@lsp.typemod.property.declaration"] = { fg = "#0a59b2" },
                        ["@lsp.typemod.property.public"] = { fg = "#0a59b2" },
                        StatusLine = { fg = "#f5f6fa", bg = "#14141f" },
                        -- DiagnosticHint = { fg = "Special" },
                        DiagnosticInfo = { fg = "#159bbe" },
                        DiagnosticWarn = { fg = "#e5510b" },
                        DiagnosticError = { fg = "#da0040" },
                        DiagnosticOk = { fg = "#296b48" },
                        NeoTreeGitUntracked = { fg = "#999999" },
                        NeoTreeGitAdded = { fg = "#0a59b2" },
                        NeoTreeGitModified = { fg = "#e5510b" },
                        NeoTreeGitDeleted = { fg = "#da0040" },
                        GitSignsAdd = { fg = "#159bbe" },
                        GitSignsChange = { fg = "#e5510b" },
                        GitSignsDelete = { fg = "#da0040" },
                        Function = { fg = "#6639ba" },
                        Search = { bg = "#cee1f8" },
                        Type = { gui = "NONE", cterm = "NONE" },
                    },
                },
            })

            vim.cmd([[ hi @namespace guifg='#333333']])
            vim.cmd([[ hi @lsp.typemod.property.declaration guifg='#0a59b2']])
            vim.cmd([[ hi @lsp.typemod.property.public guifg='#0a59b2']])
            vim.cmd([[ hi Type gui=NONE cterm=NONE ]])
        end,
    },
}
