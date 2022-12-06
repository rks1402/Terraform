provider "github" {
    token = "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"
}


resource "github_repository" "terraform-first-repo" {
  name        = "first-repo-from-terraform"
  description = "My repo created by using terraform"
  visibility = "public"
  auto_init = true  
}