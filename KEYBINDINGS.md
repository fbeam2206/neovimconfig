# Neovim Keybindings Cheat Sheet

> **Leader** = `<Space>` &nbsp;&nbsp;|&nbsp;&nbsp; **Local leader** = `\`
>
> Covers the intermediate, custom & plugin keybinds in this config — not the vanilla motion/edit basics.

---

## 🔭 Telescope (fuzzy finding)

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search file contents) |
| `<leader>fb` | List open buffers |
| `<leader>fh` | Search help tags |
| `<C-p>` | Find files (alias) |

> Inside a Telescope picker: `<C-n>`/`<C-p>` move down/up, `<CR>` opens, `<C-x>` opens in a split, `<C-v>` in a vsplit, `<C-t>` in a tab, `<Esc>` closes.

---

## 🗂️ Neo-tree (file explorer)

| Key | Action |
| --- | --- |
| `<leader>e` | Toggle the file tree |

> Inside the tree: `a` add, `d` delete, `r` rename, `c` copy, `x` cut, `p` paste, `R` refresh, `H` toggle hidden files, `<CR>`/`o` open, `S` open in split, `s` open in vsplit, `?` show all tree mappings.

---

## 🧠 LSP (active when a language server is attached)

| Key | Action |
| --- | --- |
| `K` | Hover documentation |
| `<leader>gd` | Go to definition |
| `<leader>gD` | Go to declaration |
| `<leader><CR>` | Show diagnostic in a floating window |

---

## 💡 Autocompletion (nvim-cmp — insert mode)

| Key | Action |
| --- | --- |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selected item |
| `<C-e>` | Abort / close the menu |
| `<C-f>` | Scroll docs down |
| `<C-b>` | Scroll docs up |

---

## 🪟 Window navigation & resizing

| Key | Action |
| --- | --- |
| `<C-h>` | Move to left window (tmux-aware) |
| `<C-j>` | Move to window below (tmux-aware) |
| `<C-k>` | Move to window above (tmux-aware) |
| `<C-l>` | Move to right window (tmux-aware) |
| `<C-\>` | Move to previous window/pane |
| `=` | Vertical resize **+5** (wider) |
| `-` | Vertical resize **−5** (narrower) |
| `+` | Horizontal resize **+2** (taller) |
| `_` | Horizontal resize **−2** (shorter) |

> The `<C-h/j/k/l>` bindings seamlessly jump between Neovim splits *and* tmux panes.

---

## ⚙️ Misc / utility

| Key | Action |
| --- | --- |
| `<leader>w` | Toggle line wrap |
| `<leader>?` | Show buffer-local keymaps (which-key) |

---

## 📋 Useful commands

| Command | Action |
| --- | --- |
| `:Themery` | Open the theme switcher (live preview of all colorschemes) |
| `:Lazy` | Plugin manager dashboard (install/update/clean) |
| `:Mason` | Manage LSP servers, formatters, linters |
| `:TSUpdate` | Update Treesitter parsers |

> Tip: pause after pressing `<Space>` and **which-key** will pop up a menu of available leader bindings.
