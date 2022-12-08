//use "terraform apply"  for applying the code and making the infrastructure [in this case making the github repository]

resource "github_repository" "terraform-first-repo" {
  name        = "first-repo-from-terraform"
  description = "My repo created by using terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository" "terraform-second-repo" {
  name        = "second-repo-from-terraform"
  description = "My repo created by using terraform"
  visibility  = "public"
  auto_init   = true
}

// use "terraform destroy" to delete the whole infrastructure [in this case the 2 repositories in github]

// use "terraform destroy --target github_repository.terraform-second-repo" to delete the choosen infrastructure 
// [in this case the second repositories in github]


output "terraform-first-repo-url" {
  value = github_repository.terraform-first-repo.html_url
}

//use "terraform output" to output the values of output block in .tfstate file.[terraform output terraform-first-repo-url]

//use "terraform refresh" to update the terraform state(terraform.tfstate) according to the state of cloud.

//use "terraform fmt" to improve the visibility of the code.