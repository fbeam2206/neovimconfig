-- lualine theme for macos-classic-dark (Zed "macOS Classic Dark" port)
local c = {
	bg = "#131313",
	status = "#272727",
	tabbar = "#232323",
	element = "#373636",
	fg = "#CACCCA",
	muted = "#9E9E9E",
	gutter = "#8F8F8F",
	accent = "#72cffe",
	green = "#62BA46",
	yellow = "#E1D797",
	red = "#c74028",
	gold = "#c28b12",
}

return {
	normal = {
		a = { fg = c.bg, bg = c.accent, gui = "bold" },
		b = { fg = c.fg, bg = c.element },
		c = { fg = c.muted, bg = c.status },
	},
	insert = {
		a = { fg = c.bg, bg = c.green, gui = "bold" },
	},
	visual = {
		a = { fg = c.bg, bg = c.yellow, gui = "bold" },
	},
	replace = {
		a = { fg = c.bg, bg = c.red, gui = "bold" },
	},
	command = {
		a = { fg = c.bg, bg = c.gold, gui = "bold" },
	},
	inactive = {
		a = { fg = c.gutter, bg = c.tabbar },
		b = { fg = c.gutter, bg = c.tabbar },
		c = { fg = c.gutter, bg = c.tabbar },
	},
}
