local util = require("bts.util")

local dark = {
  bg = "#130b1e",
  bg_dark = "#0b0713",
  bg_float = "#1b1129",
  bg_highlight = "#281838",
  bg_visual = "#372052",
  bg_search = "#4b2d73",
  bg_sidebar = "#160d22",
  border = "#3b2857",
  fg = "#efeaf8",
  fg_dim = "#b9aad0",
  fg_muted = "#8a76a4",
  fg_gutter = "#453356",
  comment = "#7e6a99",
  cyan = "#5fe3dc",
  teal = "#4fd1c5",
  orange = "#ffb072",
  magenta = "#e879f9",
  violet = "#b388ff",
  lavender = "#d6c4ff",
}

local dark_members = {
  army = "#a66bff",
  rm = "#63b3ff",
  jin = "#ff8ec4",
  suga = "#f4f1fa",
  jhope = "#6ee7a8",
  jimin = "#ffd166",
  v = "#9fb6cc",
  jungkook = "#ff6f91",
}

local light = {
  bg = "#fbf7f1",
  bg_dark = "#f2ece3",
  bg_float = "#fffdfa",
  bg_highlight = "#f1e7fa",
  bg_visual = "#e4d4f6",
  bg_search = "#dcc6f7",
  bg_sidebar = "#f6f0e8",
  border = "#d9caea",
  fg = "#2b2139",
  fg_dim = "#5a4a70",
  fg_muted = "#85739c",
  fg_gutter = "#cbbcdd",
  comment = "#8a7a9e",
  cyan = "#0e7490",
  teal = "#0f766e",
  orange = "#b45309",
  magenta = "#a21caf",
  violet = "#6d28d9",
  lavender = "#7c5cd6",
}

local light_members = {
  army = "#7c3aed",
  rm = "#1769d2",
  jin = "#c2185b",
  suga = "#5c6070",
  jhope = "#0f9d58",
  jimin = "#a16207",
  v = "#4a6274",
  jungkook = "#c92a4e",
}

local function derive(base, members, is_light)
  local p = vim.tbl_extend("force", {}, base, members)

  p.purple = p.army
  p.purple_light = is_light and util.darken(p.army, 0.18) or util.lighten(p.army, 0.24)
  p.purple_dim = is_light and util.lighten(p.army, 0.35) or util.darken(p.army, 0.32)
  p.pink = p.jin
  p.blue = p.rm
  p.green = p.jhope
  p.yellow = p.jimin
  p.red = p.jungkook

  p.on_accent = is_light and "#ffffff" or p.bg_dark
  p.accent_bg = is_light and p.purple or p.purple_dim
  p.error = p.red
  p.warn = p.yellow
  p.info = p.blue
  p.hint = p.cyan
  p.ok = p.green

  p.git_add = p.green
  p.git_change = p.yellow
  p.git_delete = p.red
  p.git_untracked = p.cyan

  p.diff_add = util.blend(p.green, p.bg, 0.16)
  p.diff_change = util.blend(p.yellow, p.bg, 0.14)
  p.diff_delete = util.blend(p.red, p.bg, 0.16)
  p.diff_text = util.blend(p.blue, p.bg, 0.32)

  return p
end

local M = {}

M.dark = derive(dark, dark_members, false)
M.light = derive(light, light_members, true)

return M
