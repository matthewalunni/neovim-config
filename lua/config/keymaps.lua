-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Close terminal with <Esc>
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- Open mini starter
map("n", "<leader>h", Snacks.dashboard.open, { desc = "Open mini starter" })

-- Leader key
vim.g.mapleader = " "

-- ========================
-- General
-- ========================
map("n", "<leader>n", ":Neotree toggle<CR>", opts)
map("n", "<leader>q", ":bd<CR>", opts)
map("n", "<leader>Q", ":qa<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>W", ":wa<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":qa<CR>", opts)
map("n", "<esc>", "<esc>:noh<CR>", opts)

-- ========================
-- Files & Buffers
-- ========================
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
map("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>c", ":Telescope commands<CR>", { noremap = true, silent = true })
map("n", "<leader><tab>", ":b#<CR>", opts)
map("n", "]b", ":bnext<CR>", opts)
map("n", "[b", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bd<CR>", opts)
map("n", "<leader>bo", ":bufdo bd | e#<CR>", opts)

-- ========================
-- Search & Navigation
-- ========================
map("n", "/", "/\\v", opts) -- smart regex search
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "<leader>sh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>sk", ":Telescope keymaps<CR>", opts)
map("n", "<leader>sr", ":Telescope resume<CR>", opts)
map("n", "<leader>ss", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- ========================
-- Git (requires gitsigns + lazygit)
-- ========================
map("n", "<leader>gg", ":LazyGit<CR>", opts)
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)
map("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)
map("n", "<leader>gs", ":Gitsigns status<CR>", opts)
map("n", "<leader>gc", ":Telescope git_branches<CR>", opts)
map("n", "<leader>gC", ":Telescope git_commits<CR>", opts)
map("n", "<leader>gl", ":Telescope git_bcommits<CR>", opts)
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", opts)
map("n", "<leader>gh", ":Gitsigns stage_hunk<CR>", opts)
map("n", "<leader>gS", ":Gitsigns stage_buffer<CR>", opts)

-- ========================
-- Window Management
-- ========================
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<leader>sv", ":vsplit<CR>", opts)
map("n", "<leader>sh", ":split<CR>", opts)
map("n", "<leader>se", "<C-w>=", opts)
map("n", "<leader>sx", ":close<CR>", opts)

-- ========================
-- Snacks Terminal (LazyVim)
-- ========================
map("n", "<leader>tt", ":ToggleTerm<CR>", opts)
map("n", "<leader>tT", ":ToggleTerm direction=float<CR>", opts)
-- map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", opts)
map("n", "<leader>th", ":split | terminal<CR>")
map("n", "<leader>tv", ":vsplit | terminal<CR>")
-- map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opts)
map("n", "<leader>tn", ":bnext<CR>", opts)
map("n", "<leader>tp", ":bprevious<CR>", opts)
map("n", "<leader>tx", ":bdelete<CR>", opts)
map("t", "<esc>", "<C-\\><C-n>", opts)
map("t", "i", "i", opts)

-- ========================
-- Git / Misc toggles
-- ========================
map("n", "<leader>tc", ":set colorcolumn=80!<CR>", opts)
map("n", "<leader>ts", ":set spell!<CR>", opts)
map("n", "<leader>tw", ":set wrap!<CR>", opts)
map("n", "<leader>u", ":UndotreeToggle<CR>", opts)
map("n", "<leader>y", '"+y', opts)
map("n", "<leader>p", '"+p', opts)

-- ========================
-- Copilot & Copilot Chat (requires Copilot + Chat plugin)
-- ========================
map("n", "<leader>cc", ":Copilot Chat<CR>", opts)
map("n", "<leader>cq", ":Copilot Chat<CR>", opts) -- quick floating
map("v", "<leader>ce", ":Copilot Chat<CR>", opts) -- explain selected code
map("v", "<leader>ct", ":Copilot Chat<CR>", opts) -- generate tests
map("v", "<leader>cd", ":Copilot Chat<CR>", opts) -- generate docstrings
map("n", "<C-e>", ":Copilot#Accept()<CR>", opts)
map("n", "<C-space>", ":Copilot#Complete()<CR>", opts)

-- ========================
-- Operator-pending & motions helper (optional)
-- ========================
-- Example: text object mappings are built-in in Vim, no extra mapping needed
-- This section could be expanded with custom text objects if desired
--
-- ========================
-- Octo commands in Telescope
-- ========================
--
-- Open Issues (search through GitHub issues)
-- Keymaps for Octo commands
map("n", "<leader>oi", ":Telescope octo issues<CR>", { noremap = true, silent = true })
map("n", "<leader>op", ":Telescope octo prs<CR>", { noremap = true, silent = true })
map("n", "<leader>or", ":Telescope octo review<CR>", { noremap = true, silent = true })

-- Pull request actions
map("n", "<leader>oc", ":Octo checkout<CR>", { noremap = true, silent = true })
map("n", "<leader>om", ":Octo merge<CR>", { noremap = true, silent = true })
map("n", "<leader>or", ":Octo rebase<CR>", { noremap = true, silent = true })
map("n", "<leader>ocm", ":Octo comment<CR>", { noremap = true, silent = true })
map("n", "<leader>og", ":Octo browse<CR>", { noremap = true, silent = true })

-- Issue actions
map("n", "<leader>oi", ":Octo issue view<CR>", { noremap = true, silent = true })
map("n", "<leader>ni", ":Octo issue new<CR>", { noremap = true, silent = true })
map("n", "<leader>iocm", ":Octo issue comment<CR>", { noremap = true, silent = true })
map("n", "<leader>ioc", ":Octo issue close<CR>", { noremap = true, silent = true })
-- Notifications and Repo actions
map("n", "<leader>on", ":Telescope octo notifications<CR>", { noremap = true, silent = true })
map("n", "<leader>ogr", ":Octo repo browse<CR>", { noremap = true, silent = true })
map("n", "<leader>o", ":Octo<CR>", { desc = "Octo" })
