if vim.g.vscode then
    return {}
end
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "zbirenbaum/copilot-cmp",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<CR>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() and cmp.get_active_entry() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                }),
                sources = cmp.config.sources({
                    { name = "copilot" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
            })

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd", "lua_ls", "pyright", "vimls", "jsonls", "bzl", "ruff", "denols"
                },
                automatic_installation = true,
                automatic_enable = {
                    exclude = { "clangd", "pyright" },
                },
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                filetypes = { "lua" },
                root_dir = function(fname)
                    return vim.fn.expand("<afile>:p:h") -- Use the directory of the current file
                end,
                settings = {
                    Lua = {
                        diagnostics = { enable = false },
                        workspace = { checkThirdParty = false },
                        format = {
                            enable = true,
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = "2",
                            },
                        },
                    },
                },
            })

            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--malloc-trim",
                    "-j=4",
                    "--offset-encoding=utf-16",
                },
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                end,
            })

            lspconfig.ruff.setup({
                capabilities = capabilities,
                on_attach = function(client)
                    if client.name == "ruff" then
                        client.server_capabilities.documentFormattingProvider = true
                    end
                end,
            })

            lspconfig.denols.setup({
                capabilities = capabilities,
            })

            for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                vim.api.nvim_set_hl(0, group, {})
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "<leader>o", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                end,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp", { clear = true }),
                callback = function(args)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end,
            })
        end,
    },
}
