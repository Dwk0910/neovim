local mapKey = require("utils.KeyMapper").mapKey

-- default keymappings
mapKey("<C-s>", ":w<cr>")

-- pane navigation
mapKey("<M-h>", "<C-w>h") -- Left
mapKey("<M-l>", "<C-w>l") -- right
mapKey("<M-j>", "<C-w>j") -- Down
mapKey("<M-k>", "<C-w>k") -- Up

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- Key mappings
mapKey("H", "<cmd>Lspsaga hover_doc<CR>")
mapKey("K", "<cmd>Lspsaga show_line_diagnostics<CR>")
mapKey("<leader>gd", "<cmd>Lspsaga peek_definition<CR>")
mapKey("<leader>ca", "<cmd>Lspsaga code_action<CR>")
mapKey("<leader>rn", "<cmd>Lspsaga rename<CR>")

mapKey("F", ":bd<CR>")
mapKey("<M-f>", ":bd!<CR>")
mapKey("<C-q>", ":wqa<CR>")

-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--     callback = function(ev)
--         local map = vim.keymap.set
--         local opts = { buffer = ev.buf }
--         map('n', '<leader>gd', vim.lsp.buf.definition, opts)
--         map('n', '<leader>rn', vim.lsp.buf.rename, opts)
--         map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--         map('n', 'H', vim.lsp.buf.hover, opts)
--     end
-- })
