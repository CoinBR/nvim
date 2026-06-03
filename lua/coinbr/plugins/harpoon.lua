return {
  'ThePrimeagen/harpoon', 
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()

    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {desc = "Harpoon Menu"})
    vim.keymap.set("n", "<leader>H", mark.add_file, {desc = "Harpoon this"})
    
    vim.keymap.set("n", "<M-h>", function() ui.nav_file(1) end, {desc = "1st Harpoon"})
    vim.keymap.set("n", "<M-j>", function() ui.nav_file(2) end, {desc = "2st Harpoon"})
    vim.keymap.set("n", "<M-k>", function() ui.nav_file(3) end, {desc = "3rd Harpoon"})
    vim.keymap.set("n", "<M-l>", function() ui.nav_file(4) end, {desc = "3rd Harpoon"})

    vim.keymap.set("n", "<leader>alth", function() ui.nav_file(1) end, {desc = "1st Harpoon"})
    vim.keymap.set("n", "<leader>altj", function() ui.nav_file(2) end, {desc = "2st Harpoon"})
    vim.keymap.set("n", "<leader>altk", function() ui.nav_file(3) end, {desc = "3rd Harpoon"})
    vim.keymap.set("n", "<leader>altl", function() ui.nav_file(4) end, {desc = "3rd Harpoon"})

  end
}
