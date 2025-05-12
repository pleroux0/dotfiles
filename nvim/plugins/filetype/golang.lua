function go_guru(query)
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local byte_offset = vim.fn.line2byte(row) + col
    local current_file = vim.fn.expand("%")
    local cmd = "!guru " .. query .. " " .. current_file .. ":\\#" .. byte_offset
    vim.api.nvim_command(cmd)
end

vim.api.nvim_command("command! GoGuruDefinition lua go_guru(\"definition\")")
vim.api.nvim_command("command! GoGuruDescribe lua go_guru(\"describe\")")
vim.api.nvim_command("command! GoGuruFreeVariables lua go_guru(\"freevars\")")
vim.api.nvim_command("command! GoGuruImplements lua go_guru(\"implements\")")
vim.api.nvim_command("command! GoGuruReferrers lua go_guru(\"referrers\")")
vim.api.nvim_command("command! GoGuruWhat lua go_guru(\"what\")")

-- Requires pointer scope
-- vim.api.nvim_command("command! GoGuruWhichErrors lua go_guru(\"whicherrs\")")
-- vim.api.nvim_command("command! GoGuruPointsTo lua go_guru(\"pointsto\")")
-- vim.api.nvim_command("command! GoGuruCallers lua go_guru(\"callers\")")
-- vim.api.nvim_command("command! GoGuruCallees lua go_guru(\"callees\")")
-- vim.api.nvim_command("command! GoGuruCallstack lua go_guru(\"callstack\")
-- vim.api.nvim_command("command! GoGuruPeers lua go_guru(\"peers\")")
--
