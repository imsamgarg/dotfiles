return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		leap.add_default_mappings()
		leap.opts_case_sensitive = true
	end,
}
