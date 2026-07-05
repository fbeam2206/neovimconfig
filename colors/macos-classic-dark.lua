-- macOS Classic Dark
-- Port of the Zed theme "macOS Classic Dark"
-- https://github.com/huacnlee/zed-theme-macos-classic
--
-- Alpha-blended values (Neovim has no per-highlight alpha):
--   selection  #72cffe @ 24% over #131313 -> #2A404B
--   search     #fbee5c @ 51% over #131313 -> #898338

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd.syntax("reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "macos-classic-dark"

local p = {
	-- core
	bg = "#131313", -- editor.background
	fg = "#DDDDDD", -- editor.foreground
	ui_fg = "#CACCCA", -- text
	muted = "#9E9E9E", -- text.muted
	gutter = "#8F8F8F", -- editor.line_number
	panel = "#1E1D1E", -- surface / panel background
	status = "#272727", -- status_bar / active line
	tabbar = "#232323", -- tab_bar background
	titlebar = "#323232", -- title_bar background
	element = "#373636", -- element.background
	el_hover = "#353436", -- element.hover
	el_sel = "#474646", -- ghost_element.selected
	border = "#404040", -- border
	border_v = "#3A3A3A", -- border.variant / wrap guide
	scrollbar = "#4C4D4D",

	cursor = "#72cffe", -- player 1 cursor
	selection = "#2A404B", -- player 1 selection (blended)
	search = "#898338", -- search.match_background (blended)
	search_hi = "#fbee5c", -- search.active_match_background

	-- syntax
	keyword = "#c28b12",
	func = "#fdd888",
	string = "#62BA46",
	const = "#E1D797", -- number / boolean / constant / literal
	type = "#c75828",
	attr = "#e7cb8f",
	tag = "#b5af9a", -- tag / constructor
	var_special = "#E19773", -- self / this
	link = "#307BF6",
	link_uri = "#7faef9",
	predictive = "#5D5945", -- ghost / predicted text

	-- status
	red = "#c74028",
	red_br = "#e7988a",
	green = "#62BA46",
	blue = "#6d94e9", -- created
	changed = "#B0A878", -- modified
	conflict = "#D2602D",
	err_bg = "#46190C",
	warn_bg = "#3A310E",
	info_bg = "#0C194D",
	add_bg = "#0C4619",
	text_bg = "#574A15", -- DiffText (brightened modified bg)
}

-- Transparent pane backgrounds: editor, sidebars, floats, popup menu and
-- status/tab bars let the terminal background show through. Set to false
-- for Zed's original solid look.
local transparent = true
local bg_main = transparent and "NONE" or p.bg
local bg_panel = transparent and "NONE" or p.panel
local bg_status = transparent and "NONE" or p.status
local bg_tabbar = transparent and "NONE" or p.tabbar

local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- ────────────────────────────── editor UI ──────────────────────────────
hl("Normal", { fg = p.fg, bg = bg_main })
hl("NormalNC", { fg = p.fg, bg = bg_main })
hl("NormalFloat", { fg = p.ui_fg, bg = bg_panel })
hl("FloatBorder", { fg = p.border, bg = bg_panel })
hl("FloatTitle", { fg = p.fg, bg = bg_panel, bold = true })
hl("Cursor", { fg = p.bg, bg = p.cursor })
hl("lCursor", { link = "Cursor" })
hl("TermCursor", { link = "Cursor" })
hl("CursorLine", { bg = p.status })
hl("CursorColumn", { bg = p.status })
hl("CursorLineNr", { fg = p.muted, bg = p.status })
hl("LineNr", { fg = p.gutter })
hl("SignColumn", { bg = bg_main })
hl("ColorColumn", { bg = p.panel })
hl("Conceal", { fg = p.muted })
hl("Visual", { bg = p.selection })
hl("VisualNOS", { bg = p.selection })
hl("Search", { bg = p.search })
hl("IncSearch", { fg = p.bg, bg = p.search_hi })
hl("CurSearch", { link = "IncSearch" })
hl("Substitute", { link = "IncSearch" })
hl("MatchParen", { bg = p.el_sel, bold = true })
hl("Whitespace", { fg = p.border_v })
hl("NonText", { fg = p.border_v })
hl("SpecialKey", { fg = p.muted })
hl("EndOfBuffer", { fg = p.border_v })
hl("WinSeparator", { fg = p.border_v })
hl("StatusLine", { fg = p.ui_fg, bg = bg_status })
hl("StatusLineNC", { fg = p.muted, bg = bg_tabbar })
hl("TabLine", { fg = p.muted, bg = bg_tabbar })
hl("TabLineSel", { fg = p.fg, bg = bg_main })
hl("TabLineFill", { bg = bg_tabbar })
hl("WinBar", { fg = p.ui_fg, bg = bg_main })
hl("WinBarNC", { fg = p.muted, bg = bg_main })
hl("Pmenu", { fg = p.ui_fg, bg = bg_panel })
hl("PmenuSel", { bg = p.el_sel })
hl("PmenuKind", { fg = p.muted, bg = bg_panel })
hl("PmenuExtra", { fg = p.muted, bg = bg_panel })
hl("PmenuSbar", { bg = bg_panel })
hl("PmenuThumb", { bg = p.scrollbar })
hl("WildMenu", { link = "PmenuSel" })
hl("Folded", { fg = p.muted, bg = p.panel })
hl("FoldColumn", { fg = p.muted })
hl("Directory", { fg = p.link_uri })
hl("Title", { fg = p.func, bold = true })
hl("ErrorMsg", { fg = p.red })
hl("WarningMsg", { fg = p.keyword })
hl("ModeMsg", { fg = p.muted })
hl("MoreMsg", { fg = p.blue })
hl("Question", { fg = p.blue })
hl("QuickFixLine", { bg = p.selection })
hl("SpellBad", { undercurl = true, sp = p.red })
hl("SpellCap", { undercurl = true, sp = p.keyword })
hl("SpellLocal", { undercurl = true, sp = p.blue })
hl("SpellRare", { undercurl = true, sp = p.const })

-- ────────────────────────────── syntax ──────────────────────────────
hl("Comment", { fg = p.muted })
hl("Constant", { fg = p.const })
hl("String", { fg = p.string })
hl("Character", { fg = p.string })
hl("Number", { fg = p.const })
hl("Float", { link = "Number" })
hl("Boolean", { fg = p.const })
hl("Identifier", { fg = p.fg })
hl("Function", { fg = p.func })
hl("Statement", { fg = p.keyword })
hl("Conditional", { link = "Statement" })
hl("Repeat", { link = "Statement" })
hl("Label", { link = "Statement" })
hl("Keyword", { fg = p.keyword })
hl("Exception", { link = "Statement" })
hl("Operator", { fg = p.fg })
hl("PreProc", { fg = p.keyword })
hl("Include", { link = "PreProc" })
hl("Define", { link = "PreProc" })
hl("Macro", { link = "PreProc" })
hl("PreCondit", { link = "PreProc" })
hl("Type", { fg = p.type })
hl("StorageClass", { link = "Type" })
hl("Structure", { link = "Type" })
hl("Typedef", { link = "Type" })
hl("Special", { fg = p.const })
hl("SpecialChar", { fg = p.string })
hl("Tag", { fg = p.tag })
hl("Delimiter", { fg = p.ui_fg })
hl("SpecialComment", { fg = p.muted })
hl("Debug", { fg = p.conflict })
hl("Underlined", { underline = true })
hl("Error", { fg = p.red })
hl("Todo", { fg = p.bg, bg = p.func, bold = true })

-- ────────────────────────────── treesitter ──────────────────────────────
hl("@attribute", { fg = p.attr })
hl("@boolean", { fg = p.const })
hl("@constant", { fg = p.const })
hl("@constant.builtin", { fg = p.const })
hl("@constant.macro", { fg = p.const })
hl("@number", { fg = p.const })
hl("@comment", { fg = p.muted })
hl("@comment.documentation", { fg = p.muted })
hl("@comment.todo", { link = "Todo" })
hl("@comment.error", { fg = p.red, bold = true })
hl("@comment.warning", { fg = p.keyword, bold = true })
hl("@comment.note", { fg = p.blue, bold = true })
hl("@constructor", { fg = p.tag })
hl("@function", { fg = p.func })
hl("@function.builtin", { fg = p.func })
hl("@function.call", { fg = p.func })
hl("@function.method", { fg = p.func })
hl("@function.macro", { fg = p.func })
hl("@keyword", { fg = p.keyword })
hl("@keyword.function", { fg = p.keyword })
hl("@keyword.operator", { fg = p.keyword })
hl("@keyword.return", { fg = p.keyword })
hl("@keyword.import", { fg = p.keyword })
hl("@label", { fg = p.keyword })
hl("@operator", { fg = p.fg })
hl("@punctuation.bracket", { fg = p.ui_fg })
hl("@punctuation.delimiter", { fg = p.ui_fg })
hl("@punctuation.special", { fg = p.const })
hl("@string", { fg = p.string })
hl("@string.escape", { fg = p.string })
hl("@string.regexp", { fg = p.string })
hl("@string.special", { fg = p.const })
hl("@string.special.symbol", { fg = p.const })
hl("@string.special.url", { fg = p.link_uri, italic = true })
hl("@tag", { fg = p.tag })
hl("@tag.attribute", { fg = p.attr })
hl("@tag.delimiter", { fg = p.ui_fg })
hl("@type", { fg = p.type })
hl("@type.builtin", { fg = p.type })
hl("@type.definition", { fg = p.type })
hl("@module", { fg = p.fg })
hl("@property", { fg = p.ui_fg })
hl("@variable", { fg = p.fg })
-- Zed captures `this`/`self` as variable.special (salmon) in TS/JS/Rust/
-- Python, but C++ captures `this` as variable.builtin, which this theme
-- leaves at the editor foreground.
hl("@variable.builtin", { fg = p.var_special })
hl("@variable.builtin.cpp", { fg = p.fg })
hl("@variable.member", { fg = p.ui_fg })
hl("@variable.parameter", { fg = p.fg })
hl("@variable.parameter.builtin", { fg = p.var_special })

-- markup (markdown & friends)
hl("@markup.heading", { fg = p.func, bold = true })
hl("@markup.link", { fg = p.link })
hl("@markup.link.label", { fg = p.link })
hl("@markup.link.url", { fg = p.link_uri, italic = true })
hl("@markup.raw", { fg = p.const })
hl("@markup.raw.block", { fg = p.const })
hl("@markup.italic", { italic = true })
hl("@markup.strong", { bold = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.list", { fg = p.keyword })
hl("@markup.quote", { fg = p.muted })
hl("@diff.plus", { fg = p.green })
hl("@diff.minus", { fg = p.red })
hl("@diff.delta", { fg = p.changed })

-- ────────────────────────────── LSP ──────────────────────────────
hl("@lsp.type.comment", { link = "@comment" })
hl("@lsp.type.keyword", { link = "@keyword" })
hl("@lsp.type.function", { link = "@function" })
hl("@lsp.type.method", { link = "@function.method" })
hl("@lsp.type.type", { link = "@type" })
hl("@lsp.type.class", { link = "@type" })
hl("@lsp.type.struct", { link = "@type" })
hl("@lsp.type.enum", { link = "@type" })
hl("@lsp.type.interface", { link = "@type" })
hl("@lsp.type.decorator", { link = "@attribute" })
hl("@lsp.type.macro", { link = "@function.macro" })
hl("@lsp.type.property", { link = "@property" })
hl("LspReferenceText", { bg = p.el_hover })
hl("LspReferenceRead", { bg = p.el_hover })
hl("LspReferenceWrite", { bg = p.el_hover })
hl("LspInlayHint", { fg = p.predictive, italic = true })
hl("LspSignatureActiveParameter", { bg = p.element, bold = true })
hl("LspCodeLens", { fg = p.predictive })

hl("DiagnosticError", { fg = p.red })
hl("DiagnosticWarn", { fg = p.keyword })
hl("DiagnosticInfo", { fg = p.blue })
hl("DiagnosticHint", { fg = p.muted })
hl("DiagnosticOk", { fg = p.green })
hl("DiagnosticVirtualTextError", { fg = p.red, bg = p.err_bg })
hl("DiagnosticVirtualTextWarn", { fg = p.changed, bg = p.warn_bg })
hl("DiagnosticVirtualTextInfo", { fg = p.blue, bg = p.info_bg })
hl("DiagnosticVirtualTextHint", { fg = p.muted })
hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.keyword })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.muted })
hl("DiagnosticUnnecessary", { fg = p.predictive })
hl("DiagnosticDeprecated", { strikethrough = true, sp = p.red })

