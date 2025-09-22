-- /lua/plugins/git.lua (or wherever your Git plugins are)
return {
  {
    "kdheepak/lazygit.nvim",
    config = function()
      -- Optional: Set your keybinding
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
  },
}
