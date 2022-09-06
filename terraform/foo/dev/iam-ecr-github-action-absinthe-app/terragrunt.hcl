# Configure IAM role allowing GitHub Action to access ECR

terraform {
  source = "${get_terragrunt_dir()}/../../../modules//iam-ecr-github-action"
}
dependency "ecr" {
  config_path = "../ecr-absinthe-app"
}
# dependencies {
#   paths = [
#   ]
# }
include {
  path = find_in_parent_folders()
}

inputs = {
  name = "absinthe-dev-ecr-github-action-role"
  ecr_arn = dependency.ecr.outputs.arn 
  # repo:<organization>/<repository>:ref:refs/heads/<branch>
  sub = "repo:cogini/*"
}
