return
{
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  lazy = false, -- NOTE: NO NEED to lazy load with this plugin
  keys = {
    { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
    { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
    { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
    { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },
    { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
    { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
  },
  init = function()
    -- The plugin recommends these settings
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    vim.g.neominimap = {
      auto_enable = true,

      -- Thin-bar mode. The minimap is braille-only by design (it packs a 4x2
      -- block of source characters into one glyph), so at 2 columns the dots
      -- stop being readable and it reads as a colour strip instead: treesitter
      -- tints comments/strings/keywords, diagnostics wash the line background.
      --
      -- One minimap column spans 2 dots, so visible source columns =
      -- width * 2 * x_multiplier. 2 * 2 * 40 keeps a full 160-column line in
      -- view; without raising x_multiplier the bar would only reflect the
      -- first 16 characters of each line and everything past that is dropped.
      x_multiplier = 40,
      float = { minimap_width = 2 },
      split = { minimap_width = 2, fix_width = true },

      -- Sources of colour worth keeping in a 2-column bar.
      treesitter = { enabled = true },
      diagnostic = { enabled = true, mode = "line" },

      -- These render into the sign column, which would cost more width than
      -- the bar itself.
      git = { enabled = false },
      search = { enabled = false },
      mark = { enabled = false },
    }
  end,
  config = function()
    -- Upstream bug: minimap highlights starting at the first byte of a line
    -- are silently dropped, so an unindented `# comment` / `-- comment` gets
    -- no colour at all while an indented one does.
    --
    -- map/treesitter.lua resolves a highlight's start via
    -- byte_index_to_utf8_index(0, ...) -> 0, then indexes the 1-indexed
    -- codepoints_pos table at [0], gets nil, and skips the highlight. Byte 0
    -- is simply the first visible column, so seed index 0 accordingly.
    -- codepoints_pos has exactly one caller, so this stays contained.
    local text = require("neominimap.map.text")
    local codepoints_pos = text.codepoints_pos
    text.codepoints_pos = function(...)
      local pos = codepoints_pos(...)
      if pos[0] == nil then
        pos[0] = 1
      end
      return pos
    end
  end,
}
