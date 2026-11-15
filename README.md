```lua
-- Nocturnal 2.0: Midnight Periwinkle
-- Native Neovim colorscheme
-- No external dependencies

local M = {}

local c = {
    -- Backgrounds
    void     = "#090E19",
    base     = "#101726",
    surface  = "#171F30",
    elevated = "#202A3D",
    overlay  = "#2A354B",

    -- Accent
    accent      = "#929CC5",
    accent_deep = "#747FA9",
    accent_soft = "#AAB2D3",
    accent_tint = "#303750",

    -- Text
    fg       = "#DCE2F0",
    fg2      = "#A6B1C8",
    muted    = "#77849E",
    disabled = "#59667E",

    -- Borders
    border        = "#303B51",
    border_subtle = "#242F44",

    -- Semantic
    red     = "#C77D8B",
    orange  = "#C99572",
    yellow  = "#C8B47E",
    green   = "#82B49F",
    blue    = "#829FC9",
    magenta = "#A397C9",
    cyan    = "#80B4C0",

    -- Bright semantic variants
    red_bright     = "#D995A1",
    green_bright   = "#9BCBB5",
    yellow_bright  = "#DDCA99",
    blue_bright    = "#A0B8DC",
    magenta_bright = "#B9ADD9",
    cyan_bright    = "#9BCBD3",
}

local function set(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
    vim.cmd("highlight clear")

    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "nocturnal"

    -- Terminal colors
    local terminal = {
        c.base,
        c.red,
        c.green,
        c.yellow,
        c.blue,
        c.magenta,
        c.cyan,
        c.fg2,
        c.border,
        c.red_bright,
        c.green_bright,
        c.yellow_bright,
        c.blue_bright,
        c.magenta_bright,
        c.cyan_bright,
        c.fg,
    }

    for i, color in ipairs(terminal) do
        vim.g["terminal_color_" .. (i - 1)] = color
    end

    -- Editor
    set("Normal",         { fg = c.fg, bg = c.void })
    set("NormalNC",       { fg = c.fg, bg = c.void })
    set("NormalFloat",    { fg = c.fg, bg = c.surface })
    set("FloatBorder",    { fg = c.border, bg = c.surface })
    set("FloatTitle",     { fg = c.accent, bg = c.surface, bold = true })
    set("Cursor",         { fg = c.void, bg = c.accent })
    set("CursorLine",     { bg = c.base })
    set("CursorColumn",   { bg = c.base })
    set("ColorColumn",    { bg = c.base })
    set("LineNr",         { fg = c.disabled })
    set("CursorLineNr",   { fg = c.accent, bold = true })
    set("SignColumn",     { fg = c.muted, bg = c.void })
    set("Folded",         { fg = c.muted, bg = c.surface })
    set("FoldColumn",     { fg = c.muted, bg = c.void })
    set("VertSplit",      { fg = c.border_subtle })
    set("WinSeparator",   { fg = c.border_subtle })
    set("EndOfBuffer",    { fg = c.border_subtle })
    set("NonText",        { fg = c.border_subtle })
    set("Whitespace",     { fg = c.border_subtle })
    set("SpecialKey",     { fg = c.muted })

    -- Selection and search
    set("Visual",         { bg = c.overlay })
    set("VisualNOS",      { bg = c.overlay })
    set("Search",         { fg = c.fg, bg = c.accent_tint })
    set("IncSearch",      { fg = c.void, bg = c.accent })
    set("CurSearch",      { fg = c.void, bg = c.accent_soft })
    set("Substitute",     { fg = c.void, bg = c.red })
    set("MatchParen",     { fg = c.accent_soft, bg = c.elevated, bold = true })

    -- Popup menu
    set("Pmenu",          { fg = c.fg2, bg = c.elevated })
    set("PmenuSel",       { fg = c.fg, bg = c.accent_tint, bold = true })
    set("PmenuSbar",      { bg = c.surface })
    set("PmenuThumb",     { bg = c.muted })
    set("WildMenu",       { fg = c.fg, bg = c.accent_tint })

    -- Tabs
    set("TabLine",        { fg = c.muted, bg = c.surface })
    set("TabLineFill",    { bg = c.void })
    set("TabLineSel",     { fg = c.fg, bg = c.base, bold = true })

    -- Status line
    set("StatusLine",     { fg = c.fg2, bg = c.surface })
    set("StatusLineNC",   { fg = c.muted, bg = c.base })

    -- Messages
    set("ModeMsg",        { fg = c.green, bold = true })
    set("MoreMsg",        { fg = c.green })
    set("MsgArea",        { fg = c.fg2 })
    set("WarningMsg",     { fg = c.yellow })
    set("ErrorMsg",       { fg = c.red_bright })
    set("Question",       { fg = c.accent })

    -- Syntax
    set("Comment",        { fg = c.muted, italic = true })
    set("Constant",       { fg = c.orange })
    set("String",         { fg = c.green })
    set("Character",      { fg = c.green_bright })
    set("Number",         { fg = c.orange })
    set("Boolean",        { fg = c.orange })
    set("Float",          { fg = c.orange })

    set("Identifier",     { fg = c.fg2 })
    set("Function",       { fg = c.blue_bright })
    set("Statement",      { fg = c.magenta })
    set("Conditional",    { fg = c.magenta })
    set("Repeat",         { fg = c.magenta })
    set("Label",          { fg = c.accent })
    set("Operator",       { fg = c.fg2 })
    set("Keyword",        { fg = c.magenta })
    set("Exception",      { fg = c.red })

    set("PreProc",        { fg = c.cyan })
    set("Include",        { fg = c.magenta })
    set("Define",         { fg = c.magenta })
    set("Macro",          { fg = c.cyan })
    set("PreCondit",      { fg = c.cyan })

    set("Type",           { fg = c.cyan })
    set("StorageClass",   { fg = c.magenta })
    set("Structure",      { fg = c.cyan })
    set("Typedef",        { fg = c.cyan })

    set("Special",        { fg = c.accent })
    set("SpecialChar",    { fg = c.orange })
    set("Tag",            { fg = c.accent })
    set("Delimiter",      { fg = c.fg2 })
    set("SpecialComment", { fg = c.muted, italic = true })
    set("Debug",          { fg = c.red })

    set("Underlined",     { fg = c.blue, underline = true })
    set("Error",          { fg = c.red_bright })
    set("Todo",           { fg = c.yellow, bold = true })

    -- Tree-sitter
    set("@variable",             { fg = c.fg2 })
    set("@variable.builtin",     { fg = c.accent })
    set("@variable.parameter",  { fg = c.orange })
    set("@constant",             { fg = c.orange })
    set("@constant.builtin",     { fg = c.orange })
    set("@module",               { fg = c.cyan })
    set("@label",                { fg = c.accent })

    set("@string",               { fg = c.green })
    set("@string.escape",        { fg = c.orange })
    set("@character",            { fg = c.green_bright })
    set("@number",               { fg = c.orange })
    set("@boolean",              { fg = c.orange })

    set("@function",             { fg = c.blue_bright })
    set("@function.call",        { fg = c.blue })
    set("@function.builtin",     { fg = c.cyan })
    set("@method",               { fg = c.blue_bright })
    set("@method.call",          { fg = c.blue })
    set("@constructor",          { fg = c.cyan })

    set("@keyword",              { fg = c.magenta })
    set("@keyword.function",     { fg = c.magenta })
    set("@keyword.return",       { fg = c.magenta })
    set("@conditional",          { fg = c.magenta })
    set("@repeat",               { fg = c.magenta })
    set("@operator",             { fg = c.fg2 })
    set("@punctuation",          { fg = c.fg2 })
    set("@punctuation.bracket",  { fg = c.fg2 })
    set("@punctuation.delimiter",{ fg = c.muted })

    set("@type",                 { fg = c.cyan })
    set("@type.builtin",         { fg = c.cyan })
    set("@attribute",            { fg = c.accent })
    set("@property",             { fg = c.fg2 })
    set("@field",                { fg = c.fg2 })
    set("@namespace",            { fg = c.cyan })
    set("@tag",                  { fg = c.magenta })
    set("@tag.attribute",        { fg = c.orange })
    set("@tag.delimiter",        { fg = c.muted })
    set("@comment",              { fg = c.muted, italic = true })

    -- Diagnostics
    set("DiagnosticError",            { fg = c.red })
    set("DiagnosticWarn",             { fg = c.yellow })
    set("DiagnosticInfo",             { fg = c.blue })
    set("DiagnosticHint",             { fg = c.cyan })
    set("DiagnosticOk",               { fg = c.green })

    set("DiagnosticVirtualTextError", { fg = c.red, bg = c.void })
    set("DiagnosticVirtualTextWarn",  { fg = c.yellow, bg = c.void })
    set("DiagnosticVirtualTextInfo",  { fg = c.blue, bg = c.void })
    set("DiagnosticVirtualTextHint",  { fg = c.cyan, bg = c.void })

    set("DiagnosticUnderlineError",  { undercurl = true, sp = c.red })
    set("DiagnosticUnderlineWarn",   { undercurl = true, sp = c.yellow })
    set("DiagnosticUnderlineInfo",   { undercurl = true, sp = c.blue })
    set("DiagnosticUnderlineHint",   { undercurl = true, sp = c.cyan })

    -- LSP references
    set("LspReferenceText",  { bg = c.elevated })
    set("LspReferenceRead",  { bg = c.elevated })
    set("LspReferenceWrite", { bg = c.accent_tint })

    -- Diff
    set("DiffAdd",       { fg = c.green, bg = "#172B2A" })
    set("DiffChange",    { fg = c.blue, bg = "#1B273B" })
    set("DiffDelete",    { fg = c.red, bg = "#30202C" })
    set("DiffText",      { fg = c.fg, bg = c.accent_tint })

    -- Git signs
    set("GitSignsAdd",    { fg = c.green })
    set("GitSignsChange", { fg = c.blue })
    set("GitSignsDelete", { fg = c.red })

    -- Telescope
    set("TelescopeNormal",        { fg = c.fg2, bg = c.surface })
    set("TelescopeBorder",        { fg = c.border, bg = c.surface })
    set("TelescopePromptNormal",  { fg = c.fg, bg = c.elevated })
    set("TelescopePromptBorder",  { fg = c.accent_deep, bg = c.elevated })
    set("TelescopeSelection",     { fg = c.fg, bg = c.accent_tint })
    set("TelescopeMatching",      { fg = c.accent_soft, bold = true })

    -- Completion
    set("CmpItemAbbr",            { fg = c.fg2 })
    set("CmpItemAbbrMatch",       { fg = c.accent_soft, bold = true })
    set("CmpItemAbbrMatchFuzzy",  { fg = c.accent, bold = true })
    set("CmpItemKind",            { fg = c.blue })
    set("CmpItemMenu",            { fg = c.muted })

    -- Markdown
    set("@markup.heading",        { fg = c.accent_soft, bold = true })
    set("@markup.strong",         { fg = c.fg, bold = true })
    set("@markup.italic",         { fg = c.fg2, italic = true })
    set("@markup.link",           { fg = c.blue, underline = true })
    set("@markup.link.url",       { fg = c.cyan, underline = true })
    set("@markup.raw",            { fg = c.green })
    set("@markup.list",           { fg = c.accent })
    set("@markup.quote",          { fg = c.muted, italic = true })

    -- Miscellaneous
    set("Directory",       { fg = c.blue })
    set("Title",           { fg = c.accent_soft, bold = true })
    set("Question",        { fg = c.green })
    set("QuickFixLine",    { fg = c.fg, bg = c.accent_tint })
    set("Conceal",         { fg = c.muted })
    set("SpellBad",        { undercurl = true, sp = c.red })
    set("SpellCap",        { undercurl = true, sp = c.yellow })
    set("SpellLocal",      { undercurl = true, sp = c.cyan })
    set("SpellRare",       { undercurl = true, sp = c.magenta })
end

M.setup()

return M
```
