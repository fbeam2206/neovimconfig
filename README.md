# Neovim Configuration

A [lazy.nvim](https://github.com/folke/lazy.nvim)-based Neovim setup with LSP,
autocompletion, fuzzy finding, a file tree, and a large catalogue of
switchable colorschemes (most configured transparent).

> Looking for shortcuts? See **[KEYBINDINGS.md](KEYBINDINGS.md)** for the full
> cheat sheet. **Leader = `<Space>`**.

---

## Layout

```
init.lua                 -- core options + top-level keymaps, loads everything
lazy-lock.json           -- pinned plugin versions (managed by lazy.nvim)
lua/
  config/
    lazy.lua             -- bootstraps lazy.nvim, sets <leader>, window keymaps
  plugins/               -- one file per plugin (auto-imported by lazy.nvim)
```

Every file in `lua/plugins/` returns a lazy.nvim plugin spec and is imported
automatically — to add a plugin, drop a new `*.lua` file in there.

---

## Core settings (`init.lua`)

- 2-space, expand-tab indentation.
- Relative + absolute line numbers (hybrid).
- `exrc` / `secure` enabled — trusts a project-local `.nvimrc`/`.exrc` if present.
- A `ColorScheme` autocommand forces transparent backgrounds (Normal, line
  numbers, sign column, window separators) so the terminal background shows
  through regardless of the active theme.

---

## Plugins

### Editing & language support
| File | Plugin | Purpose |
| --- | --- | --- |
| `mason.lua` | mason.nvim | Installs/manages LSP servers and wires up the native `vim.lsp` config. Auto-installs `lua-language-server`, `css-lsp`, `hyprls`, `clangd`, `python-lsp-server`. Sets LSP keymaps on attach. |
| `completions.lua` | nvim-cmp + LuaSnip | Autocompletion menu with snippet, LSP, buffer, and path sources, plus lspkind icons. |
| `treesitter.lua` | nvim-treesitter | Syntax highlighting & indentation (auto-installs parsers; ships with c, lua, python). |
| `auto-pairs.lua` | nvim-autopairs | Auto-closes brackets/quotes in insert mode. |
| `indentlines.lua` | indent-blankline | Vertical indentation guides. |

### Navigation & UI
| File | Plugin | Purpose |
| --- | --- | --- |
| `telescope.lua` | telescope.nvim | Fuzzy finder (files, grep, buffers, help). Keymaps in `init.lua`. |
| `tele-ui.lua` | telescope-ui-select | Routes `vim.ui.select` menus through Telescope. |
| `neotree.lua` | neo-tree.nvim | File explorer sidebar (`<leader>e`). |
| `tmux-nav.lua` | vim-tmux-navigator | `<C-h/j/k/l>` move seamlessly between Neovim splits and tmux panes. |
| `lualine.lua` | lualine.nvim | Statusline. |
| `alpha.lua` | alpha-nvim | Start screen / dashboard with quick-action buttons. |
| `which-key.lua` | which-key.nvim | Popup showing available keybinds after pressing `<leader>`. |

### Themes
| File | Plugin | Purpose |
| --- | --- | --- |
| `themery.lua` | themery.nvim | Theme switcher with live preview (`:Themery`); lists every installed colorscheme. |
| `theme.lua` | (bundle) | Declares the colorscheme plugins: rose-pine, nightfox, tokyonight, kanagawa, github-theme, catppuccin, yugen, gruber-darker, zenbones — most with transparency on. |
| `aura-theme.lua` | baliestri/aura-theme | The Aura colorscheme; applies `aura-dark` on startup. |

---

## Common commands

| Command | Action |
| --- | --- |
| `:Lazy` | Plugin manager (install / update / clean / profile) |
| `:Mason` | Manage LSP servers, formatters, linters |
| `:Themery` | Open the theme switcher |
| `:TSUpdate` | Update Treesitter parsers |

---

## Notes

- **Startup theme:** Themery persists the last theme you picked and applies it
  on launch. (No plugin forces a colorscheme at startup.)
- **Adding a colorscheme:** declare the plugin in `theme.lua`, then add an entry
  to the `themes` list in `themery.lua` so it shows up in the switcher.
