require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", function()
  require("conform").format { lsp_formar = "last", async = true }
  -- require("conform").format { lsp_fallback = true, async = true }
end, { desc = "general format file" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
