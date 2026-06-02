return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files in git project' })
    vim.keymap.set('n', '<leader>ctrlp', builtin.find_files, { desc = 'Find files in project' })
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find files in project' })

    vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Find files in git repo' })

    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end, {desc = "Search text in project"})

    vim.keymap.set('n', '<C-S-f>', function()
      builtin.live_grep()
    end, { desc = 'Search text in project' })

  end
}
