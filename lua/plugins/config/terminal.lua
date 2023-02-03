local a = vim.api

local Terminal = {}

function Terminal.buildin_terminal()

  local pos = a.nvim_win_get_cursor(0)

  local width = a.nvim_win_get_width(0)
  local height = a.nvim_win_get_height(0)

  a.nvim_open_win(pos[1], true, {
      relative = "win",
      win = 0,
      width = math.floor(width / 2),
      height = math.floor(height / 2),
      col = math.floor(width / 4),
      row = math.floor(height / 8),
      border = "single"
    })
  vim.cmd(":terminal")
end

return Terminal
