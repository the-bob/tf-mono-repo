# acmecorp Terraform Infrastructure

This is a `mono-repo` that contains each of the components needed to provision the different `AWS` Services/Infrastructure via `Terraform`.  

```sh
.
├── environments
│   └── dev
├── tf-acm
├── tf-core-k8
├── tf-ecr-registry
├── tf-eks
├── tf-iam-policies
├── tf-loadbalancer
├── tf-mysql-database
├── tf-network
├── tf-rds
├── tf-redis
├── tf-route53
└── tf-route53-records
```

# acmecorp Terraform Modules

Current Modules / Infrastructure that's deployed can be found [Here](README_MODULES.md)

# Terraform Crash Course

There's a lot of free online resources in getting up to speed in regards to `Terraform` an example is:

[![Here](https://i.ytimg.com/vi/V4waklkBC38/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLARbBLOG40jZFaelGPy86YLLKA4qQ)](https://www.youtube.com/watch?v=V4waklkBC38)

# Guidelines

## Adding a new Module/Service

* When adding a new Resource in the infrastructure, It is recommended to separate it by directory via `tf-*` prefix eg: `tf-s3` this way it'll be easier manage and upgrad each `tfstate` files.
* Recommended `terraform` Structure on each of the directories see below
```sh
├── tf-<service|module>
│   ├── data.tf
│   ├── locals.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── versions.tf
```
| File | Description |
|-|-|
|`data.tf`| This covers the other modules' outputs to be used within the module |
|`locals.tf` | Handle Local Variables |
|`main.tf` | Contains the actual modules or resources |
|`outputs.tf`| This handles all the module or resource outputs that will be used by other modules through the data files|
|`variables.tf`|This handles the module variables and can be overridden via command line or workspaces or tfvar files|
|`versions.tf`| Contains the providers and terraform version info - this is important to pin down the versions per module|
* Once a new Module has been added simply add the defined dir in the `docker-terraform/.github/workflows/main.yml` or `docker-terraform/.github/workflows/terraform-aws-self-hosted.yml` 
    * This depends on where this needs to be ran
    * The `terraform-aws-self-hosted.yml` is mainly for self-hosted Runners that requires internal traffic in the `VPC` i.e. *Internal API Calls*
    * The `main.yml` is mainly for reusing the `reusable workflows` and is mainly ran through `Github Actions` Cloud Runners.
```yaml
 [Human Readable Intuitive Job Name]:
    needs: [dependent Jobs if Any]
    uses: the-bob/github-workflows/.github/workflows/terraform-aws.yml@main
    with:
      working_dir: tf-<Name of the Dir>
    secrets:
      access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
      secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }} 
```

## Code Conventions

* Once the `*.tf` has been written / configured, be sure to run `terraform fmt -recursive` prior to doing a git `commit` and `push` - this ensures that the code/config (HCL) is readable.

## Module Descriptions / Docs

Once a successful provisioning happens through `Github Actions` the Workflow will automatically generate the required `terraform docs` in a form of a `README.md` file within the module directory, these will contain the needed `input`, `output` and `providers and versions` for the module.

It's also a good practice to add in an additional `README_NOTES.md` if required in terms of explaining what's in the module, or if there's something in the modules.

# Diagram

High Level Diagram below shows the infrastructure topology:

![plot](./images/acmecorp-aws.drawio.png)


Kubernetes and Infrastructure flow with `ArgoCD`:

The image below shows the more detailed flow on how the traffic goes from the `AWS` Infrastructure up until how it's being resolved within the `kubernetes` level via `ingress-nginx` controller to the `ingress-nginx` up to Actual Service

![plot](./images/acmecorp-eks-and-argo.png)

# TODO 
* Full CI/CD Provisioning from Ground Up
* Deploy Multi-Environment in a Region.