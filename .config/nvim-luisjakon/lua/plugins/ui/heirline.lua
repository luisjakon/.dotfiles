return {
    -- heirline-components.nvim [ui components]
    -- https://github.com/Zeioth/heirline-components.nvim
    -- Collection of components to use on your heirline config.
    {
        "zeioth/heirline-components.nvim",
        opts = {
            icons = require("config.ui.nerd_font"),
        },
    },

    --  heirline [ui components]
    --  https://github.com/rebelot/heirline.nvim
    --  Use it to customize the components of your user interface,
    --  Including tabline, winbar, statuscolumn, statusline.
    --  Be aware some components are positional. Read heirline documentation.
    {
        "rebelot/heirline.nvim",
        dependencies = { "zeioth/heirline-components.nvim" },
        event = "VeryLazy",
        -- event = "User BaseDefered",
        opts = require("config.ui.heirline").opts,
        config = function(_, opts)
            local heirline = require("heirline")
            local heirline_components = require("heirline-components.all")
            local heirline_config = require("config.ui.heirline")

            -- Setup
            heirline_components.init.subscribe_to_events()
            heirline.load_colors(heirline_config.colors())
            heirline.setup(opts)
        end,
    },
}
