return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    local opencode = require("opencode")
    local opencode_cmd = "opencode --port"
    local terminal_opts = {
      win = {
        position = "right",
        width = 0.42,
        enter = false,
        on_win = function(win)
          require("opencode.terminal").setup(win.win)
        end,
      },
    }

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, terminal_opts)
        end,
        stop = function()
          local terminal = require("snacks.terminal").get(opencode_cmd, terminal_opts)
          if terminal then
            terminal:close()
          end
        end,
        toggle = function()
          require("snacks.terminal").toggle(opencode_cmd, terminal_opts)
        end,
      },
    }

    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      opencode.ask("@this ", { submit = true })
    end, { desc = "Ask OpenCode" })

    vim.keymap.set("n", "<leader>ot", function()
      opencode.toggle()
    end, { desc = "Toggle OpenCode" })

    vim.keymap.set("n", "<leader>oo", function()
      opencode.select()
    end, { desc = "OpenCode actions" })

    vim.keymap.set({ "n", "x" }, "<leader>or", function()
      opencode.prompt("review")
    end, { desc = "Review with OpenCode" })

    vim.keymap.set({ "n", "x" }, "<leader>oi", function()
      opencode.prompt("implement")
    end, { desc = "Implement with OpenCode" })

    vim.keymap.set({ "n", "x" }, "<leader>of", function()
      opencode.prompt("fix")
    end, { desc = "Fix with OpenCode" })

    vim.keymap.set({ "n", "x" }, "go", function()
      return opencode.operator("@this ")
    end, { desc = "Send range to OpenCode", expr = true })

    vim.keymap.set("n", "goo", function()
      return opencode.operator("@this ") .. "_"
    end, { desc = "Send line to OpenCode", expr = true })
  end,
}
