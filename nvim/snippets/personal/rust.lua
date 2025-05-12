local ls = require("luasnip")
local lse = require("luasnip.extras")

local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local r = lse.rep

local Snippets = require('snippets/Snippets')

local tests = s("tests", {
    t({"#[cfg(test)]",
        "mod tests {",
        "    "}), i(1, "// TODO: Add tests here"), t({"",
        "}"}),
})

local test = s("test", {
    t({"#[test]",
        "fn "}), i(1, "test_name"), t({"() {",
        "    "}), i(2, "// TODO: Write test here"), t({"",
        "}"}),
})

local tokiotest = s("tokiotest", {
    t({"#[tokio::test]",
        "async fn "}), i(1, "test_name"), t({"() {",
        "    "}), i(2, "// TODO: Write test here"), t({"",
        "}"}),
})

local pytest = s("pytest", {
    t({"#[pyo3_asyncio::"}), i(1, "tokio"), t({"::test]",
        "fn "}), i(2, "test_name"), t({"() {",
        "    "}), i(3, "// TODO: Write test here"), t({"",
        "}"}),
})


return Snippets:new({
    ["rust"] =
        {
            tests,
            test,
            tokiotest,
            pytest,
        }
})
