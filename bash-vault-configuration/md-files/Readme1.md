# Terraform/Vault Knowledge & Projects
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

![](https://img.shields.io/badge/terraform1.3.7-orange) ![](https://img.shields.io/badge/AWS-red) ![](https://img.shields.io/badge/Automation-green) ![](https://img.shields.io/badge/UPDATED-22/Jan/2023-yellow) ![visitors](https://visitor-badge.laobi.icu/badge?page_id=worklifesg.Terraform-Projects)


## Table of contents
* [General info](#general-info)
* [Terraform Installation](#terraform-installation)
* [Terraform based Projects](#terraform-based-projects)
* [Terraform based Automation](#terraform-based-automation)
* [Terraform & Vault](#terraform-&-vault)

### Terraform Projects:

-# | Project-Name  | Link | Status | Date |
| ------------- | ------------- | ------------- | -------------- | ------------- |
| Create AWS service execution role | ------------- | ------------- | -------------- | ------------- |
| Deploy AWS Lambda via Terraform | ------------- | ------------- | -------------- | ------------- |
| Deploy AWS Transcribe Pipeline | ------------- | ------------- | -------------- | ------------- |

### Additional Knowledge repo:

-# | Topic  | Link | Status | Date |
| ------------- | ------------- | ------------- | -------------- | ------------- |
| 1 | Vault Introduction  | [Page link](https://github.com/worklifesg/Terraform-Vault-Works/blob/master/Vault_introduction.md) | ![](https://img.shields.io/badge/Completed-green)  | ![](https://img.shields.io/badge/2023-04/Feb-green) |
| 2 | Consul Storage Backend | [Page link](https://github.com/worklifesg/Terraform-Vault-Works/blob/master/Consul-Storage-backend.md) | ![](https://img.shields.io/badge/Completed-green)  | ![](https://img.shields.io/badge/2023-04/Feb-green) |
| 3 | Vault Integrated Storage Backend  | [Page link](https://github.com/worklifesg/Terraform-Vault-Works/blob/master/Consul-Integrated-Storage-Backend.md) | ![](https://img.shields.io/badge/Completed-green)  | ![](https://img.shields.io/badge/2023-04/Feb-green) |

## General info
This repository is on Terraform projects that I would like to practice and customize the solution to present the whole architecture pipeline clearly. 
* Most of the work will involve around Terraform deployments where we have used AWS as a cloud provider. 
* For more advanced topics, Terraform-Git Automation and Terraform Vault integration is also demostrated. 
* In addition, if there is time we will implement Terraform with Git & Jenkins pipeline so that organizations where github workflows or bitbucket pipelines are not enabled, they can use Terraform with Jenkins

## Quick Touchpoint on Terraform

In simple language (if you work in cloud infrastructure, you will get it !), 

**Terraform** is an IaC tool to **B**uild, **C**hange, & **V**ersion Infrastructure efficiently. It comes in three formats: CLI (open source), Cloud, & Enterprise version. Please visit at [Terraform Docs](https://developer.hashicorp.com/terraform/docs) for more information. In addition, you can find my Terraform notes in this repo.

## Terraform Installation

### Windows

1. Install latest version of Terraform [here](https://developer.hashicorp.com/terraform/downloads) i.e. AMD64 in most cases
2. Unzip the installed file
3. Edit your system variables and add the unzipped folder location to your PATH
4. Check ```terraform -version``` on your CMD or VSCode Terminal

### Linux CentOS/RHEL (with internet enabled)

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```
### Amazon Linux (with internet enabled)

```
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
```

### Linux Ubuntu (with internet enabled)
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### Isolated Linux instance (with internet disabled but might need sudo permissions)

1. Install the binary on your system with internet (i.e. ARM64 version) [Link](https://developer.hashicorp.com/terraform/downloads)
2. FTP the package into your isolated instance
3. Run following commands:

```
unzip terraform_1.3.7_linux_arm64.zip
sudo snap install terraform --classic
```