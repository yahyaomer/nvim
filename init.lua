-- settings
vim.opt.number = true
vim.opt.relativenumber = false

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

vim.keymap.set("v", "J", "<cmd> m '>+1<CR>gv")
vim.keymap.set("v", "K", "<cmd> m '<-2<CR>gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<A-n>", "nzz")
vim.keymap.set("n", "<A-N>", "Nzz")

vim.keymap.set("n", "<A-u>", "<C-w><")
vim.keymap.set("n", "<A-i>", "<C-w>+")
vim.keymap.set("n", "<A-o>", "<C-w>-")
vim.keymap.set("n", "<A-p>", "<C-w>>")

vim.keymap.set("n", "<A-r>", "<cmd> cnext<CR>")
vim.keymap.set("n", "<A-e>", "<cmd> cprev<CR>")
vim.keymap.set("n", "<A-R>", "<cmd> copen<CR>")
vim.keymap.set("n", "<A-E>", "<cmd> cclose<CR>")

vim.keymap.set({ "n", "v" }, "<C- >", "\"_")
vim.keymap.set({ "n", "v" }, "<leader><leader>", "\"+")

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gri", vim.lsp.buf.implementation)
vim.keymap.set("n", "grr", vim.lsp.buf.references)
vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
vim.keymap.set("n", "gk", vim.diagnostic.open_float)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

vim.keymap.set("n", "<leader>f", "<cmd> Telescope find_files <CR>")
vim.keymap.set("n", "<leader>g", "<cmd> Telescope live_grep <CR>")

vim.keymap.set("n", "<A-b>", "<cmd> NvimTreeToggle <CR>")

vim.keymap.set("n", "<A-g>", "<cmd> DiffviewOpen <CR>")
vim.keymap.set("n", "<A-G>", "<cmd> DiffviewClose <CR>")

vim.keymap.set({ "n", "t" }, "<A-m>", function() require("toggleterm").toggle(vim.v.count) end)

vim.keymap.set("n", "<A-j>", "<cmd> BufferPrevious <CR>")
vim.keymap.set("n", "<A-k>", "<cmd> BufferNext <CR>")
vim.keymap.set("n", "<A-J>", "<cmd> BufferMovePrevious <CR>")
vim.keymap.set("n", "<A-K>", "<cmd> BufferMoveNext <CR>")
vim.keymap.set("n", "<A-w>", "<cmd> BufferClose <CR>")
vim.keymap.set("n", "<A-W>", "<cmd> BufferClose! <CR>")
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
    { "navarasu/onedark.nvim", opts = { style = "deep" } },
    { "folke/tokyonight.nvim", opts = {} },

    { "nvim-telescope/telescope.nvim", opts = {}, dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-tree/nvim-tree.lua", opts = {} },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "romgrk/barbar.nvim", opts = { animation = false } },
    { "nvim-lualine/lualine.nvim", opts = {} },
    { "akinsho/toggleterm.nvim", version = "*", opts = {} },

    { "mason-org/mason.nvim", opts = {} },
    { "mason-org/mason-lspconfig.nvim", opts = {} },

    { "nvim-treesitter/nvim-treesitter", opts = {} },
    { "nvim-treesitter/nvim-treesitter-context", opts = {} },

    { "sindrets/diffview.nvim", opts = {} },
    { "lewis6991/gitsigns.nvim", opts = {} },

    { "mg979/vim-visual-multi" },

    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local cmp = require("cmp")
            return {
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "buffer" },
                    { name = "path" },
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
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("clangd", {})
            vim.lsp.config("ts_ls", {})
            vim.lsp.config("eslint", {})
            vim.lsp.config("cmake", {})
            vim.lsp.config("jsonls", {})
            vim.lsp.config("html", {})
            vim.lsp.config("pylsp", {
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
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        format = {
                            enable = true,
                            defaultConfig = {
                                align_array_table = "false",
                            },
                        },
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

vim.o.guifont = "JetBrainsMonoNL NF:h11"
vim.keymap.set("n", "<C-->", function () vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end)
vim.keymap.set("n", "<C-=>", function () vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end)
vim.keymap.set("n", "<C-0>", function () vim.g.neovide_scale_factor = 1.0 end)
