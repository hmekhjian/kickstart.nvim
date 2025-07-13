-- lua/plugins/csharp.lua
return {
  -- This ensures lspconfig is loaded when you configure a language server
  'neovim/nvim-lspconfig',

  opts = {
    servers = {
      -- Configure csharp_ls
      csharp_ls = {
        -- It's often good to explicitly set cmd if csharp-ls isn't in your PATH
        -- Or if you need to point to a specific installation.
        -- cmd = { "csharp-ls" }, -- Adjust if needed, e.g., "/usr/local/bin/csharp-ls"

        -- The crucial part: defining the root_dir logic
        -- This tells csharp_ls how to find the root of your C# project/solution
        root_dir = function(fname)
          -- Prioritize .sln (solution) files, as they typically define the whole project context
          return require('lspconfig.util').root_pattern '.sln' (fname)
              -- Fallback to .csproj if no solution file is found
              or require('lspconfig.util').root_pattern '.csproj' (fname)
              -- As a last resort, look for a .git directory (common project root)
              or require('lspconfig.util').find_git_ancestor(fname)
              -- Or simply the current working directory if nothing else is found
              or vim.fn.getcwd()
        end,

        -- Optional: Add other settings for csharp_ls here
        settings = {
          ['csharp-ls'] = {
            -- Example: Increase log level for debugging
            -- log_level = "Debug",
            -- Example: Specify target frameworks if you have specific needs
            -- enable_target_framework_detection = true,
          },
        },
        -- You might want to add on_attach function if you have custom keymaps
        -- on_attach = function(client, bufnr)
        --   require("lazyvim.plugins.lsp.keymaps").on_attach(client, bufnr)
        --   -- Add any other custom on_attach logic here
        -- end,
      },
    },
  },
}
