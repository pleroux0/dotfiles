local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty

function YearText() 
  return os.date("*t").year
end

function MonthText()
  return os.date("*t").month
end

function DayOfMonth()
  return os.date("*t").day
end

return {
    YearText = YearText,
    MonthText = MonthText,
    DayOfMonth = DayOfMonth,
}
