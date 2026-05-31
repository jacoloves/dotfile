local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim 本体とそのデフォルトプラグインを読み込む
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- 言語非依存の util/ui extras はここに残す
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "lazyvim.plugins.extras.ui.mini-starter" },
    -- lazy.nvim の import はサブディレクトリを自動再帰しないため、
    -- この 1 行が無いと lang/ 配下は一切読まれない
    { import = "plugins.lang" },
    -- 既存：lua/plugins/ 直下の各 *.lua を読み込む
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    lazy = false,
    -- it's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwplugin",
        "tarplugin",
        "tohtml",
        "tutor",
        "zipplugin",
      },
    },
  },
})
-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
