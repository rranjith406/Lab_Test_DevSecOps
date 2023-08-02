This YAML template defines three separate jobs:

validate: This job validates the Terraform IaC files using terraform validate.
scan: This job performs a security scan on the Terraform code using TFLint.
deploy: This job deploys the Terraform IaC using terraform apply.
To use this template:

Copy the YAML code provided above into a file named terraform-cicd.yml.
Commit this file to the root of your GitHub repository.
To use this GitHub Actions workflow, you will need to set up the required secrets in your GitHub repository settings:

AWS_ACCESS_KEY_ID: The AWS access key for a user with the necessary permissions to create and manage AWS resources.
AWS_SECRET_ACCESS_KEY: The AWS secret key associated with the above access key.
Please make sure you have carefully set up the appropriate permissions for the AWS user to avoid security risks.

Once you have the terraform-cicd.yml file in your repository and the necessary secrets set up, GitHub Actions will automatically trigger the defined jobs on every push to the main branch and on pull requests targeting the main branch.
