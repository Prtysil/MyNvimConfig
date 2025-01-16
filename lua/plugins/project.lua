return {
	"ahmedkhalf/project.nvim",

	config = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below

			detection_methods = { "pattern" }, -- 仅使用模式检测
			silent_chdir = false, -- 禁用静默切换目录
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		})
	end,
}
