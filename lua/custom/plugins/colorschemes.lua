return {
    {
        "askfiy/visual_studio_code",
        priority = 100,
        config = function()
            vim.cmd([[colorscheme visual_studio_code]])
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
}

-- return {
--     {
--         "rose-pine/neovim",
--         name = "rose-pine",
--         lazy = false,
--         priority = 1000,
--         config = function()
--             require("rose-pine").setup({
--                 styles = {
--                     -- transparency = true,
--                     transparency = false,
--                 }
--             })
--
--             vim.cmd.colorscheme "rose-pine"
--             -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--             -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--             -- vim.cmd([[colorscheme rose-pine]])
--         end,
--     },
-- }
