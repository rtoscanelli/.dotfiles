return {
	"chrisgrieser/nvim-scissors",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>se", function()
			require("scissors").editSnippet()
		end)

		vim.keymap.set({ "n", "x" }, "<leader>sa", function()
			require("scissors").addNewSnippet()
		end)
	end,
}
