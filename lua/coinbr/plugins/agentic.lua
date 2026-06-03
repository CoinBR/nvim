return {
  "carlos-algms/agentic.nvim",
  opts = {
    provider = "codex-acp",
    -- Optional: set provider binary path if not on PATH
    -- acp_providers = {
    --   ["codex-acp"] = {
    --     command = "/home/youruser/.local/bin/codex-acp",
    --     args = {},
    --     env = { OPENAI_API_KEY = os.getenv("OPENAI_API_KEY") },
    --   },
    -- },
    windows = {
      position = "right", -- "right" | "left" | "bottom"
      width = "40%",
      height = "30%",
    },
  },
  keys = {
    -- Ctrl+L: Toggle chat (normal & insert)
    {
      "<C-l>",
      function()
        require("agentic").toggle()
      end,
      mode = { "n", "i" },
      desc = "Toggle Agentic Chat (Ctrl+L)",
    },

    -- Ctrl+L in visual: add selection to context and open chat (send selection)
    {
      "<C-l>",
      function()
        require("agentic").add_selection_or_file_to_context()
        require("agentic").toggle()
      end,
      mode = { "v" },
      desc = "Send selection to Agentic and open chat (Ctrl+L)",
    },

    -- Ctrl+Shift+L: New Agentic session
    {
      "<C-S-l>",
      function()
        require("agentic").new_session()
      end,
      mode = { "n", "v", "i" },
      desc = "New Agentic session (Ctrl+Shift+L)",
    },
  },
}
