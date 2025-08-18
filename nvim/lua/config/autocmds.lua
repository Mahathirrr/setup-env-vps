-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.cmd([[
augroup _general_settings
  autocmd!
  autocmd BufWinEnter * :set textwidth=85
augroup END

augroup javaindent
  autocmd FileType java setlocal expandtab
  autocmd FileType java setlocal tabstop=4
  autocmd FileType java setlocal shiftwidth=4
augroup END

" augroup typescriptindent
"   autocmd FileType typescript setlocal expandtab
"   autocmd FileType typescript setlocal tabstop=2
"   autocmd FileType typescript setlocal shiftwidth=2
" augroup END

augroup cindent
  autocmd FileType c setlocal expandtab
  autocmd FileType c setlocal tabstop=4
  autocmd FileType c setlocal shiftwidth=4
augroup END

augroup cppindent
  autocmd FileType cpp setlocal expandtab
  autocmd FileType cpp setlocal tabstop=4
  autocmd FileType cpp setlocal shiftwidth=4
augroup END

augroup phpindent
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal tabstop=4
  autocmd FileType php setlocal shiftwidth=4
augroup END

augroup pythonindent
  autocmd FileType python setlocal expandtab
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal shiftwidth=4
augroup END

augroup goindent
  autocmd FileType go setlocal expandtab
  autocmd FileType go setlocal tabstop=4
  autocmd FileType go setlocal shiftwidth=4
augroup END

augroup javascriptindent
  autocmd FileType javascript setlocal expandtab
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2
augroup END

augroup cssindent
  autocmd FileType css setlocal expandtab
  autocmd FileType css setlocal tabstop=2
  autocmd FileType css setlocal shiftwidth=2
augroup END

augroup htmlindent
  autocmd FileType html setlocal expandtab
  autocmd FileType html setlocal tabstop=2
  autocmd FileType html setlocal shiftwidth=2
augroup END

augroup reactindent
  autocmd FileType javascriptreact setlocal expandtab
  autocmd FileType javascriptreact setlocal tabstop=2
  autocmd FileType javascriptreact setlocal shiftwidth=2
augroup END
]])

vim.cmd([[
  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion'}} })
]])

-- vim.cmd([[
-- augroup kitty_mp
--     autocmd!
--     au VimLeave * :silent !kitty @ set-spacing padding=25
--     au VimEnter * :silent !kitty @ set-spacing padding=0
-- augroup END
-- ]])
--
--
-- vim.cmd([[
-- augroup go_tmpl
--     autocmd!
--     autocmd BufRead,BufNewFile *.templ set filetype=gotmpl
-- augroup END
-- ]])

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.templ" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

-- Add these autocmd events for toggling neovim kitty padding
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "silent !kitty @ set-spacing padding=20",
})

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  command = "silent !kitty @ set-spacing padding=0",
})
