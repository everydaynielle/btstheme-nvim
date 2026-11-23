local M = {}

local function clamp(value)
  return math.max(0, math.min(255, math.floor(value + 0.5)))
end

function M.to_rgb(hex)
  hex = hex:gsub("#", "")
  if #hex == 3 then
    hex = hex:gsub("(.)", "%1%1")
  end
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

function M.to_hex(r, g, b)
  return string.format("#%02x%02x%02x", clamp(r), clamp(g), clamp(b))
end

function M.blend(fg, bg, alpha)
  local fr, fg_g, fb = M.to_rgb(fg)
  local br, bg_g, bb = M.to_rgb(bg)
  return M.to_hex(fr * alpha + br * (1 - alpha), fg_g * alpha + bg_g * (1 - alpha), fb * alpha + bb * (1 - alpha))
end

function M.darken(color, amount)
  return M.blend("#000000", color, amount)
end

function M.lighten(color, amount)
  return M.blend("#ffffff", color, amount)
end

return M