-- ────────────────────────────── diff / VCS ──────────────────────────────
hl("DiffAdd", { bg = p.add_bg })
hl("DiffChange", { bg = p.warn_bg })
hl("DiffDelete", { bg = p.err_bg, fg = "#57564F" })
hl("DiffText", { bg = p.text_bg })
hl("Added", { fg = p.blue }) -- Zed "created"
hl("Changed", { fg = p.changed })
hl("Removed", { fg = p.red })
hl("diffAdded", { link = "Added" })
hl("diffChanged", { link = "Changed" })
hl("diffRemoved", { link = "Removed" })
hl("GitSignsAdd", { fg = p.blue })
hl("GitSignsChange", { fg = p.changed })
hl("GitSignsDelete", { fg = p.red })

-- ────────────────────────────── plugins ──────────────────────────────
-- telescope
hl("TelescopeNormal", { fg = p.ui_fg, bg = bg_panel })
hl("TelescopeBorder", { fg = p.border, bg = bg_panel })
hl("TelescopePromptPrefix", { fg = p.keyword })
hl("TelescopeSelection", { bg = p.el_sel })
hl("TelescopeSelectionCaret", { fg = p.cursor, bg = p.el_sel })
hl("TelescopeMatching", { fg = p.search_hi, bold = true })
hl("TelescopeTitle", { fg = p.fg, bold = true })

