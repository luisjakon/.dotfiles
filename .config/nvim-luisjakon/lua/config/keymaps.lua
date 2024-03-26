local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Better Undo
vim.keymap.set("i", "<M-z>", "<C-o>u", opts)
vim.keymap.set("n", "<M-z>", "u", opts)
vim.keymap.set("x", "<M-z>", "<C-o>u", opts)

-- Better Redo
vim.keymap.set("i", "<M-S-z>", "<C-o><C-r>", opts)
vim.keymap.set("n", "<M-S-z>", "<C-r>", opts)
vim.keymap.set("x", "<M-S-z>", "<C-o><C-r>", opts)

-- Better Cut
vim.keymap.set("x", "<M-x>", "x", opts)
vim.keymap.set("x", "<M-c>", "y", opts)
vim.keymap.set("x", "", "y", opts)

-- Better Copy
vim.keymap.set("", "<M-a>", "ggVG", opts)

-- Better Paste
-- vim.keymap.set("x", "p", "_dP", opts)
-- vim.cmd [[nnoremap <leader>p :let @"=substitute(@", '\n\+$', '', '')<CR>p]]
-- vim.cmd [[inoremap <leader>p <esc>:let @"=substitute(@", '\n\+$', '', '')<CR>pa]]

-- -- Better clipboard
-- vim.keymap.set("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<M-v>", "P<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<D-v>", "i<C-o>+P<Esc>", { noremap = true, silent = true })
-- vim.keymap.set("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.keymap.set("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.keymap.set("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- vim.keymap.set(
--   { "v", "s", "x", "o", "i", "l", "c", "t" },
--   "<M-v>",
--   function() vim.api.nvim_paste(vim.fn.getreg "+", true, -1) end,
--   { noremap = true, silent = true }
-- )

-- Better shift select
vim.keymap.set("i", "<S-Up>", "<Esc>v<Up>", {})
vim.keymap.set("i", "<S-Down>", "<Esc>v<Down>", {})
vim.keymap.set("i", "<S-Left>", "<Esc>v<Left>", {})
vim.keymap.set("i", "<S-Right>", "<Esc><Right>v<Right>", {})
vim.keymap.set("n", "<S-Up>", "v<Up>", {})
vim.keymap.set("n", "<S-Down>", "v<Down>", {})
vim.keymap.set("n", "<S-Left>", "v<Left>", {})
vim.keymap.set("n", "<S-Right>", "v<Right>", {})
vim.keymap.set("v", "<S-Up>", "<Up>", {})
vim.keymap.set("v", "<S-Down>", "<Down>", {})
vim.keymap.set("v", "<S-Left>", "<Left>", {})
vim.keymap.set("v", "<S-Right>", "<Right>", {})

-- Better indentations
vim.keymap.set("x", "<TAB>", ">gv", opts)
vim.keymap.set("x", "<S-TAB>", "<gv", opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Better comments
vim.keymap.set("n", "<M-/>", '<cmd>lua require"Comment.api".toggle.linewise.current()<CR>', opts)
vim.keymap.set("x", "<M-/>", '<ESC><CMD>lua require"Comment.api".toggle.linewise(vim.fn.visualmode())<CR>', opts)
vim.keymap.set("i", "<M-/>", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', opts)

-- File/Buffer manipulatioU
vim.keymap.set("i", "<M-s>", "<C-o>:w<cr>", opts)
vim.keymap.set("n", "<M-s>", ":w<cr>", opts)
vim.keymap.set("x", "<M-s>", "<C-o>:w<cr>", opts)
vim.keymap.set("n", "<Leader>w", ":w<cr>", opts)
vim.keymap.set("n", "<Leader>q", ":bd<cr>", opts)
vim.keymap.set("i", "", "<C-o>u", opts)
vim.keymap.set("i", "", "<C-o>:w<cr>", opts)

-- Better window sizing
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Better terminal toggling
-- vim.keymap.set("n", "`", "<cmd>ToggleTerm<CR>", opts)
vim.keymap.set("n", "<M-Bslash>", "<cmd>ToggleTerm<CR>", opts)
vim.keymap.set("x", "<M-Bslash>", "<cmd>ToggleTerm<CR>", opts)
vim.keymap.set("i", "<M-Bslash>", "<cmd>ToggleTerm<CR>", opts)

-- Better terminal maps
function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], term_opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jj", [[<C-\><C-n>]], term_opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], term_opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], term_opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], term_opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], term_opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<M-Bslash>", "<cmd>ToggleTerm<CR>", term_opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<D-Bslash>", "<cmd>ToggleTerm<CR>", term_opts)
end
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

-- Better multiple cursor mappings - a la vscode
-- vim.cmd [[
-- let g:VM_maps = {}
-- let g:VM_maps['Find Under']                  = '<M-d>'
-- let g:VM_maps['Find Subword Under']          = '<M-D>'
-- ]]

-- Better quit command
vim.cmd [[command! Qa :qa]]
vim.cmd [[command! Q :q]]

-- Better JSON with comments
vim.cmd "autocmd! BufNewFile,BufRead *.json set ft=javascript"

vim.keymap.set("n", "<M-p>", ":Telescope find_files<CR>", opts)
-- vim.keymap.set("n", "<M-f>", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<M-S-p>", ":", opts)

-- Neovide keymaps
if vim.g.neovide then
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.keymap.set("n", "<D-z>", "u", opts)
  vim.keymap.set({ "i", "x" }, "<D-z>", "<C-o>u", opts)
  vim.keymap.set("n", "<D-S-z>", "<C-r>", opts)
  vim.keymap.set({ "i", "x" }, "<D-S-z>", "<C-o><C-r>", opts) -- Better Redo
  vim.keymap.set("n", "<D-a>", "ggVG", opts)
  vim.keymap.set("n", "<D-s>", ":w<CR>", opts) -- Save
  vim.keymap.set("v", "<D-c>", '"+y', opts) -- Copy
  vim.keymap.set("n", "<D-v>", '"+P', opts) -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P', opts) -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+", opts) -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli', opts) -- Paste insert mode
end

if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
  vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.25) end)
  vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.25) end)
end

-- return {
--   -- first key is the mode
--   n = {
--     -- second key is the lefthand side of the map
--
--     -- navigate buffer tabs with `H` and `L`
--     -- L = {
--     --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
--     --   desc = "Next buffer",
--     -- },
--     -- H = {
--     --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
--     --   desc = "Previous buffer",
--     -- },
--
--     -- mappings seen under group name "Buffer"
--     ["<leader>bD"] = {
--       function()
--         require("astronvim.utils.status").heirline.buffer_picker(
--           function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
--         )
--       end,
--       desc = "Pick to close",
--     },
--     -- tables with the `name` key will be registered with which-key if it's installed
--     -- this is useful for naming menus
--     ["<leader>b"] = { name = "Buffers" },
--     -- quick save
--     -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
--   },
--   t = {
--     -- setting a mapping to false will disable it
--     -- ["<esc>"] = false,
--   },
-- }

