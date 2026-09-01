return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require('gitsigns')
			gitsigns.setup()

			local function review_changes()
				gitsigns.setqflist("all")
			end

			vim.api.nvim_create_user_command("GitReview", review_changes, { desc = "Review all git changes" })

			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>")
			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>")
			vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>")
			vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>")
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
			vim.keymap.set("n", "<leader>gR", review_changes, { desc = "Review all git changes" })
		end
	},
}
