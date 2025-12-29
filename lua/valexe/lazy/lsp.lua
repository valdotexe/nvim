return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        -- initialize conform
        require("conform").setup({
            formaters_by_ft = { -- add formaters here
                lua = {
                    "stylua",
                }
            }
        })

        -- initialize completion
        local cmp = require("cmp")

        -- initialize lsp notification
        require("fidget").setup({})

        -- initialize mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { -- add language servers here
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "pyright",
                "slint_lsp",
                "emmet_language_server",
                "html",
                "eslint",
                "ts_ls",
                "jdtls",
                "zls",
                "clangd",
                "cssls",
            },
        })

        -- set up language servers
        -- defualt config
        vim.lsp.config("*", {})
        -- lua specific
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            os.getenv("HOME") .. "/.lualib",
                        },
                    },
                },
            },
        })

        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        -- setup completion
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                {
                    { name = 'buffer' },
                })
            })

            -- initialize diagnostics
            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = true,
                    header = "",
                    prefix = "",
                },
            })
        end,
    }
