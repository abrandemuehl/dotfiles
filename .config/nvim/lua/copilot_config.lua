require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require("copilot_cmp").setup()

require("CopilotChat").setup {
  debug = false, -- Enable debugging
  window = {
    layout = 'float',
  },
  context = 'buffers',
}
