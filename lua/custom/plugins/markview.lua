return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },

    init = function()
        -- Fix transparent background issues
        -- Set a background color for blending (adjust to your preference)
        vim.g.markview_dark_bg = "#1e1e2e"
        vim.g.markview_light_bg = "#eff1f5"

        -- Adjust alpha blending (0.0 = fully transparent, 1.0 = solid color)
        -- Default is 0.15 for dark, 0.25 for light
        vim.g.markview_alpha = 0.1
    end,

    config = function()
        require("markview").setup()
    end,
};
