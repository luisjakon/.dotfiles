return {
    "akinsho/toggleterm.nvim",
    config = function()
        -- local colors = require "colors.delta.palette.colors"
        -- colors.generate() -- Pass `true` to enable mirage

        local toggleterm = require("toggleterm")
        toggleterm.setup({
            shade_terminals = false,
            highlights = {
                Normal = {
                    guifg = "#e0e0e0",
                    -- guibg = colors.bg, -- colors.bg_dark,
                    -- guibg = "#000000", -- colors.bg_dark,
                    guibg = "#0f0f0f", -- colors.bg_dark,
                },
                SignColumn = { guibg = "NONE" },
                FoldColumn = { guibg = "NONE" },
                LineNr = { guibg = "NONE" },
            },
        })

        -- Fix toggleterm
        vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter", "BufEnter" }, {
            pattern = { "term://*", "toggleterm" },
            callback = function()
                vim.cmd(
                    [[ setlocal listchars= | setlocal nocursorline | setlocal nocursorcolumn | setlocal nonu | setlocal norelativenumber ]]
                )
                vim.cmd([[ startinsert ]])
            end,
        })
    end,
}
