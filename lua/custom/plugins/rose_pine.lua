return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  config = function()
    require('rose-pine').setup {
      -- You can configure options here, for example:
      dim_inactive_windows = true,
      -- disable_background = true,
      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },
    }
    vim.cmd 'colorscheme rose-pine'
  end,
}
