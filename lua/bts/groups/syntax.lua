return function(p, cfg)
  local styles = cfg.styles or {}
  local comments = styles.comments or {}
  local keywords = styles.keywords or {}
  local functions = styles.functions or {}
  local variables = styles.variables or {}
  local types = styles.types or {}
  local strings = styles.strings or {}

  local function merge(base, extra)
    return vim.tbl_extend("force", base, extra)
  end

  local keyword = merge({ fg = p.purple_light }, keywords)
  local function_hl = merge({ fg = p.blue }, functions)
  local variable = merge({ fg = p.fg }, variables)
  local type_hl = merge({ fg = p.cyan }, types)
  local string_hl = merge({ fg = p.green }, strings)

  return {
    Comment = merge({ fg = p.comment }, comments),
    Constant = { fg = p.orange },
    String = string_hl,
    Character = string_hl,
    Number = { fg = p.orange },
    Boolean = { fg = p.orange },
    Float = { fg = p.orange },
    Identifier = variable,
    Function = function_hl,
    Statement = keyword,
    Conditional = keyword,
    Repeat = keyword,
    Label = { fg = p.purple_light },
    Operator = { fg = p.purple_light },
    Keyword = keyword,
    Exception = keyword,
    PreProc = { fg = p.magenta },
    Include = { fg = p.magenta },
    Define = { fg = p.magenta },
    Macro = { fg = p.magenta },
    PreCondit = { fg = p.magenta },
    Type = type_hl,
    StorageClass = type_hl,
    Structure = type_hl,
    Typedef = type_hl,
    Special = { fg = p.pink },
    SpecialChar = { fg = p.pink },
    Tag = { fg = p.pink },
    Delimiter = { fg = p.fg_dim },
    SpecialComment = { fg = p.comment, bold = true },
    Debug = { fg = p.orange },
    Underlined = { fg = p.blue, underline = true },
    Ignore = { fg = p.fg_muted },
    Error = { fg = p.error, bold = true },
    Todo = { fg = p.on_accent, bg = p.yellow, bold = true },
  }
end
