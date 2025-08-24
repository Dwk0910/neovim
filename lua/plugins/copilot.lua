return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		vim.cmd([[
            let g:copilot_status_show = v:false
        ]])
	end,
}
