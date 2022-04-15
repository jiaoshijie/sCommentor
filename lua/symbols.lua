local _symbols = {
  lua = { prefix = '-- ', suffix = '' },
  haskell = { prefix = '-- ', suffix = '' },
  vim = { prefix = '" ', suffix = '' },
  c = { prefix = '// ', suffix = ''},  -- { prefix = '/* ', suffix = ' */'}
  cpp = { prefix = '// ', suffix = '' },
  go = { prefix = '// ', suffix = '' },
  html = { prefix = '<!-- ', suffix = ' -->' },
  css = { prefix = '/* ', suffix = ' */' },
  javascript = { prefix = '// ', suffix = '' },
  typescript = { prefix = '// ', suffix = '' },
  python = { prefix = '# ', suffix = '' },
  make = { prefix = '# ', suffix = '' },
  sh = { prefix = '# ', suffix = '' },
  conf = { prefix = '# ', suffix = '' },
  tex = { prefix = '% ', suffix = '' },
  lisp = { prefix = ';; ', suffix = '' },
  rust = { prefix = '// ', suffix = '' },
}

return _symbols
