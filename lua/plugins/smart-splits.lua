return {
  "mrjones2014/smart-splits.nvim",
  opts = {},
  keys = {
    { "<c-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move to left split/pane" },
    { "<c-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move to split/pane below" },
    { "<c-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move to split/pane above" },
    { "<c-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split/pane" },
    { "<c-\\>", function() require("smart-splits").move_cursor_previous() end, desc = "Move to previous split/pane" },
  },
}
