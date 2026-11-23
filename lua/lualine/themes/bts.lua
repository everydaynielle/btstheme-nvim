local p = require("bts").colors()

local function mode(accent)
  return {
    a = { fg = p.on_accent, bg = accent, gui = "bold" },
    b = { fg = p.fg_dim, bg = p.bg_highlight },
    c = { fg = p.fg_muted, bg = p.bg_sidebar },
  }
end

return {
  normal = mode(p.purple),
  insert = mode(p.green),
  visual = mode(p.magenta),
  replace = mode(p.red),
  command = mode(p.yellow),
  terminal = mode(p.cyan),
  inactive = {
    a = { fg = p.fg_muted, bg = p.bg_sidebar, gui = "bold" },
    b = { fg = p.fg_muted, bg = p.bg_sidebar },
    c = { fg = p.fg_muted, bg = p.bg_sidebar },
  },
}
