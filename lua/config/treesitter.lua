local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "python",
    "cpp",
    "c",
    "proto",
    "dockerfile",
    "starlark",
    "bash",
    "javascript",
    "lua",
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = false },
})
