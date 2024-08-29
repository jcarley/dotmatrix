local g = vim.g
local wo = vim.wo
local keymap = vim.keymap

-- set leader as comma
g.mapleader = ","

-- turn off word wrap
wo.wrap = false
wo.linebreak = true
wo.list = false

-- lazy fingers
keymap.set("n", ";", ":")

-- clear search
keymap.set("n", "<leader><space>", ":nohlsearch<CR>", { desc = "Clear search" } )

-- bubble blocks
keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { desc = "Bubble block of text up" } )
keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { desc = "Bubble block of text down" } )

-- Increment/decrement
keymap.set("n", "+", "<C-a>", { desc = "Increment number" } )
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" } )

-- Source the current file
keymap.set("n", "<leader><leader>", function()
  vim.cmd "so"
end, { desc = "Source current file" })
