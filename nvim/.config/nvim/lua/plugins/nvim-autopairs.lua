return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- Enable treesitter integration
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		})
	end,
}
