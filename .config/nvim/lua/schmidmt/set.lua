-- Set the mapleader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting Options ]]

-- Enable line numbering
vim.opt.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Hide the mode since it's in the modeline anyway
vim.opt.showmode = false

-- Sync clipboard between os and neovim
vim.opt.clipboard = 'unnamedplus'

-- Enable breakindent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive search unless \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display whitespaces in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions
vim.opt.inccommand = 'split'

-- show line number for cursor
vim.opt.cursorline = true

-- Set scrolloff (lines above and below buffer's true content)
vim.opt.scrolloff = 10

-- Set wildmode
vim.opt.wildmode = 'longest,list:list,full'

-- Disable autoindent
vim.opt.autoindent = false

-- Disable wrapping
vim.opt.wrap = false
