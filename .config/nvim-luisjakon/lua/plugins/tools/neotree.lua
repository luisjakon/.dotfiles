
return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    vim.g.forgetfulme = "n"

    require("neo-tree").setup {
      sources = { "filesystem", "buffers", "git_status" },
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = " " .. "File" },
          { source = "buffers", display_name = "󰈙 " .. "Bufs" },
          { source = "git_status", display_name = " " .. "Git" },
          { source = "diagnostics", display_name = "󰒡 " .. "Diagnostic" },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        window = {
          width = 30,
          mappings = {
            ["<leftrelease>"] = "open", -- This tells neo-tree to use the default filesystem open command on the release of the left mouse button
          },
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      default_component_configs = {
        symlink_target = { enabled = true },
        indent = {
          indent_marker = "│",
          last_indent_marker = "│",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "A",
            deleted = "D",
            modified = "M",
            renamed = "R",
            -- Status type
            unstaged = "-",
            staged = "+",
            untracked = "U",
            ignored = "I",
            conflict = "C",
          },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            -- print "neo_tree_buffer_enter"
            vim.g.forgetfulme = vim.api.nvim_get_mode().mode
            if vim.g.forgetfulme == "i" then vim.cmd "stopinsert" end
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            -- print "neo_tree_buffer_leave"
            if vim.g.forgetfulme == "i" then vim.cmd "startinsert" end
            vim.g.forgetfulme = vim.api.nvim_get_mode().mode
          end,
        },
      },
    }
  end,
}
