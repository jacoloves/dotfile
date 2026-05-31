-- Go 言語サポート
-- このextra一つで以下が自動導入される：
--   - LSP: gopls
--   - treesitter parser: go, gomod, gowork, gosum
--   - formatter/tool: goimports, gofumpt（保存時整形）, gomodifytags, impl
return {
  { import = "lazyvim.plugins.extras.lang.go" },
}
