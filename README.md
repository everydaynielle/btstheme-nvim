# bts.nvim

A purple, ARMY-inspired Neovim colorscheme built for LazyVim. Every accent is drawn from the BTS
member colors, with fandom purple (`#a66bff`) as the primary highlight.

## Styles

- `dark` (default), deep purple-black background, "I purple you"
- `light`, warm cream background, "Butter"

## Features

- Treesitter captures, LSP diagnostics, semantic tokens and inlay hints
- LazyVim ecosystem: snacks.nvim (picker, dashboard, notifier, indent, explorer), blink.cmp,
  bufferline, lualine, which-key, noice, trouble, flash, todo-comments, gitsigns, mini.icons,
  mason, lazy.nvim
- Matching `lualine` theme (`bts`) picked up automatically via `theme = "auto"`
- Optional transparent background
- Terminal colors for `:terminal`
- `dark` and `light` palettes with configurable comment, keyword and function styles

## Requirements

- Neovim 0.9+
- LazyVim (optional, works as a standalone plugin too)

## Installation (LazyVim)

Add a spec such as `lua/plugins/theme.lua`:

```lua
return {
  {
    "everydaynielle/btstheme-nvim",
    name = "bts.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bts").setup({
        style = "dark",
        transparent = false,
      })
      vim.cmd.colorscheme("bts")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function() end,
    },
  },
}
```

For local development, replace the repository with `dir = "C:/Users/danie/btstheme-nvim"`.

## Fallback and disabling

The LazyVim integration always has a way back to the stock theme:

- If `bts` fails to load, the integration falls back to LazyVim's default `tokyonight` theme,
  and then to `habamax` if tokyonight is unavailable.
- Press `<leader>uB` or run `:BtsToggle` to switch between `bts` and the fallback at runtime.
- To start with the fallback every time, set this in `lua/config/options.lua`:

```lua
vim.g.bts_theme_enabled = false
```

- `<leader>uC` still opens LazyVim's colorscheme picker with previews.

## Usage

```vim
:colorscheme bts
```

Switch styles at runtime:

```lua
require("bts").setup({ style = "light" })
vim.cmd.colorscheme("bts")
```

## Configuration

Defaults:

```lua
require("bts").setup({
  style = "dark",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    types = {},
    strings = {},
  },
})
```

Any attribute accepted by `nvim_set_hl` can be added under `styles`, for example
`keywords = { bold = true }` or `comments = { italic = false }`.

## Palette

| Role | Color | Member |
| --- | --- | --- |
| Primary | `#a66bff` | ARMY purple |
| Blue | `#63b3ff` | RM |
| Pink | `#ff8ec4` | Jin |
| White | `#f4f1fa` | SUGA |
| Green | `#6ee7a8` | J-Hope |
| Yellow | `#ffd166` | Jimin |
| Slate | `#9fb6cc` | V |
| Red | `#ff6f91` | Jungkook |

`light` uses darkened versions of the same hues so text stays readable on the cream background.

## File layout

- `colors/bts.lua` entry point for `:colorscheme`
- `lua/bts/init.lua` setup and highlight application
- `lua/bts/palette.lua` dark and light palettes
- `lua/bts/groups/` editor, syntax, treesitter, LSP and plugin highlight groups
- `lua/lualine/themes/bts.lua` lualine theme
