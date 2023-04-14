vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", ";", ":")

-- Move blocks up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without losing paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader><space>", ":noh<cr>")

-- bubble text
vim.keymap.set("n", "<C-J>", "ddp")
vim.keymap.set("n", "<C-K>", "ddkP")

-- using system clipboard as default register
vim.opt.clipboard:append("unnamedplus")
