-- local discipline = require("craftzdog.discipline")

-- discipline.cowboy()

-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"12p')
keymap.set("n", "<Leader>P", '"12P')
keymap.set("v", "<Leader>p", '"12p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Normal mode
keymap.set("n", "H", "<C-u>zz", opts) -- Half page up + center cursor
keymap.set("n", "L", "<C-d>zz", opts) -- Half page down + center cursor

-- Visual mode
keymap.set("v", "H", "<C-u>", opts) -- Half page up in visual mode
keymap.set("v", "L", "<C-d>", opts) -- Half page down in visual mode

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window

-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Insert --
-- Press jk fast to exit insert mode
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", "kj", "<ESC>", opts)

-- Diagnostics
keymap.set("n", "<C-M-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- LSP Code Actions
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

keymap.set("n", "<leader>r", function()
  require("emha.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
  require("emha.lsp").toggleInlayHints()
end)

-- TailwindCSS Fold Toggle
keymap.set("n", "<leader>tw", ":TailwindFoldToggle<CR>", { desc = "Toggle Tailwind class concealing", silent = true })

-- CSV View Toggle
keymap.set("n", "<leader>cv", ":CsvViewToggle<CR>", { desc = "Toggle CSV view", silent = true })

-- Molten config
keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
keymap.set("n", "<leader>ev", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "evaluate visual selection" })
keymap.set("n", "<leader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show/enter output" })

keymap.set("n", "<leader>ip", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
    venv = string.match(venv, "/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    vim.cmd("MoltenInit python3")
  end
end, { desc = "Initialize Molten for python3", silent = true })

-- Goto Preview mappings
keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
keymap.set("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
keymap.set("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", opts)
keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)

-- Keymapping untuk ToggleTerm
keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
