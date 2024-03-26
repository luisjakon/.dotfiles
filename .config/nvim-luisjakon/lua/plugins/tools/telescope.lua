return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Telescope",
    config = function()
      require("telescope").setup {
        defaults = {
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            follow = true,
            find_command = {
              "rg",
              "-L",
              "--hidden",
              "--files",
              "--iglob",
              "!.git",
              "--iglob",
              "!node_modules",
              "--iglob",
              "!.svelte-kit",
              "--iglob",
              "!.vscode/debug-profile-chrome",
            },
          },
          grep_string = {
            additional_args = { "--hidden" },
          },
          live_grep = {
            additional_args = { "--hidden" },
          },
        },
      }
    end,
  },
}

