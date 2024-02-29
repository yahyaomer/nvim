-- settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.o.undofile = true
vim.o.undolevels = 0xFFFF

-- remaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<A-u>", "<C-w><")
vim.keymap.set("n", "<A-i>", "<C-w>+")
vim.keymap.set("n", "<A-o>", "<C-w>-")
vim.keymap.set("n", "<A-p>", "<C-w>>")

vim.keymap.set("v", "<A-p>", "\"_dP")

vim.keymap.set("t", "<A-Esc>", "<C-\\><C-n>")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gf", vim.lsp.buf.code_action)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

vim.keymap.set("n", "<A-d>", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>")
vim.keymap.set("v", "<A-d>", "\"dy:%sno/<C-r>d//gI<Left><Left><Left>")
vim.keymap.set("v", "/", "\"dy/\\V<C-r>d<CR>")
vim.keymap.set("v", "?", "\"dy/\\V<C-r>d\\c<CR>")

vim.keymap.set("n", "<leader>f", "<cmd> Telescope find_files <CR>")
vim.keymap.set("n", "<leader>g", "<cmd> Telescope live_grep <CR>")
vim.keymap.set("n", "<A-b>", "<cmd> NvimTreeToggle <CR>")
vim.keymap.set("n", "<A-g>", "<cmd> DiffviewOpen <CR>")
vim.keymap.set("n", "<A-G>", "<cmd> DiffviewClose <CR>")
vim.keymap.set({ "n", "t" }, "<A-m>", function() require("toggleterm").toggle(vim.v.count) end)
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

vim.keymap.set("n", "<A-j>", "<cmd> BufferPrevious <CR>")
vim.keymap.set("n", "<A-k>", "<cmd> BufferNext <CR>")
vim.keymap.set("n", "<A-J>", "<cmd> BufferMovePrevious <CR>")
vim.keymap.set("n", "<A-K>", "<cmd> BufferMoveNext <CR>")
vim.keymap.set("n", "<A-w>", "<cmd> BufferClose <CR>")
vim.keymap.set("n", "<A-1>", "<cmd> BufferGoto 1 <CR>")
vim.keymap.set("n", "<A-2>", "<cmd> BufferGoto 2 <CR>")
vim.keymap.set("n", "<A-3>", "<cmd> BufferGoto 3 <CR>")
vim.keymap.set("n", "<A-4>", "<cmd> BufferGoto 4 <CR>")
vim.keymap.set("n", "<A-5>", "<cmd> BufferGoto 5 <CR>")
vim.keymap.set("n", "<A-6>", "<cmd> BufferGoto 6 <CR>")
vim.keymap.set("n", "<A-7>", "<cmd> BufferGoto 7 <CR>")
vim.keymap.set("n", "<A-8>", "<cmd> BufferGoto 8 <CR>")
vim.keymap.set("n", "<A-9>", "<cmd> BufferGoto 9 <CR>")
vim.keymap.set("n", "<A-0>", "<cmd> BufferLast <CR>")

-- plugins
local plugins = {
    { "williamboman/mason.nvim",            config = true },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "nvim-tree/nvim-tree.lua",            config = true },
    { "nvim-tree/nvim-web-devicons",        config = true },
    { "lewis6991/gitsigns.nvim",            config = true },
    { "nvim-lualine/lualine.nvim",          config = true },
    { "sindrets/diffview.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        opts = { mappings = false },
    },
    { "akinsho/toggleterm.nvim", version = "*",              config = true },
    {
        "romgrk/barbar.nvim",
        opts = {
            animation = false,
        },
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = true,
    },
    { "navarasu/onedark.nvim",   opts = { style = "darker" } },
    {
        "nvim-telescope/telescope.nvim",
        config = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local cmp = require("cmp")
            return {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "nvim_lsp_signature_help" },
                },
                mapping = {
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                }
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require "nvim-treesitter.configs".setup({
                ensure_installed = "all",
                highlight = { enable = true },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig["clangd"].setup({})
            lspconfig["tsserver"].setup({})
            lspconfig["eslint"].setup({})
            lspconfig["cmake"].setup({})
            lspconfig["jsonls"].setup({})
            lspconfig["pylsp"].setup({
                settings = {
                    pylsp = {
                        plugins = {
                            jedi = {
                                environment = "/usr/bin/python3",
                            },
                            pycodestyle = {
                                ignore = { "W391" },
                                maxLineLength = 120,
                            },
                        }
                    }
                }
            })
            lspconfig["lua_ls"].setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },
                    },
                },
            })
        end,
    },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, {})

vim.cmd.colorscheme("onedark")
