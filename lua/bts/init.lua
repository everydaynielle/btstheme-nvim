local config = require("bts.config")
local groups = require("bts.groups")
local palettes = require("bts.palette")

local M = {}

M.config = vim.deepcopy(config.defaults)
M.style = "dark"

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", vim.deepcopy(config.defaults), opts or {})
  return M
end

function M.get_palette(style)
  local name = style or M.style or M.config.style or "dark"
  local palette = palettes[name]

  if not palette then
    error(string.format("bts.nvim: unknown style %q, expected 'dark' or 'light'", tostring(name)))
  end

  return palette
end

function M.colors()
  return M.get_palette()
end

local function apply_terminal_colors(p)
  local colors = {
    p.bg_highlight,
    p.red,
    p.green,
    p.yellow,
    p.blue,
    p.magenta,
    p.cyan,
    p.fg_dim,
    p.fg_muted,
    p.pink,
    p.green,
    p.yellow,
    p.blue,
    p.magenta,
    p.cyan,
    p.fg,
  }

  for index, color in ipairs(colors) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end
end

local function apply_highlights(p)
  local highlights = groups.build(p, M.config)

  for name, spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, spec)
  end
end

function M.load(style)
  local name = style or M.config.style or "dark"
  local p = M.get_palette(name)
  local background = name == "light" and "light" or "dark"

  M.style = name

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  if vim.o.background ~= background then
    vim.o.background = background
  end

  vim.g.colors_name = "bts"

  apply_highlights(p)

  if M.config.terminal_colors then
    apply_terminal_colors(p)
  end
end

return M
