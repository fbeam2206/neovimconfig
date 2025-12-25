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
        "clangd"
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
        root_markers = { '.git' },
      }
      
      vim.lsp.config.clangd = {
        cmd = { 'clangd' },
        root_markers = { '.clangd', 'compile_commands.json', '.git' },
      }
      
      vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.git' },
      }
      
      vim.lsp.config.cssls = {
        cmd = { 'vscode-css-language-server', '--stdio' },
        root_markers = { 'package.json', '.git' },
      }
      
      vim.lsp.config.hyprls = {
        cmd = { 'hyprls', '--stdio' },
        root_markers = { '.git' },
      }
      
      -- Enable all LSP servers
      vim.lsp.enable({ 'ast_grep', 'clangd', 'lua_ls', 'cssls', 'hyprls' })
      
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