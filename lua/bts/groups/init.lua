local modules = { "editor", "syntax", "treesitter", "lsp", "plugins" }

local M = {}

function M.build(p, cfg)
  local highlights = {}

  for _, module in ipairs(modules) do
    local groups = require("bts.groups." .. module)(p, cfg)
    for name, spec in pairs(groups) do
      highlights[name] = spec
    end
  end

  return highlights
end

return M
