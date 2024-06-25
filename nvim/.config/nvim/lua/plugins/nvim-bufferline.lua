return {
	"akinsho/nvim-bufferline.lua",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				-- mode = "tabs", -- display tabs instead of buffers
				separator_style = "slant",
				numbers = "ordinal",
				-- numbers = function(opts)
				-- 	return string.format("%s|%s", opts.ordinal, opts.id)
				-- end,
				diagnostics = "nvim_lsp", -- use nvim lsp for diagnostics
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				always_show_bufferline = true, -- show bufferline only when there are multiple buffers
				show_buffer_icons = true, -- show file icons
				show_buffer_close_icons = true, -- show buffer close icons
				show_close_icon = true, -- show close icon for the bufferline
				show_tab_indicators = true, -- show indicators for active tabs
			},
		})
	end,
}
