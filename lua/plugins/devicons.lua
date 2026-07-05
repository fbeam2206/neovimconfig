return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local devicons = require("nvim-web-devicons")
    -- Zed-style monochrome icons: one muted color for every file type
    -- instead of per-language colors. \u{f016} is the outline file glyph.
    devicons.set_default_icon("\u{f016}", "#9E9E9E")
    devicons.setup({
      color_icons = false,
    })
  end,
}
