return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "folke/which-key.nvim", opts = {} },
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
}
