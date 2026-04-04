vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- markdown-preview plugin keymap 
keymap.set('n', "<leader>mp", ":MarkdownPreview<CR>")

-- 取消 按 u 键的撤销

keymap.set({"n", "i"}, "<C-z>", "<Cmd>undo<CR>", {silent = true})

-- 保存

keymap.set({"n", "i"}, "<C-s>", ":wa<CR>", {silent = true})
