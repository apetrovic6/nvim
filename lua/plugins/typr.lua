return {
  "nvzone/typr",
  lazy = true,
  dependencies = "nvzone/volt",
  opts = {},
  config = {
    mode = "phrases", -- words, phrases
    winlayout = "responsive",
    kblayout = "qwerty",
    wpm_goal = 100,
    numbers = false,
    symbols = false,
    random = false,
    phrases = nil, -- can be a table of strings
    insert_on_start = true,
    stats_filepath = vim.fn.stdpath("data") .. "/typrstats",
    mappings = nil,
    -- or function(buf) end
    -- mappings = function(buf)
    --  vim.keymap.set("n", "a, anything, { buffer = buf })
    -- end,
    --   on_attach = --nil,
    --     function(buf) end
    on_attach = function(buf)
      vim.b[buf].minipairs_disable = true
    end,
  },
  cmd = { "Typr", "TyprStats" },
}
