local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node

local time = require('snippets/common/time')

pleroux_license = s("pleroux_license", t({
    "// © Paul le Roux",
    "// Use, copying, or distribution is prohibited without express permission",
    "",
    "",
}))

return {
  pleroux_slash_license = pleroux_license,
}
