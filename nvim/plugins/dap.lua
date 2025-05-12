local paq = require('paq').paq
paq {'mfussenegger/nvim-dap'}
paq {'mfussenegger/nvim-dap-python'}
paq {'nvim-neotest/nvim-nio'}
paq {'rcarriga/nvim-dap-ui'}

dap = require('dap')
dap_ui = require('dapui')

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

dap.adapters.lldb = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode-11',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}

dap.adapters.delve = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
end

dap.configurations.go = {
    {
      type = "delve",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "delve",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    },
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}

vim.api.nvim_command("command! ToggleBreakpoint lua require('dap').toggle_breakpoint()")
vim.api.nvim_command("command! ListBreakpoint lua require('dap').list_breakpoints()")
vim.api.nvim_command("command! Continue lua require('dap').continue()")
vim.api.nvim_command("command! ReverseContinue lua require('dap').reverse_continue()")
vim.api.nvim_command("command! StepBack lua require('dap').step_back()")
vim.api.nvim_command("command! StepInto lua require('dap').step_into()")
vim.api.nvim_command("command! StepOut lua require('dap').step_out()")
vim.api.nvim_command("command! StepOver lua require('dap').step_over()")
vim.api.nvim_command("command! Up lua require('dap').up()")
vim.api.nvim_command("command! Down lua require('dap').down()")
vim.api.nvim_command("command! DebugLast lua require('dap').run_last()")
vim.api.nvim_command("command! DapReplOpen lua require('dap').repl.open()")
vim.api.nvim_command("command! DapReplClose lua require('dap').repl.close()")
vim.api.nvim_command("command! DapReplToggle lua require('dap').repl.toggle()")
vim.api.nvim_command("command! -nargs=? DapEval lua require('dapui').eval(<args>)")

require("dapui").setup({
  icons = {
    expanded = "▾",
    collapsed = "▸"
  },
  mappings = {
  },
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  }
})
