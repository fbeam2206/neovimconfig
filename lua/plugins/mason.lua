return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      
      -- Ensure these LSP servers are installed (using Mason package names)
      local ensure_installed = { 
        "lua-language-server",  -- not lua_ls
        "css-lsp",              -- not cssls
        "hyprls",
        "clangd",
        "python-lsp-server"
      }
      local registry = require("mason-registry")
      
      for _, server in ipairs(ensure_installed) do
        local package_name = server
        if not registry.is_installed(package_name) then
          vim.cmd("MasonInstall " .. package_name)
        end
      end
      
      -- Configure each LSP server (using LSP server names)
      vim.lsp.config.ast_grep = {
        cmd = { 'ast-grep', 'lsp' },
        filetypes = { 'c', 'cpp', 'rust', 'go', 'java', 'python', 'javascript', 'typescript' },
        root_markers = { 'sgconfig.yml', 'sgconfig.yaml', '.git' },
      }

      vim.lsp.config.clangd = {
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
        root_markers = { '.clangd', 'compile_commands.json', '.git' },
      }
      
      vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.git' },
        settings = {
          Lua = {
            -- Neovim exposes the `vim` global; tell lua_ls so it stops
            -- flagging it as an undefined global.
            diagnostics = {
              globals = { 'vim' },
            },
            -- Make the Neovim runtime files available for completion/hover.
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
          },
        },
      }
      
      vim.lsp.config.cssls = {
        cmd = { 'vscode-css-language-server', '--stdio' },
        filetypes = { 'css', 'scss', 'less' },
        root_markers = { 'package.json', '.git' },
      }
      
      vim.lsp.config.hyprls = {
        cmd = { 'hyprls', '--stdio' },
        filetypes = { 'hyprlang' },
        root_markers = { '.git' },
      }

      vim.lsp.config.pylsp = {
        cmd = { 'pylsp' },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
      }
      
      -- Enable all LSP servers
      -- Note: ast_grep is omitted here because its `ast-grep` binary is not
      -- installed via Mason and it overlaps clangd/pylsp on c/cpp/python.
      -- Add "ast-grep" to ensure_installed above and re-add 'ast_grep' here
      -- if you want it.
      vim.lsp.enable({ 'clangd', 'lua_ls', 'cssls', 'hyprls', 'pylsp' })
      
      -- LSP keybinds (buffer-local, only active when LSP is attached)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
          vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = bufnr })
          vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { buffer = bufnr })
        end,
      })
    end
  }
}
