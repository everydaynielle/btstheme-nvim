local util = require("bts.util")

return function(p, cfg)
  local function tint(color, alpha)
    return util.blend(color, p.bg, alpha)
  end

  local groups = {
    DiagnosticError = { fg = p.error },
    DiagnosticWarn = { fg = p.warn },
    DiagnosticInfo = { fg = p.info },
    DiagnosticHint = { fg = p.hint },
    DiagnosticOk = { fg = p.ok },
    DiagnosticUnnecessary = { fg = p.fg_muted },
    DiagnosticDeprecated = { fg = p.fg_muted, strikethrough = true },
    DiagnosticSignError = { fg = p.error },
    DiagnosticSignWarn = { fg = p.warn },
    DiagnosticSignInfo = { fg = p.info },
    DiagnosticSignHint = { fg = p.hint },
    DiagnosticSignOk = { fg = p.ok },
    DiagnosticUnderlineError = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.hint },
    DiagnosticUnderlineOk = { undercurl = true, sp = p.ok },
    DiagnosticFloatingError = { fg = p.error, bg = p.bg_float },
    DiagnosticFloatingWarn = { fg = p.warn, bg = p.bg_float },
    DiagnosticFloatingInfo = { fg = p.info, bg = p.bg_float },
    DiagnosticFloatingHint = { fg = p.hint, bg = p.bg_float },
    DiagnosticFloatingOk = { fg = p.ok, bg = p.bg_float },
    DiagnosticVirtualTextError = { fg = p.error, bg = tint(p.error, 0.14) },
    DiagnosticVirtualTextWarn = { fg = p.warn, bg = tint(p.warn, 0.14) },
    DiagnosticVirtualTextInfo = { fg = p.info, bg = tint(p.info, 0.14) },
    DiagnosticVirtualTextHint = { fg = p.hint, bg = tint(p.hint, 0.14) },
    DiagnosticVirtualTextOk = { fg = p.ok, bg = tint(p.ok, 0.14) },
    LspReferenceText = { bg = tint(p.purple, 0.22) },
    LspReferenceRead = { bg = tint(p.purple, 0.22) },
    LspReferenceWrite = { bg = tint(p.pink, 0.22) },
    LspReferenceTarget = { bg = tint(p.cyan, 0.2) },
    LspSignatureActiveParameter = { fg = p.purple_light, bg = p.bg_highlight, bold = true },
    LspCodeLens = { fg = p.fg_muted, italic = true },
    LspCodeLensSeparator = { fg = p.fg_gutter },
    LspInlayHint = { fg = p.fg_muted, bg = p.bg_highlight, italic = true },
    VirtualTextError = { fg = p.error, bg = tint(p.error, 0.14) },
    VirtualTextWarn = { fg = p.warn, bg = tint(p.warn, 0.14) },
    VirtualTextInfo = { fg = p.info, bg = tint(p.info, 0.14) },
    VirtualTextHint = { fg = p.hint, bg = tint(p.hint, 0.14) },
    VirtualTextOk = { fg = p.ok, bg = tint(p.ok, 0.14) },
  }

  for level, color in pairs({ Error = p.error, Warn = p.warn, Info = p.info, Hint = p.hint }) do
    groups["DiagnosticVirtualText" .. level] = { fg = color, bg = tint(color, 0.14) }
    groups["DiagnosticSign" .. level] = { fg = color }
    groups["DiagnosticUnderline" .. level] = { undercurl = true, sp = color }
    groups["DiagnosticFloating" .. level] = { fg = color, bg = p.bg_float }
  end

  return groups
end
