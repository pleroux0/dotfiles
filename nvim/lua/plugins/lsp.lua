-- lua/plugins/lua.lua
return {
    "neovim/nvim-lspconfig",
    name = "lsp",
    lazy = false,
    config = function(_, opts)
      require("lspconfig").lua_ls.setup(opts)

      vim.api.nvim_command("command! CodeAction lua vim.lsp.buf.code_action()")
      vim.api.nvim_command("command! Declaration lua vim.lsp.buf.declaration()")
      vim.api.nvim_command("command! Definition lua vim.lsp.buf.definition()")
      vim.api.nvim_command("command! Format lua vim.lsp.buf.format()")
      vim.api.nvim_command("command! Hover lua vim.lsp.buf.hover()")
      vim.api.nvim_command("command! Implementation lua vim.lsp.buf.implementation()")
      vim.api.nvim_command("command! Rename lua vim.lsp.buf.rename()")
      vim.api.nvim_command("command! TypeDefinition lua vim.lsp.buf.type_definition()")

    end,
}
