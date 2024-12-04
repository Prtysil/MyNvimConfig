return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },

  keys = {
        -- load the session for the current directory
        { mode = "n", "<leader>qs", function() require("persistence").load() end, desc = "load"},
        -- select a session to load
        { mode = "n", "<leader>qS", function() require("persistence").select() end, desc = "select"},
        -- load the last session
        { mode = "n", "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "load" },
        -- stop Persistence => session won't be saved on exit
        { mode = "n", "<leader>qd", function() require("persistence").stop() end, desc = "stop" },
  },
}
