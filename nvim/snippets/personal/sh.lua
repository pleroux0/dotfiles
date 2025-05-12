local ls = require("luasnip")
local lse = require("luasnip.extras")

local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local r = lse.rep

local Snippets = require('snippets/Snippets')

local cd_to_script_dir = s("cd_to_script_dir", {
    t({"cd \"$(dirname \"$(realpath -- \"$0\")\")\";",
    ""}),
})

local for_ = s("for", {
    t("for "), i(1, "VARIABLE"), t(" in "), i(2, "RANGE"), t({"",
        "do",
        "\t"}), i(3, "# TODO"), t({"",
        "end",
        ""}),
})



return Snippets:new({
    ["sh"] =
        {
            cd_to_script_dir,
            for_,
        }
})
