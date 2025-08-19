return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      -- LSP Servers
      "typescript-language-server",
      "vue-language-server",
      "json-lsp",
      "css-lsp",
      "tailwindcss-language-server",
      "emmet-ls",
      "gopls",

      -- Formatters & Linters
      "prettier",
      "eslint_d",
      "gofumpt",
      "goimports",

      -- Debuggers
      "delve", -- Go debugger
    })
  end,
}