-- Extra extension -> filetype mappings.
-- RmlUi documents/stylesheets are close enough to HTML/CSS that reusing those
-- filetypes gives working syntax, treesitter highlighting and indent for free.
vim.filetype.add({
  extension = {
    rml = "html",
    rcss = "css",
  },
})
