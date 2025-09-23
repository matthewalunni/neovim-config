return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true, -- 👈 Show dotfiles
        },
      },
      extensions = {
        file_browser = {
          hidden = true,
          grouped = true,
          respect_gitignore = false,
        },
      },
    })

    telescope.load_extension("file_browser") -- 👈 Load it AFTER declaring the extension
  end,
}
