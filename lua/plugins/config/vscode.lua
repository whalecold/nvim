vim.keymap.set('n', '<Leader>rs', function() require('dap.ext.vscode').load_launchjs(nil, nil) end)

-- load local vscode launch.js
-- TODO get current project path
local file =io.open("./.vscode/launch.js")
if file then
  require('dap.ext.vscode').load_launchjs(nil, nil)
  file:close()
end
