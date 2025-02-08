vim.api.nvim_create_autocmd("FileType", {
	pattern = { "verilog", "systemverilog" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt.softtabstop = 2 -- number of spacesin tab when editing
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})
