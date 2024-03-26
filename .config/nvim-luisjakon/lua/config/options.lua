-- code is stolen from https://github.com/echasnovski/nvim/blob/master/lua/ec/settings.lua
-- stylua: ignore start
-- Leader key =================================================================
vim.g.mapleader    = " "
-- vim.g.autoformat   = false
local opt = vim.opt

-- -- General ====================================================================
-- opt.backup         = false    -- Don't store backup
-- opt.mouse          = 'a'      -- Enable mouse
-- opt.switchbuf      = 'usetab' -- Use already opened buffers when switching
-- opt.writebackup    = false    -- Don't store backup
-- opt.undofile       = true     -- Enable persistent undo
-- opt.swapfile       = false
-- opt.guifont        = 'FiraCode Nerd Font:h16'
-- opt.cmdheight      = 0
-- opt.foldenable     = false
-- opt.clipboard      = ""
--
-- -- UI =========================================================================
-- opt.breakindent    = true     -- Indent wrapped lines to match line start
-- opt.cursorline     = true     -- Enable highlighting of the current line
-- opt.laststatus     = 3        -- show statusline in last window
-- opt.linebreak      = true     -- Wrap long lines at 'breakat' (if 'wrap' is set)
-- opt.list           = true     -- Show helpful character indicators
-- opt.relativenumber = true     -- Show relative line numbers
-- opt.pumblend       = 0        -- Make builtin completion menus slightly transparent
-- opt.pumheight      = 10       -- Make popup menu smaller
-- opt.ruler          = false    -- Don't show cursor position
-- opt.shortmess      = 'aoOWFc' -- Disable certain messages from |ins-completion-menu|
-- opt.showmode       = false    -- Don't show mode in command line
-- opt.signcolumn     = 'yes'    -- Always show signcolumn or it would frequently shift
-- opt.splitbelow     = true     -- Horizontal splits will be below
-- opt.splitright     = true     -- Vertical splits will be to the right
-- opt.termguicolors  = true     -- Enable gui colors
-- opt.winblend       = 0        -- Make floating windows transparent
-- opt.wrap           = false    -- Display long lines as just one line
--
-- vim.o.fillchars    = table.concat(
--     { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣',
--         'vertright:╠' },
--     ','
-- )
-- vim.o.listchars    = table.concat(
--     { 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' },
--     ','
-- )
--
-- opt.shortmess:append('C')  -- Don't show "Scanning..." messages
-- opt.splitkeep     = 'screen' -- Reduce scroll during window split
--
-- -- Editing ====================================================================
-- opt.autoindent    = true                                 -- Use auto indent
-- opt.expandtab     = true                                 -- Convert tabs to spaces
-- opt.formatoptions = 'rqnl1j'                             -- Improve comment editing
-- opt.ignorecase    = true                                 -- Ignore case when searching (use `\C` to force not doing that)
-- opt.incsearch     = true                                 -- Show search results while typing
-- opt.infercase     = true                                 -- Infer letter cases for a richer built-in keyword completion
-- opt.shiftwidth    = 4                                    -- Use this number of spaces for indentation
-- opt.smartcase     = true                                 -- Don't ignore case when searching if pattern has upper case
-- opt.smartindent   = true                                 -- Make indenting smart
-- opt.tabstop       = 4                                    -- Insert 4 spaces for a tab
-- opt.virtualedit   = 'block'                              -- Allow going past the end of line in visual block mode
--
-- opt.iskeyword:append('-')                              -- Treat dash separated words as a word text object
--
-- opt.completeopt            = 'menuone,noinsert,noselect' -- Customize completions

-- Define pattern for a start of 'numbered' list. This is responsible for
-- correct formatting of lists when using `gw`. This basically reads as 'at
-- least one special character (digit, -, +, *) possibly followed some
-- punctuation (. or `)`) followed by at least one space is a start of list
-- item'
-- opt.formatlistpat          = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

--stylua: ignore end
--
-- opt.clipboard = "unnamedplus"

local whichwrap = vim.opt.whichwrap + "<,>,[,],h,l" -- wrap line with arrow keys

-- vim.opt.foldcolumn = "auto:1"
-- vim.opt.fillchars:append {
--   -- foldsep = "🮍",
--   foldsep = " ",
--   foldopen = "",
--   foldclose = "",
-- }
local fillchars = {
    diff = " ",
    eob = " ",
    fold = " ",
    foldsep = " ",
    foldopen = "",
    foldclose = "",
}
-- local fillchars = [[eob: ,fold: ,foldopen:⌄,foldsep: ,foldclose:›]]

local listchars = {
    eol = "↲",
    tab = "▸ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "⎵",
    conceal = "×",
}

opt.viewoptions:remove("curdir") -- disable saving current directory with views
opt.shortmess:append({ s = true, I = true }) -- disable search count wrap and startup messages
opt.backspace:append({ "nostop" }) -- don't stop backspace at insert
if vim.fn.has("nvim-0.9") == 1 then
    opt.diffopt:append("linematch:60") -- enable linematch diff algorithm
end

opt.breakindent = true -- wrap indent to match  line start
opt.clipboard = "unnamedplus" -- connection to the system clipboard
opt.cmdheight = 0 -- hide command line unless needed
-- opt.completeopt = { "menu", "menuone", "noselect" }         -- Options for insert mode completion
opt.confirm = true
opt.copyindent = true -- copy the previous indentation on autoindenting
opt.cursorline = true -- highlight the text line of the cursor
opt.expandtab = true -- enable the use of space in tab
opt.fileencoding = "utf-8" -- file content encoding for the buffer
opt.fillchars = fillchars -- disable `~` on nonexistent lines
opt.fixeol = true
opt.foldenable = true -- enable fold for nvim-ufo
opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
opt.foldlevelstart = 99 -- start with all code unfolded
opt.foldcolumn = "auto:1" -- vim.fn.has("nvim-0.9") == 1 and "1" or "0" -- show foldcolumn in nvim 0.9
opt.history = 100 -- number of commands to remember in a history table
opt.ignorecase = true -- case insensitive searching
opt.infercase = true -- infer cases in keyword completion
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- wrap lines at 'breakat'
opt.list = false -- sets vim.opt.list - show hidden characters
opt.listchars = listchars
opt.mouse = "a" -- enable mouse support
opt.number = true -- show numberline
opt.preserveindent = true -- preserve indent structure as much as possible
opt.pumheight = 10 -- height of the pop up menu
opt.relativenumber = true -- show relative numberline
opt.scrolloff = 3
opt.sidescroll = 1
opt.sidescrolloff = 10
opt.shiftwidth = 2 -- number of space inserted for indentation
opt.showmode = false -- disable showing modes in command line
opt.showtabline = 2 -- always display tabline
opt.signcolumn = "yes:1" -- always show the sign column
opt.smartcase = true -- case sensitive searching
opt.splitbelow = true -- splitting a new window below the current one
opt.splitright = true -- splitting a new window at the right of the current one
opt.tabstop = 2 -- number of space in a tab
opt.termguicolors = true -- enable 24-bit RGB color in the TUI
opt.timeoutlen = 500 -- shorten key timeout length a little bit for which-key
opt.title = true -- set terminal title to the filename and path
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- length of time to wait before triggering the plugin
opt.virtualedit = "block" -- allow going past end of line in visual block mode
opt.whichwrap = whichwrap
opt.wrap = false -- disable wrapping of lines longer than the width of window
opt.writebackup = false -- disable making a backup before overwriting a file

local g = vim.g

g.mapleader = " " -- set leader key
g.maplocalleader = " " -- set default local leader key

-- AstroNvim specific global options
g.max_file = { size = 1024 * 100, lines = 10000 } -- set global limits for large files
g.autoformat_enabled = true -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
g.autopairs_enabled = true -- enable autopairs at start
g.cmp_enabled = true -- enable completion at start
g.codelens_enabled = true -- enable or disable automatic codelens refreshing for lsp that support it
g.diagnostics_mode = 3 -- set the visibility of diagnostics in the UI (0=off  1=only show in status line  2=virtual text off  3=all on)
g.highlighturl_enabled = true -- highlight URLs by default
g.icons_enabled = true -- disable icons in the UI (disable if no nerd font is available)
g.inlay_hints_enabled = false -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
g.lsp_handlers_enabled = true -- enable or disable default vim.lsp.handlers (hover and signature help)
g.semantic_tokens_enabled = true -- enable or disable LSP semantic tokens on startup
g.ui_notifications_enabled = true -- disable notifications (TODO: rename to  notifications_enabled in AstroNvim v4)
g.git_worktrees = nil -- enable git integration for detached worktrees (specify a table where each entry is of the form { toplevel = vim.env.HOME  gitdir=vim.env.HOME .. "/.dotfiles" })
