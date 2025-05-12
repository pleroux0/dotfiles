local ls = require("luasnip")
local lse = require("luasnip.extras")

local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local r = lse.rep

local Snippets = require('snippets/Snippets')

componentAtom = s("componentAtom", {t({
    "import { forwardRef, ElementRef, ComponentPropsWithoutRef } from \"react\";",
    "import { twMerge } from \"tailwind-merge\";",
    "import { cx, cva } from \"class-variance-authority\";",
    "",
    "export const "}), i(1, "Tag"), t("Style = cva("), i(2, "\"container\""), t({");",
    "",
    "export const "}), r(1), t({" = forwardRef<",
    "  ElementRef<typeof "}), i(3, "Root"), t({">,",
    "  ComponentPropsWithoutRef<typeof "}), r(3), t({">",
    ">(({ className, ...props }, ref) => (",
    "  <"}), r(3), t(" ref={ref} className={twMerge(cx("), r(1), t({"Style({}), className))} {...props} />",
    "));",
    "",
    ""}), r(1), t(".displayName = \""), r(1), t("\";"),
})

return Snippets:new({
    ["typescriptreact"] =
        {
            componentAtom,
        },
})
