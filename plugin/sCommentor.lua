local opts = { silent = true, noremap = true }
local keymap = vim.keymap.set

keymap("n", "gc", function()
  require('sCommentor').Toggle_Comment(vim.v.count1)
end, opts)

keymap("v", "gc", [[:<C-U>lua require('sCommentor').Toggle_Comment(vim.fn.line("'>") - vim.fn.line("'<") + 1)<cr>]], opts)

-- TODO: can't use like this. `'>` `'<` `.` vim.fn.line() get wrong number, seem to be that these symbols are set only after vim has run the function.
-- keymap("v", "gc", function()
--  require('sCommentor').Toggle_Comment(vim.fn.line("'>") - vim.fn.line("'<") + 1)
-- end, opts)
