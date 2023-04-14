local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
        },
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
}

vim.keymap.set('n', '<leader>ff',
    function()
        builtin.find_files({
            no_ignore = false,
            hidden = true
        })
    end,
    { desc = '[F]ind [F]iles' }
)


vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>gn', builtin.git_files, { desc = "Git Files" })
vim.keymap.set('n', '<leader>e',
    function()
        builtin.diagnostics()
    end,
    { desc = 'Diagnostics' }
)

vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "Open buffers" })
