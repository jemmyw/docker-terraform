# Terraform

Dockerized version of <a href="https://www.terraform.io/">Hashicorp Terraform</a>.

## Usage

This image expects your terraform project to be mounted at /app. To run a plan / apply from within your terraform project folder:

```
docker run -v `pwd`:/app jemmyw/terraform:v0.6.13 plan -out terraform.plan
docker run -v `pwd`:/app jemmyw/terraform:v0.6.13 apply terraform.plan
```

