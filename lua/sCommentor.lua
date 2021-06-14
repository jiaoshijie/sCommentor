local vf = vim.fn
local _M = {}

local Len = function(str)
  return str.len(str)
end

local DetectMinIndent = function(Start, End)
  local min_indent = vf.indent(Start)
  local tmp = Start + 1
  while tmp <= End do
    if min_indent > vf.indent(tmp) then
      min_indent = vf.indent(tmp)
    end
    tmp = tmp + 1
  end
  return min_indent
end

local InsertOrRemoveComment = function(lnum, line, indent, is_remove, symbol)
  if is_remove then  -- remove
    local indent_spaces = vf.indent(lnum) ~= 0 and line.sub(line, 1, vf.indent(lnum)) or ''
    vf.setline(lnum,
              indent_spaces .. line.sub(line, vf.indent(lnum) + Len(symbol['prefix']) + 1,
              Len(line) - Len(symbol['suffix'])))
  else  -- insert
    local indent_spaces = indent ~= 0 and line.sub(line, 1, indent) or ''
    vf.setline(lnum, indent_spaces .. symbol['prefix'] .. line.sub(line, indent + 1, -1) .. symbol['suffix'])
  end
end

_M.Toggle_Comment = function(count)
  local symbol = require('symbols')[vim.bo.filetype]
  if symbol == nil then
    vim.api.nvim_err_writeln("simpleCommenter doesn't work for filetype `" .. vim.bo.filetype .. "` yet.")
    return
  end
  local line_start = vf.line('.')
  local line_end =  line_start + count - 1 > vf.line('$') and vf.line('$') or line_start + count - 1
  local min_indent = DetectMinIndent(line_start, line_end)
  local lines = line_start == line_end and { vf.getline(line_start) } or vf.getline(line_start, line_end)
  local is_remove = lines[1].sub(lines[1],
                    vf.indent(line_start) + 1,
                    vf.indent(line_start) + Len(symbol['prefix'])) == symbol['prefix']

  for _, line in pairs(lines) do
    if Len(line) > 0 then
      InsertOrRemoveComment(line_start, line, min_indent, is_remove, symbol)
    end
    line_start = line_start + 1
  end
end

return _M
