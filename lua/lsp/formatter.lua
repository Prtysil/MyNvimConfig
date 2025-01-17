-- stylua: ignore
return {
        "mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")
		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({ -- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,
				},
				c = {
					require("formatter.filetypes.c").clangformat,
				},
				cpp = {
					require("formatter.filetypes.cpp").clangformat,
				},
				verilog = {
					function()
						return {
							exe = "verible-verilog-format",
							args = { "--indentation_spaces 8", "-" },
							stdin = true,
						}
					end,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
					-- Remove trailing whitespace without 'sed'
					-- require("formatter.filetypes.any").substitute_trailing_whitespace,
				},
			},
		})

		-- Auto exec command FormatWrite while save the file
		-- More details see https://neovim.io/doc/user/autocmd.html#autocmd
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			-- Default is "*.*"
			-- pattern = { "*.h", "*.hpp", "*.c", "*.cpp", "*.py", "*.lua", "*.v", "CMakeLists.txt" },
			command = "FormatWrite",
		})
	end,
}
