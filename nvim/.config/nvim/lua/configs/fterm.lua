local fterm = require("FTerm")
local add_command = vim.api.nvim_create_user_command

local gitui = fterm:new({cmd = "gitui"})
add_command('Git', function() gitui:toggle() end, {})
add_command('Term', function() fterm.toggle() end, {})
