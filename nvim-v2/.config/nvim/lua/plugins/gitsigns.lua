return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        })
        vim.keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true, silent = true })
    end,
}
