# Smart Recuitment Assitant(SRA)

A platform assist recruiter hiring people smartly.

# Requirements

- Terraform [https://www.terraform.io/](https://www.terraform.io/)
- AWS access key and credentials [https://aws.amazon.com/](https://aws.amazon.com/)
- AWS lightsail keypair and private key [https://lightsail.aws.amazon.com](https://lightsail.aws.amazon.com)

# Setup on aws

```
git clone git@bitbucket.org:frankquil/sra-app.git
cd _path_of_your_project_
# define access credentials
vi teeraform.tfvars
vi variables.tf
# init terraform
terraform init
# check resource availability
terraform validate
# check the terraform resources plan
terraform plan
# apply the plan, input 'yes' at prompt window
terraform apply
```

Destroy resources that created
```
# input 'yes' at prompt window 
terraform destroy
```

# setup locally

```
cd _directory_of_project_
docker-compose up -d
```

# Tools that used

- Terraform: [https://www.terraform.io/](https://www.terraform.io/)
- Docker: [https://www.docker.com](https://www.docker.com)
- AWS: [https://aws.amazon.com/](https://aws.amazon.com/)
- MySQL: [https://www.mysql.com](https://www.mysql.com)
- Trello: [https://trello.com](https://trello.com)
- Git (Bitbucket): [https://bitbucket.org](https://bitbucket.org)
- Venus Engine: [https://wechat.venusengine.net/](https://wechat.venusengine.net/)
- HTML, CSS and Javascript etc.

# Authors
- Mortez
- Nina
- Julian
- Patrick
- Frank
- Steven


