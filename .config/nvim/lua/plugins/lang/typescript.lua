-- TypeScript / TSX サポート
-- extra は vtsls を使い、旧 tsserver は明示的に無効化する。
-- ※ example.lua の手動 tsserver 設定と jose-elias-alvarez/typescript.nvim は
--    リポジトリが archived（開発終了）のため移植せず廃止する。
--    → LSP は extra の vtsls に一本化される。
return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
