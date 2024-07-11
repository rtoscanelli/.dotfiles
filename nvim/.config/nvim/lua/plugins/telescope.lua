return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true
                    },
                },
                extensions = {
                    ['ui-select'] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                },
                defaults = {
                    file_ignore_patterns = { ".git" },
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
