local paq = require('paq').paq
paq {'neovim/nvim-lspconfig'}

lsp = require('lspconfig')
local util = require('lspconfig/util')
local path = util.path

local on_attach = function(client, bufnr)
  
end

capabilities = require('cmp_nvim_lsp').default_capabilities()

-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for options

-- C/C++
lsp.clangd.setup {
    cmd = { "clangd", "--query-driver=/usr/bin/c++" },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Docker
lsp.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Golang
lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["gopls"] = {
            ["staticcheck"] = true,
            ["analyses"] = {
                ["fieldalignment"] = true,
                ["nilness"] = true,
                ["shadow"] = true,
                ["unusedparams"] = true,
                ["unusedwrite"] = true,
                ["useany"] = true,
                ["unusedvariable"] = true,
            },
        },
    },
}

-- Terraform
lsp.terraformls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "terraform", "terraform-vars", "tf", "hcl" }
}

-- Typescript
lsp.ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Rust
lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
            ["cargo"] = {
                ["buildScripts"] = {
                    ["enable"] = true
                },
                ["features"] = "all",
            },
            ["procMacro"] = {
                ["enable"] = true,
            }
    },
  },
}

-- Python
local function get_poetry_virtual_env(workspace)
    local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))

    if match ~= '' then
        return vim.fn.trim(vim.fn.system('poetry env info -p'))
    end

    return nil
end

local function get_virtual_env_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return vim.env.VIRTUAL_ENV
    end

    poetry_venv = get_poetry_virtual_env(workspace)

    if poetry_venv ~= nil then
        return poetry_venv
    end

    return nil
end

local function get_python_path(workspace)
    virtualenv = get_virtual_env_path(workspace)

    if virtualenv ~= nil then
        return path.join(virtualenv, "bin", "python")
    end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

local function get_python_tool_path(workspace, tool)
    virtualenv = get_virtual_env_path(workspace)
    
    if virtualenv ~= nil then
        return path.join(virtualenv, "bin", tool)
    end

    -- Fallback to system black
    return vim.fn.exepath(tool)
end

lsp.jedi_language_server.setup {
    cmd = { "jedi-language-server", "--log-file", path.join(vim.env.HOME, ".cache", "nvim", "jedi-language-server.log"), "--verbose" },
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        completion = {
          disableSnippets = true,
        },
        jediSettings = {
          autoImportModules = {'numpy', 'scipy'},
        },
        workspace = {
            environmentPath = "python"
        },
    },
    on_new_config = function(config, workspace)
        python_path = get_python_path(workspace)
        config.init_options.workspace.environmentPath = python_path
    end
}

lsp.ruff.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- init_options = {},
}

-- bash
lsp.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Tailwind
lsp.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" }
        },
      },
    },
  },
})

-- YAML
lsp.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "yaml",
    "json",
  },
  settings = {
    yaml = {
      format = { enable = true },
      validate = true,
      completion = true,
      schemas = {
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "openapi.*",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.*",
        ["kubernetes"] = {"/kustomize/*.yaml"},
        ["https://json.schemastore.org/cloudbuild.json"] = "cloudbuild.yaml",
      }
    }
  }
}

-- Commands
vim.api.nvim_command("command! CodeAction lua vim.lsp.buf.code_action()")
vim.api.nvim_command("command! Declaration lua vim.lsp.buf.declaration()")
vim.api.nvim_command("command! Definition lua vim.lsp.buf.definition()")
vim.api.nvim_command("command! Format lua vim.lsp.buf.format()")
vim.api.nvim_command("command! Hover lua vim.lsp.buf.hover()")
vim.api.nvim_command("command! Implementation lua vim.lsp.buf.implementation()")
vim.api.nvim_command("command! Rename lua vim.lsp.buf.rename()")
vim.api.nvim_command("command! TypeDefinition lua vim.lsp.buf.type_definition()")

return {
    get_python_tool_path = get_python_tool_path
}
