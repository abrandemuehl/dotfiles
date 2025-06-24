-- Basic options for vscode-neovim
vim.cmd([[
  syntax on
  filetype plugin indent on
]])

-- Leader key
vim.g.mapleader = " "


if vim.g.vscode then
        local vscode = require('vscode')
        vim.keymap.set("n", "<leader>h", function()
                vscode.call("workbench.action.navigateLeft")
        end, { desc = "Go to left window" })
        vim.keymap.set("n", "<leader>j", function()
                vscode.call("workbench.action.navigateDown")
        end, { desc = "Go to left window" })
        vim.keymap.set("n", "<leader>k", function()
                vscode.call("workbench.action.navigateUp")
        end, { desc = "Go to left window" })
        vim.keymap.set("n", "<leader>l", function()
                vscode.call("workbench.action.navigateRight")
        end, { desc = "Go to left window" })
        vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })
else
        vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
        vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
        vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
        vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })
        vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })
end

if not vim.g.vscode then
        local set = vim.opt
        set.wildignorecase = true
        set.wildmode = "longest,list,full"
        set.wildmenu = true
        set.hlsearch = true
        set.incsearch = true
        set.clipboard = "unnamedplus"
        set.ignorecase = true
        set.smartcase = true
        set.autoindent = true
        set.ruler = true
        set.confirm = true
        set.backspace = "2"
        set.number = true
        set.foldnestmax = 1

        -- Tab settings
        set.expandtab = true
        set.smarttab = true


        set.shiftwidth = 4
        set.tabstop = 4

        set.autoread = true
        set.autochdir = true
        set.cursorline = false
        set.visualbell = false
        set.errorbells = false
        set.hidden = true
        set.laststatus = 2
        set.background = "dark"
        set.completeopt = "menu"
        set.lazyredraw = true
        set.mouse = "a"

        set.timeoutlen = 1000
        set.ttimeoutlen = 0




        set.guicursor = ""
end
