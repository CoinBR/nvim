-- Auto close the companion diff buffer when one side is closed
local diff_windows = {}

vim.api.nvim_create_autocmd("WinLeave", {
  pattern = "*",
  callback = function()
    local win = vim.api.nvim_get_current_win()
    if not vim.api.nvim_get_option_value("diff", { win = win }) then
      return
    end

    local tabpage = vim.api.nvim_win_get_tabpage(win)
    local wins = {}

    for _, tab_win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
      if vim.api.nvim_win_is_valid(tab_win) and vim.api.nvim_get_option_value("diff", { win = tab_win }) then
        table.insert(wins, tab_win)
      end
    end

    diff_windows[win] = {
      tabpage = tabpage,
      wins = wins,
    }
  end,
})

vim.api.nvim_create_autocmd("WinClosed", {
  pattern = "*",
  callback = function(args)
    local closed_win = tonumber(args.match)
    local diff_state = closed_win and diff_windows[closed_win]
    diff_windows[closed_win] = nil

    if not diff_state then
      return
    end

    vim.schedule(function()
      local tabpage = diff_state.tabpage
      if not vim.api.nvim_tabpage_is_valid(tabpage) then
        return
      end

      local diff_wins = {}

      for _, win in ipairs(diff_state.wins) do
        if win ~= closed_win and vim.api.nvim_win_is_valid(win) then
          table.insert(diff_wins, win)
        end
      end

      if #diff_wins == 1 then
        vim.api.nvim_win_close(diff_wins[1], true)
      end
    end)
  end,
})
