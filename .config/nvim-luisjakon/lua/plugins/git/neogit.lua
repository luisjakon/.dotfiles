return   {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    opts = {
        signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
        },
        integrations = {
        diffview = true,
        },
    },
    cmd = "Neogit",
}

