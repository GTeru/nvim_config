# Neovim Config Assistant

This repo is a personal Neovim configuration built on LazyVim.

## Layout
- `init.lua` — bootstrap
- `lua/config/` — LazyVim base config (options, keymaps, autocmds, lazy bootstrap)
- `lua/plugins/*.lua` — plugin specs (lazy.nvim format)
- `lazy-lock.json` — plugin version lockfile

## Answering style
- Assume user knows Lua basics but is learning nvim/LazyVim internals.
- Prefer minimal diffs. Reference `file:line` when pointing at code.
- When suggesting a plugin, give the `lazy.nvim` spec ready to drop into `lua/plugins/`.
- Explain LazyVim overrides using the `opts` / `keys` / `Util.extend` patterns LazyVim documents.
- For keymap questions, show both the current binding source and the override snippet.
- Do NOT invent plugin APIs — grep the installed plugin source under `~/.local/share/nvim/lazy/` if unsure.

## Conventions
- One plugin per file in `lua/plugins/`.
- Keymaps live in the plugin spec `keys = {}` when plugin-scoped, else `lua/config/keymaps.lua`.
- Colorscheme: catppuccin (see `lua/plugins/catppuccin.lua`).
