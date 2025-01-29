return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_tf = {
      tf = false,
      hcl = { "packer_fmt" },
      terraform = { "terraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
    },
  },
}
