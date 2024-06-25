return {
	"terrortylor/nvim-comment",
	config = function()
		require("nvim_comment").setup({
			hook = function()
				if vim.api.nvim_buf_get_option(0, "filetype") == "dart" then
					vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
				end
			end,
		})
	end,
}