-- neo-tree
hl("NeoTreeNormal", { fg = p.ui_fg, bg = bg_panel })
hl("NeoTreeNormalNC", { fg = p.ui_fg, bg = bg_panel })
hl("NeoTreeEndOfBuffer", { fg = transparent and p.bg or p.panel, bg = bg_panel })
hl("NeoTreeWinSeparator", { fg = p.border_v, bg = bg_panel })
hl("NeoTreeCursorLine", { bg = p.el_sel })
hl("NeoTreeRootName", { fg = p.fg, bold = true })
hl("NeoTreeDirectoryName", { fg = p.ui_fg })
hl("NeoTreeDirectoryIcon", { fg = p.muted }) -- Zed panel icons are monochrome
hl("NeoTreeFileIcon", { fg = p.muted })
hl("NeoTreeExpander", { fg = p.muted })
hl("NeoTreeFileName", { fg = p.ui_fg })
hl("NeoTreeIndentMarker", { fg = p.border_v })
hl("NeoTreeDotfile", { fg = p.muted })
hl("NeoTreeGitAdded", { fg = p.blue })
hl("NeoTreeGitUntracked", { fg = p.blue })
hl("NeoTreeGitModified", { fg = p.changed })
hl("NeoTreeGitDeleted", { fg = p.red })
hl("NeoTreeGitConflict", { fg = p.conflict })
hl("NeoTreeGitIgnored", { fg = p.muted })

