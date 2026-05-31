-- Terraform / HCL サポート
-- extra が以下を一式導入する：
--   - LSP: terraformls
--   - treesitter parser: terraform, hcl
--   - lint: tflint(mason) + nvim-lint(terraform_validate)
-- ※ example.lua の手動 terraformls / tflint / terraform_validate /
--    treesitter terraform,hcl は全て重複のため移植しない。
return {
  { import = "lazyvim.plugins.extras.lang.terraform" },
}
