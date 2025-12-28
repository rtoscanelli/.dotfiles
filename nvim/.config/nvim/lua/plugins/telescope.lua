local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then return tail end
  return string.format("%s\t\t%s", tail, parent)
end

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
                        hidden = true,
                        path_display = filenameFirst
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
