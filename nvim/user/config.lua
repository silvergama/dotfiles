return {
  vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufRead' },
    {
      pattern = '.env*,.ocamlformat',
      callback = function()
        vim.o.filetype = 'config'
      end,
    }
  ),

  vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufRead' },
    {
      pattern = '*.lock,*.pbxproj',
      callback = function()
        vim.o.filetype = 'lock'
      end,
    }
  ),

  vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufRead' },
    {
      pattern = '*.c,*.cpp,*.cc,*.h,*.py,*.go',
      callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = false
      end,
    }
  ),

  vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufRead' },
    {
      pattern = '*.md,*.mmd,*.txt,*.markdown,*.multimarkdown',
      callback = function()
        vim.wo.wrap = true
      end
    }
  ),
  
  vim.api.nvim_create_autocmd(
    { 'BufWritePre' },
    {
      pattern = '*.go, *.lua',
      callback = function()
        vim.lsp.buf.format()
      end
    }
  ),

  vim.api.nvim_create_autocmd(
    'FileType',
    {
      pattern = 'qf',
      callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<CMD>cclose<CR>', { noremap = true })
      end,
    }
  ),
}
