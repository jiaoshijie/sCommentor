local _symbols = {
  lua = { prefix = '-- ', suffix = '' },
  vim = { prefix = '" ', suffix = '' },
  c = { prefix = '// ', suffix = ''},  -- { prefix = '/* ', suffix = ' */'}
  cpp = { prefix = '// ', suffix = '' },
  html = { prefix = '<!-- ', suffix = ' -->' },
  css = { prefix = '/* ', suffix = ' */' },
  javascript = { prefix = '// ', suffix = '' },
  typescript = { prefix = '// ', suffix = '' },
  python = { prefix = '# ', suffix = '' },
  make = { prefix = '# ', suffix = '' },
  sh = { prefix = '# ', suffix = '' },
  conf = { prefix = '# ', suffix = '' },
  tex = { prefix = '% ', suffix = '' },
}

return _symbols
