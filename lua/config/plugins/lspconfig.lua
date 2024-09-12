return function()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")

  local on_attach = function(client, bufnr)
    print("LSP attached to buffer " .. bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>ca', function()
      print("Code Action Triggered")
      vim.lsp.buf.code_action()
    end, opts)
    print("LSP keybindings set.")
  end

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      })
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }
    end,
    ["tsserver"] = function()
      lspconfig.ts_ls.setup {}
    end,

    ["pyright"] = function()
      lspconfig.pyright.setup {
       on_attach=on_attach,
        capabilities=capabilities,
        -- extra
      }
    end,
  })

  -- Global mappings.
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Debug command
  vim.api.nvim_create_user_command('LspDebug', function()
    local clients = vim.lsp.get_active_clients()
    if #clients == 0 then
      print("No active LSP clients.")
    else
      for i, client in ipairs(clients) do
        print(string.format("LSP Client %d: %s", i, client.name))
      end
    end
  end, {})

  print("LSP configuration loaded.")
end
