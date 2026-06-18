vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.cmd.source('~/.vimrc')

require("config.lazy")

vim.cmd.colorscheme "everforest"

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.git_files, { desc = 'Telescope find files' })
local function live_grep_git_root()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        telescope.live_grep()
        return
    end
    telescope.live_grep({ cwd = git_root })
end
vim.keymap.set('n', '<C-d>', live_grep_git_root, { desc = 'Telescope live grep (Git Root)' })
