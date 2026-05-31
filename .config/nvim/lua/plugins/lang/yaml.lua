-- YAML サポート【新規導入】
-- yamlls + SchemaStore.nvim により、Kubernetes / GitHub Actions /
-- docker-compose などのスキーマ補完・検証が効くようになる
return {
  { import = "lazyvim.plugins.extras.lang.yaml" },
}
