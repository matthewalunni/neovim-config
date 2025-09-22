return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe", -- Change this to "mocha", "latte", "frappe", or "macchiato" to test
      background = {
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        -- Add any integrations for other plugins here
      },
    })
  end,
}
