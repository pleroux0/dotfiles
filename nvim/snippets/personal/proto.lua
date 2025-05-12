local ls = require("luasnip")
local lse = require("luasnip.extras")

local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local r = lse.rep

local Snippets = require('snippets/Snippets')

local service = s("service", {
    t("service "), i(1, "ServiceName"), t({" {",
    "    "}), i(2, "// Empty"), t({"",
    "}",}),
})

local syntax = s("syntax", {
    t({"syntax = \"proto3\";",
    "",
    ""}),
})

local message = s("message", {
    t("message "), i(1, "MessageName"), t({" {",
    "    "}), i(2, "// Empty"), t({"",
    "}",}),
})

local rpc = s("rpc", {
    t("rpc "),
    i(1, "Procedure"),
    t("("),
    i(2, "Request"),
    t(") returns ("),
    i(3, "Reply"),
    t({") {}", ""}),
})

local import = s("import", {
    t("import \""),
    i(1, "path/to/file"),
    t({".proto\";", ""}),
})

local importstruct = s("importstruct",
    t({"import \"google/protobuf/struct.proto\";", ""})
)

local struct = s("struct",
    t("google.protobuf.Struct")
)

local importany = s("importany",
    t({"import \"google/protobuf/any.proto\";", ""})
)

local any = s("any",
    t("google.protobuf.Any")
)

local package = s("package", {
    t("package "),
    i(1, "path.to.package"),
    t({";","",""}),
})


return Snippets:new({
    ["proto"] =
        {
            service,
            message,
            syntax,
            rpc,
            import,
            importstruct,
            importany,
            struct,
            any,
            package,
        }
})
