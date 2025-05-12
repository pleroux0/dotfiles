local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node

local Snippets = require('snippets/Snippets')
local time = require('snippets/common/time')

local function classname(args, snip, old_state)
    local file = vim.fn.expand('%:t')
    file = file:gsub('^_', '')
    base = file:gsub('%..*$', '')
    return sn(nil, i(1, base))
end

abstractclass = s("abstractclass", {
    t({
        "from abc import ABC, abstractmethod",
        "",
        "",
        "class ",
    }),
    d(1, classname, {}), t({"(ABC):", "    "}), i(0, "pass"),
})

dataclass = s("dataclass", {
    t({
        "from dataclasses import dataclass",
        "",
        "",
        "@dataclass",
        "class ",
    }),
    d(1, classname, {}), t({":", "    "}), i(0, "pass"),
})

enum = s("enum", {
    t({
        "from enum import Enum",
        "",
        "",
        "class ",
    }),
    d(1, classname, {}), t({"(Enum):", "    "}), i(0, "pass"),
})

protocol = s("protocol", {
    t({
        "from typing import Protocol",
        "",
        "",
        "class ",
    }),
    d(1, classname, {}), t({"(Protocol):", "    "}), i(0, "pass"),
})

main = s("main", {
    t({
        "def main() -> None:",
        "    ",
    }),
    i(1, "pass"),
    t({
        "",
        "",
        "",
        "if __name__ == \"__main__\":",
        "    main()",
    }),
})

asyncmain = s("asyncmain", {
    t({
        "async def main() -> None:",
        "    ",
    }),
    i(1, "pass"),
    t({
        "",
        "",
        "",
        "if __name__ == \"__main__\":",
        "    import asyncio",
        "    asyncio.run(main())",
    }),
})

return Snippets:new({
    ["python"] =
        {
            abstractclass,
            dataclass,
            enum,
            protocol,
            asyncmain,
            main,
        }
})
