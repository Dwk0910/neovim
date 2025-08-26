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

mapKey("<leader>e", "<cmd>Neotree toggle<CR>", "n", { silent = true })
mapKey("<leader>ccc", "<cmd>CccPick<CR>", "n", { silent = true })

mapKey("F", function()
	if vim.bo.buftype == "" then
		vim.api.nvim_feedkeys(":bd\n", "n", false)
	end
end)

mapKey("<C-q>", function()
	if vim.bo.buftype == "" then
		vim.api.nvim_feedkeys(":wa | qa!\n", "n", false)
	else
		vim.api.nvim_feedkeys(":wqa\n", "n", false)
	end
end)

-- Move to next diagnostic item
mapKey("J", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "n", { silent = true })
mapKey("K", "<cmd>Lspsaga diagnostic_jump_next<CR>", "n", { silent = true })

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