-- nvim-cmp
hl("CmpItemAbbr", { fg = p.ui_fg })
hl("CmpItemAbbrDeprecated", { fg = p.muted, strikethrough = true })
hl("CmpItemAbbrMatch", { fg = p.cursor, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = p.cursor, bold = true })
hl("CmpItemMenu", { fg = p.muted })
hl("CmpItemKind", { fg = p.muted })
hl("CmpItemKindFunction", { fg = p.func })
hl("CmpItemKindMethod", { fg = p.func })
hl("CmpItemKindConstructor", { fg = p.tag })
hl("CmpItemKindClass", { fg = p.type })
hl("CmpItemKindStruct", { fg = p.type })
hl("CmpItemKindInterface", { fg = p.type })
hl("CmpItemKindEnum", { fg = p.type })
hl("CmpItemKindKeyword", { fg = p.keyword })
hl("CmpItemKindConstant", { fg = p.const })
hl("CmpItemKindValue", { fg = p.const })
hl("CmpItemKindVariable", { fg = p.fg })
hl("CmpItemKindField", { fg = p.ui_fg })
hl("CmpItemKindProperty", { fg = p.ui_fg })
hl("CmpItemKindText", { fg = p.ui_fg })
hl("CmpItemKindSnippet", { fg = p.const })
hl("CmpItemKindModule", { fg = p.attr })

-- indent-blankline
hl("IblIndent", { fg = p.status })
hl("IblWhitespace", { fg = p.status })
hl("IblScope", { fg = p.border })

-- which-key
hl("WhichKey", { fg = p.func })
hl("WhichKeyGroup", { fg = p.blue })
hl("WhichKeyDesc", { fg = p.ui_fg })
hl("WhichKeySeparator", { fg = p.muted })
hl("WhichKeyNormal", { bg = bg_panel })

-- alpha
hl("AlphaHeader", { fg = p.keyword })
hl("AlphaButtons", { fg = p.ui_fg })
hl("AlphaShortcut", { fg = p.func })
hl("AlphaFooter", { fg = p.muted })

-- ────────────────────────────── terminal ──────────────────────────────
-- ANSI palette ported verbatim from the Zed theme (it deliberately remaps
-- several slots — e.g. blue -> gold — to match the syntax palette).
vim.g.terminal_color_0 = "#DDDDDD"
vim.g.terminal_color_8 = "#57564F"
vim.g.terminal_color_1 = "#c74028"
vim.g.terminal_color_9 = "#e7988a"
vim.g.terminal_color_2 = "#62BA46"
vim.g.terminal_color_10 = "#b0dca2"
vim.g.terminal_color_3 = "#ded9b7"
vim.g.terminal_color_11 = "#f0edde"
vim.g.terminal_color_4 = "#c28b12"
vim.g.terminal_color_12 = "#f1c464"
vim.g.terminal_color_5 = "#c72855"
vim.g.terminal_color_13 = "#efb0c2"
vim.g.terminal_color_6 = "#fdd888"
vim.g.terminal_color_14 = "#fef1d5"
vim.g.terminal_color_7 = "#131313"
vim.g.terminal_color_15 = "#303030"
