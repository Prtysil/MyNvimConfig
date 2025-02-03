vim.api.nvim_create_autocmd("FileType", {
	pattern = { "verilog", "systemverilog" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt.softtabstop = 4 -- number of spacesin tab when editing
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
	end,
})
