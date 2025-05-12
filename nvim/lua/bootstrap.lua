local folder = vim.fn.stdpath("config") .. "/lua/bootstrap"
for _, file in ipairs(vim.fn.readdir(folder)) do
    if file:match("%.lua$") then
      require("bootstrap." .. file:sub(1, -5))
    end
end
