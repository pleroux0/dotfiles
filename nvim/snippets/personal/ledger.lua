local ls = require("luasnip")
local lse = require("luasnip.extras")

local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local r = lse.rep

local Snippets = require('snippets/Snippets')

local function date()
    return sn(nil, {
        i(1, "YYYY"), t("/"), i(2, "MM"), t("/"), i(3, "DD")
    })
end

local momentum_account = "Liabilities::Paul::ScotiaBank::Momentum"
local preferred_account = "Assets::Paul::ScotiaBank::Preferred Package"

local momentum = s("momentum", t(momentum_account))
local preferred = s("preferred", t(preferred_account))

local uber = s("uber", {
    d(1, date, {}), t({" Uber",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Transit::Uber",
    "",
    ""})
})

local duuo = s("duuo", {
    d(1, date, {}), t({" Duuo",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Home::Rental Insurance",
    "",
    ""})
})

local diallog = s("diallog", {
    d(1, date, {}), t({" Diallog",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Recurring::Internet",
    "",
    ""})
})

local steam = s("steam", {
    d(1, date, {}), t({" Steam",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Entertainment::Steam",
    "",
    ""})
})

local ubereats = s("ubereats", {
    d(1, date, {}), t({" Uber Eats",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Dining::Uber Eats",
    "",
    ""})
})

local kfc = s("kfc", {
    d(1, date, {}), t({" KFC",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Dining::KFC",
    "",
    ""})
})

local netflix = s("netflix", {
    d(1, date, {}), t({" Netflix",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Recurring::Netflix",
    "",
    ""})
})

local netflix = s("youtube", {
    d(1, date, {}), t({" Youtube Premium",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Recurring::Youtube Premium",
    "",
    ""})
})

local disney_plus = s(" disney_plus", {
    d(1, date, {}), t({" Disney Plus",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Recurring::Disney Plus",
    "",
    ""})
})

local google = s("google", {
    d(1, date, {}), t({" Google",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Recurring::Google drive",
    "",
    ""})
})

local microsoft = s("microsoft", {
d(1, date, {}), t({" Microsoft 365",
"    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
"    Expenses::Recurring::Microsoft 365",
"",
""})
})

local amazon_prime = s("amazon_prime", {
d(1, date, {}), t({" Amazon Prime",
"    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
"    Expenses::Recurring::Amazon Prime",
"",
""})
})

local amazon = s("amazon", {
    d(1, date, {}), t({" Amazon",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::"}), i(3, "Account"), t({"",
    "",
    ""})
}) 

local aws = s("aws", {
    d(1, date, {}), t({" Amazon Web Services",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "        Expenses::Recurring::Domain",
    "",
    ""})
}) 

local udemy = s("udemy", {
    d(1, date, {}), t({" Udemy",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Learning",
    "",
    ""})
})

local homesense = s("homesense", {
    d(1, date, {}), t(" "), t({" Homesense",
    "    " .. momentum_account .. "  C$-"}), i(2, "X"), t({"",
    "    Expenses::Home",
    "",
    ""})
})

local pay_momentum = s("pay_momentum", {
    d(1, date, {}), t({" Transfer from Paul (Cheque) to Paul (Credit)",
    "    " .. preferred_account .. "  C$-"}), i(2, "X"), t({"",
    "    " .. momentum_account,
    "",
    ""})
})

return Snippets:new({
    ["ledger"] =
        {
            amazon,
            amazon_prime,
            aws,
            diallog,
            disney_plus,
            duuo,
            homesense,
            kfc,
            google,
            microsoft,
            momentum,
            netflix,
            pay_momentum,
            preferred,
            steam,
            uber,
            ubereats,
            udemy,
            youtube,
        }
})
