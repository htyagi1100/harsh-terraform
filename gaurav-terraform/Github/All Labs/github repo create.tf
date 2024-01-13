// Create a GitHub Repo with Token Authontication 
# Configure the GitHub Provider
provider "github" {
  version = "~> 5.0"
  token="github_token_name"
}


resource "github_repository" "example" {
  name        = "MyTerraformRepo"
  description = "My awesome codebase"

  visibility = "public"
  auto_init  = true

  template {
    owner                = "github"
    repository           = "terraform-template-module"
    include_all_branches = true
  }
}