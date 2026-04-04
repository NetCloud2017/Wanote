local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4        -- 制表符显示为4个空格宽
opt.shiftwidth = 0     -- 用于自动缩进的宽度, (如函数里换行自动添加的缩进)
opt.expandtab = false  -- 使用制表符进行缩进
opt.autoindent = true

-- 文件加载
opt.autoread = true  --如切换分支文件自动变更, 如另一个编辑器更改当前打开的文件， 这里也同步更新。

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = false

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
-- 不按大写则大小写不敏感， 按大写，则大小写敏感。

opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = false -- 查询高亮关闭

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = false -- 关闭neovim 自带的模式提示


