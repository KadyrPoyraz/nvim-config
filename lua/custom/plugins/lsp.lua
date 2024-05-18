return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            { "j-hui/fidget.nvim", opts = {} },

            -- Schema information
            "b0o/SchemaStore.nvim",
        },
        config = function()
            require("neodev").setup {
                library = {
                  plugins = { "nvim-dap-ui" },
                  types = true,
                },
            }

            local capabilities = nil
            if pcall(require, "cmp_nvim_lsp") then
                capabilities = require("cmp_nvim_lsp").default_capabilities()
            end

            local lspconfig = require("lspconfig")

            local servers = {
                gopls = true,
                lua_ls = true,
                tsserver = true,
                jsonls = {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },

                yamlls = {
                    settings = {
                        yaml = {
                            schemaStore = {
                                enable = false,
                                url = "",
                            },
                            schemas = require("schemastore").yaml.schemas(),
                        },
                    },
                },
            }

            local servers_to_install = vim.tbl_filter(function(key)
                local t = servers[key]
                if type(t) == "table" then
                    return not t.manual_install
                else
                    return t
                end
            end, vim.tbl_keys(servers))

            require("mason").setup()
            local ensure_installed = {
                "tsserver",
                "gopls",
                "lua_ls",
            }

            vim.list_extend(ensure_installed, servers_to_install)
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            for name, config in pairs(servers) do
                if config == true then
                    config = {}
                end
                config = vim.tbl_deep_extend("force", {}, {
                    capabilities = capabilities,
                }, config)

                lspconfig[name].setup(config)
            end

            local disable_semantic_tokens = {
                lua = true,
            }

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")


                    local opts = { buffer = bufnr, remap = false }

                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)

                    local filetype = vim.bo[bufnr].filetype
                    if disable_semantic_tokens[filetype] then
                        client.server_capabilities.semanticTokensProvider = nil
                    end
                end,
            })
        end,
    },
}

-- return {
-- 	{
-- 		'VonHeikemen/lsp-zero.nvim',
-- 		config = function()
-- 			local lsp_zero = require('lsp-zero')
--
-- 			lsp_zero.on_attach(function(_, bufnr)
-- 				local opts = { buffer = bufnr, remap = false }
--
-- 				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- 				vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
-- 				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
-- 				vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
-- 				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
-- 				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
-- 				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
-- 				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
-- 				vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
-- 				vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
-- 				vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
-- 			end)
--
-- 			require('mason').setup({})
-- 			require('mason-lspconfig').setup({
-- 				ensure_installed = { 'tsserver', 'gopls', 'lua_ls' },
-- 				handlers = {
-- 					lsp_zero.default_setup,
-- 					lua_ls = function()
-- 						local lua_opts = lsp_zero.nvim_lua_ls()
-- 						require('lspconfig').lua_ls.setup(lua_opts)
-- 					end,
-- 				}
-- 			})
--
-- 			local cmp = require('cmp')
--
-- 			cmp.setup({
-- 				sources = {
-- 					{ name = 'path' },
-- 					{ name = 'nvim_lsp' },
-- 					{ name = 'nvim_lua' },
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					['<C-Space>'] = cmp.mapping.complete(),
-- 				}),
-- 			})
-- 		end,
-- 		branch = 'v3.x',
-- 		dependencies = {
-- 			--- Uncomment the two plugins below if you want to manage the language servers from neovim
-- 			--- and read this: https://github.com/vonheikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
-- 			{ 'williamboman/mason.nvim' },
-- 			{ 'williamboman/mason-lspconfig.nvim' },
--
-- 			-- LSP Support
-- 			{ 'neovim/nvim-lspconfig' },
-- 			-- Autocompletion
-- 			{ 'hrsh7th/nvim-cmp' },
-- 			{ 'hrsh7th/cmp-nvim-lsp' },
-- 			{ 'L3MON4D3/LuaSnip' },
-- 		}
-- 	}
-- }
