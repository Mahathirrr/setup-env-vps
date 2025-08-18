return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      -- LSP Servers
      "html-lsp",
      "css-lsp",
      "lua-language-server",
      "tailwindcss-language-server",
      "typescript-language-server",
      "eslint-lsp",
      "json-lsp",
      "gopls",
      "pyright",
      "clangd",
      "jdtls",

      -- Formatters & Linters
      "prettier",
      "eslint_d",
      "gofumpt",
      "goimports",

      -- Debuggers
      "delve",
    })
  end,
}
