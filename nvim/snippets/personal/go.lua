local ls = require("luasnip")
local lse = require("luasnip.extras")

local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local r = lse.rep

local Snippets = require('snippets/Snippets')
local license = require('snippets/personal/license')

local test = s("test", {
    t({"func Test"}), i(1, "Name"), t({"(t *testing.T) {",
        "\tassert := assert.New(t)",
        "",
        "\t"}), i(2, "// TODO"), t({"",
        "}"}),
})

local testtable = s("testtable", {
    t({"func Test"}), i(1, "Name"), t({"(t *testing.T) {",
        "\ttestCases := []struct{",
        "\t\tdescription string",
        "\t\t"}), i(2, "// TODO"), t({"",
        "\t}{",
        "\t\t"}), i(3, "// TODO"), t({"",
        "\t}",
        "",
        "\tfor _, testCase := range testCases {",
        "\t\tt.Run(testCase.description, func(t *testing.T) {",
        "\t\t\tassert := assert.New(t)",
        "\t\t\t"}), i(4, "// TODO"), t({"",
        "\t\t})",
        "\t}",
        "}"}),
})

local benchmark = s("benchmark", {
    t({"func Benchmark"}), i(1, "Name"), t({"(t *testing.B) {",
        "\t"}), i(2, "//Empty"), t({"",
        "}"}),
})

local forrange = s("forrange", {
    t("for "), i(1, "k, v"), t(" := range "), i(2, "kvs"), t({" {",
    "\t"}), i(3, "// Empty"), t({"",
    "}"}),
})

local function packagename(args, snip, old_state)
    local path = vim.fn.expand('%:p:r')
    local base = path:gsub('^.*/', '')
    local parent = path:gsub('/' .. base .. '$', '')
    parent = parent:gsub('^.*/', '')
    local test_ending = "_test"

    if base == "main" then
        return sn(nil, i(1, "main"))
    elseif base:sub(-#test_ending) == test_ending then
        return sn(nil, i(1, parent .. test_ending))
    else
        return sn(nil, i(1, parent))
    end
end

local package = s("package", {
    t("package "), d(1, packagename, {}), t({"",
    "",
    ""}),
})

newwrappederrortype = s("newwrappederrortype", {
    t(" type "), i(1, "Name"), t({"Error struct {",
        "\tMessage string",
        "\tWrapped error",
    "}",
    "",
    "func (self *"}),r(1),t({"Error) Error() string { return self.Message }",
    "",
    "func (self *"}),r(1), t({"Error) Unwrap() error { return self.Wrapped }",
    ""}),
})

newerrortype = s("newerrortype", {
    t(" type "), i(1, "Name"), t({"Error struct {",
        "\tMessage string",
    "}",
    "",
    "func (self *"}),r(1),t({"Error) Error() string { return self.Message }",
    "",
    ""}),
})

newerror = s("newerror", {
    t("func New"), i(1, "Name"), t("Error() *"), r(2), t({"Error {",
	"\treturn &"}), i(2, "Type"), t({"Error{",
	"\t\tMessage: \""}), i(3, "error message"), t({"\",",
    "\t}",
    "}"}),
})

newwrappederror = s("newwrappederror", {
    t("func New"), i(1, "Name"), t("Error(err error) *"), i(2, "Type"), t({"Error {",
	"\treturn &"}), r(2), t({"Error{",
	"\t\tMessage: \""}), i(3, "error message"), t({"\",",
	"\t\tWrapped: err,",
    "\t}",
    "}"}),
})

assertwrappederror = s("assertwrappederror", {
    t("func Assert"), i(1, "Name"), t({"Error(assert *assert.Assertions, err error, wrapped error) {",
    "\tif !assert.NotNil(err) {",
    "\t\treturn",
    "\t}",
    "",
    "\texpected := "}), i(2, "module"), t(".New"), r(1), t({"Error(wrapped)",
    "",
    "\tif !assert.Equal(expected.Error(), err.Error()) {",
    "\t\treturn",
    "\t}",
    "",
    "\tunwrapped := errors.Unwrap(err)",
    "",
    "\tassert.ErrorIs(wrapped, unwrapped)",
    "}",
    }),
})

asserterror = s("asserterror", {
    t("func Assert"), i(1, "Name"), t({"Error(assert *assert.Assertions, err error) {",
    "\tif !assert.NotNil(err) {",
    "\t\treturn",
    "\t}",
    "",
    "\texpected := "}), i(2, "module"), t(".New"), r(1), t({"Error()",
    "",
    "\tif !assert.Equal(expected.Error(), err.Error()) {",
    "\t\treturn",
    "\t}",
    "}",
    "",
    ""}),
})

gomod_replace = s("replace", {
    t("replace "),
    i(1, "package"),
    t(" => "),
    i(2, "path"),
})

return Snippets:new({
    ["go"] =
        {
            test,
            testtable,
            benchmark,
            forrange,
            package,
            newerrortype,
            newwrappederrortype,
            newerror,
            newwrappederror,
            asserterror,
            assertwrappederror,
            license.pleroux_slash_license,
            license.uninterrupted_slash_license,
        },
    ["gomod"] = 
        {
            gomod_replace,
        },
})
