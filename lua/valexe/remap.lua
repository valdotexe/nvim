vim.g.mapleader = " " -- leader key
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- ex shortcut

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move seleted lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected lines up

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- recenter on half page up
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- recenter on half page down

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- clipboard yank shortcut
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- clipboard line yank shortcut

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete without register shortcut

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({bufnr = 0})
end) -- format entire file, requires conform

-- practically useless without LSP
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- go to next error and center screen
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") -- go to previous error and center screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- go to next location and center screen
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- go to previous location and center screen

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word under cursor in file, mildly black magic, handle with care

vim.keymap.set("i", "<C-d>", "<ESC>i<CR><ESC>O") -- open parentheses/brackets in new line and insert
-- plugin related shortcuts set in plugin related files
