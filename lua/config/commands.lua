vim.api.nvim_create_user_command("X", function()
	-- Check that the current buffer is saved

	if vim.bo.modified then
		require("notify")("File not saved. Please save the buffer first.", "warn", { title = "Cannot close the tab" })
	else
		local ok, _ = pcall(function()
			vim.schedule(vim.cmd([[bd]])) -- close buffer
		end)

		-- if not ok then
		-- 	require("notify")('Please save the file with command ":w"', "info", { title = "Close action failed" })
		-- end
	end
end, {})
