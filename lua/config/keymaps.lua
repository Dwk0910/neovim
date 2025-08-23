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
