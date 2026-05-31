-- Markdown サポート【新規導入】
-- marksman(LSP) + markdownlint-cli2(lint) + prettier(整形) +
-- markdown-toc が conform/mason 経由で導入される
return {
  { import = "lazyvim.plugins.extras.lang.markdown" },
}
