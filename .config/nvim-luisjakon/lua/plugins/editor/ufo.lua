return {
  "kevinhwang91/nvim-ufo", -- better folding for neovim
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      event = "VeryLazy",
      config = function()
        local builtin = require "statuscol.builtin"
        require("statuscol").setup {
          relculright = true,
          segments = {
            { text = { "%s" }, click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
            {
              text = { " ", builtin.foldfunc, " " },
              condition = { true, builtin.not_empty },
              click = "v:lua.ScFa",
            },
          },
        }
      end,
    },
  },
  event = "BufReadPost",
  keys = {
    {
      "[z",
      function() require("ufo").goPreviousClosedFold() end,
      desc = "Ufo: go to previous closed fold",
    },
    {
      "]z",
      function() require("ufo").goNextClosedFold() end,
      desc = "Ufo: go to next closed fold",
    },
    {
      "zR",
      function() require("ufo").openAllFolds() end,
      desc = "Ufo: open all folds",
    },
    {
      "zM",
      function() require("ufo").closeAllFolds() end,
      desc = "Ufo: close all folds",
    },
    {
      "zr",
      function() require("ufo").openFoldsExceptKinds() end,
      desc = "Ufo: open folds except kinds",
    },
    {
      "zm",
      function() require("ufo").closeFoldsWith() end,
      desc = "Ufo: close folds",
    },
    {
      "zp",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then vim.lsp.buf.hover() end
      end,
      desc = "Ufo: preview",
    },
  },
  opts = function()
    require("ufo").setup {
      -- fold_virt_text_handler = handler,
      -- provider_selector = function(bufnr, filetype, buftype) return { "treesitter", "indent" } end,
      -- preview = {
      --  win_config = {
      --      winhighlight = "Normal:Folded",
      --      winblend = 0,
      --  },
      --  mappings = {
      --      scrollU = "<C-u>",
      --      scrollD = "<C-d>",
      --  },
      -- },
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "nvcheatsheet", "neo-tree", "term://*" },
      callback = function()
        require("ufo").detach()
        vim.opt_local.foldenable = false
      end,
    })
  end,
}

