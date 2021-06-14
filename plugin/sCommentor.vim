nnoremap <silent> gc :<C-u>lua
      \ require('sCommentor').Toggle_Comment(vim.v.count1)<cr>
vnoremap <silent> gc :<C-u>lua require('sCommentor').Toggle_Comment(
      \ vim.fn.line("'>") - vim.fn.line("'<") + 1)<cr>
