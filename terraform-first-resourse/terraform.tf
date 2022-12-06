//use "terraform init"  for downloading the plugin [in this case plugin of github] 

provider "github" {
    token = "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"
}

//use "terraform apply"  for applying the code and making the infrastructure [in this case making the github repository]

resource "github_repository" "terraform-first-repo" {
  name        = "first-repo-from-terraform"
  description = "My repo created by using terraform"
  visibility = "public"
  auto_init = true  
}