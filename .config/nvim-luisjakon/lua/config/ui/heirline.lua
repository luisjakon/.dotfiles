local M = {}

function M.opts()
    local lib = require("heirline-components.all")
    return {
        opts = {
            disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
                local is_disabled = not require("heirline-components.buffer").is_valid(args.buf)
                    or lib.condition.buffer_matches({
                        buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                        filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
                    }, args.buf)
                return is_disabled
            end,
        },
        tabline = { -- UI upper bar
            lib.component.tabline_conditional_padding(),
            lib.component.tabline_buffers(),
            lib.component.fill({ hl = { bg = "tabline_bg" } }),
            lib.component.tabline_tabpages(),
        },
        winbar = { -- UI breadcrumbs bar
            init = function(self)
                self.bufnr = vim.api.nvim_get_current_buf()
            end,
            fallthrough = false,
            -- Winbar for terminal, neotree, and aerial.
            {
                condition = function()
                    return not lib.condition.is_active()
                end,
                {
                    lib.component.neotree(),
                    lib.component.compiler_play(),
                    lib.component.fill(),
                    lib.component.compiler_build_type(),
                    lib.component.compiler_redo(),
                    lib.component.aerial(),
                },
            },
            -- Regular winbar
            {
                lib.component.neotree(),
                lib.component.compiler_play(),
                lib.component.fill(),
                lib.component.breadcrumbs(),
                lib.component.fill(),
                lib.component.compiler_redo(),
                lib.component.aerial(),
            },
        },
        statuscolumn = { -- UI left column
            init = function(self)
                self.bufnr = vim.api.nvim_get_current_buf()
            end,
            lib.component.signcolumn(),
            lib.component.numbercolumn(),
            lib.component.foldcolumn(),
        } or nil,
        statusline = { -- UI statusbar
            hl = { fg = "fg", bg = "bg" },
            lib.component.mode(),
            lib.component.git_branch(),
            lib.component.git_diff(),
            lib.component.diagnostics(),
            lib.component.fill(),
            lib.component.cmd_info(),
            lib.component.fill(),
            lib.component.lsp(),
            lib.component.compiler_state(),
            lib.component.virtual_env(),
            lib.component.treesitter(),
            lib.component.file_info(),
            lib.component.nav(),
            lib.component.mode({ surround = { separator = "right" } }),
        },
    }
end

function M.colors()
    local colors = require("heirline-components.all").hl.get_colors()

    local fg_color = "#f5f6fa"
    local bg_color = "#14141f"
    -- local bg_color = "#21242c"

    colors.fg = fg_color
    colors.bg = bg_color

    colors.section_fg = fg_color
    colors.section_bg = bg_color

    colors.normal = "#4CAF50"
    colors.insert = "#009688"
    colors.visual = "#3F51B5"
    colors.replace = "#E91E63"
    colors.command = "#FFC107"
    colors.terminal = "#795548"

    colors.git_branch_fg = "#03A9F4"
    colors.git_diff_fg = "#03A9F4"
    -- colors.diagnostics_bg = bg_color
    colors.word_file_fg = "#00BCD4"
    colors.treesitter_fg = colors.normal
    colors.lsp_fg = fg_color
    colors.file_info_fg = "#00BCD4"
    colors.nav_fg = fg_color

    colors.git_branch_bg = bg_color
    colors.git_diff_bg = bg_color
    colors.diagnostics_bg = bg_color
    colors.word_file_bg = bg_color
    colors.treesitter_bg = bg_color
    colors.lsp_bg = bg_color
    colors.file_info_bg = bg_color
    colors.nav_bg = bg_color

    for _, section in ipairs({
        "git_branch",
        "git_diff",
        "diagnostics",
        "lsp",
        "macro_recording",
        "mode",
        "cmd_info",
        "treesitter",
        "virtual_env",
        "file_info",
        "nav",
    }) do
        if not colors[section .. "_bg"] then
            colors[section .. "_bg"] = colors["section_bg"]
        end
        if not colors[section .. "_fg"] then
            colors[section .. "_fg"] = colors["section_fg"]
        end
    end
    return colors
end

function M.heirline_set_colors()
    local heirline_utils = require("heirline.utils")
    heirline_utils.on_colorscheme(M.colors())
end

function M.config(_, opts)
    local heirline = require("heirline")
    local heirline_config = require("config.ui.heirline")
    local heirline_components = require("heirline-components.all")
    -- Setup
    heirline_components.init.subscribe_to_events()
    heirline.load_colors(heirline_config.colors())
    heirline.setup(opts)
end

return M
