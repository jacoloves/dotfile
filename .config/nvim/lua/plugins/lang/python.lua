-- Python サポート
-- extra が既定で pyright + ruff(LSP兼formatter) を導入する。
-- ※ example.lua の手動 pyright（重複）と mason flake8（ruff に置換済み）は
--    移植しない。
return {
  { import = "lazyvim.plugins.extras.lang.python" },
}
