vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line = mark[1]
    local col = mark[2]

    if line > 0 and line <= vim.api.nvim_buf_line_count(0) then
      vim.schedule(function()
        vim.api.nvim_win_set_cursor(0, { line, col })
        vim.cmd("normal! zz")
      end)
    end
  end,
})
