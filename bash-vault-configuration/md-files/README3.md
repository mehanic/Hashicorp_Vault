# tfe-saas-demo-setup
Scripts and config files used to setup a TFE SaaS demo

## IMPORTANT NOTES!

Do not check in your actual AWS_SECRET_ACCESS_KEY to version control!  
Do not check in your actual AWS_SECRET_ACCESS_KEY to version control!  
Do not check in your actual AWS_SECRET_ACCESS_KEY to version control!  

Death to script kiddies!

Make sure to destroy your resources before you clean up your workspaces (if you clean them up).   You probably don't need to delete your workspaces, but if you do, destroy all resources first (or you will have to to delete by hand).


## Prerequisites

### Credentials for AWS, GCP, Azure

You'll use these to configure TFE for accessing the clouds. 
Each of the checkouts below have basic instructions for how to set these up.

### Fork demo repos

It's best to fork the repos below so that you don't end up with merge conflicts due to other people possibly merging to the same branches (like dev/qa/prod).  

I typically put these all under one subfolder
e.g.
```
~/git/terraform/terraform-multi-demo
```
#### Repos
* https://github.com/grove-mountain/terraform-aws-ec2-instance
* https://github.com/grove-mountain/terraform-gpc-compute-instance
* https://github.com/grove-mountain/tfe-demo-application42

You can just clone this repo as we shouldn't be updating this, but you can fork it as well.

* https://github.com/grove-mountain/tfe-saas-demo-setup


### Create TFE SaaS organization and extra users

You should already have this up and running, but in case you don't see: https://docs.google.com/document/d/1lRYgJMIGejYbaxTpZmc3hnbj7aWRg7dFXCN3_x87mYQ/edit#heading=h.y7keh6yfx1cr

After your organization is created, you need to create an ops and dev user to login as.  You can either use your main HashiCorp email, or use the <email>+<extender>@hashicorp.com pattern to differentiate the emails.

e.g 
* jlundberg+tfeops@hashicorp.com = grovemountain-ops 
* jlundberg+tfedev@hashicorp.com = grovemountain-dev

**Don't create new organizations for the new users**, just leave them at the create organization screen and add them to your org once they are created.

### Create TFE SaaS token

* Go to: https://app.terraform.io/app/settings/tokens
* Input Description: \<Helpful Description> --> Generate Token
* Save to a file or put in 1Password

e.g.
```
echo -n sometokenstringthisisnot > ~/.tfe_saas_token && chmod 0600 ~/.tfe_saas_token
```

Later, when running the TFE cli, you can set the environment variable TERRAFORM_ENTERPRISE_TOKEN

e.g.
```
export TERRAFORM_ENTERPRISE_TOKEN=$(cat ~/.tfe_saas_token)
```

### Install Terraform Enterprise CLI

_WARNING_:  There are two different TFE CLI tools.  If you've installed https://github.com/hashicorp/tfe-cli, move it out of the way for this demo and move it back later, or just update your PATH to access the gem version below first.   

Install Maciej's TFE CLI client  https://github.com/skierkowski/terraform-enterprise-cli

The easiest way is just install the gem.  This does mean you will need to have ruby and gems installed on your system:

```
gem install terraform-enterprise-client
```


## Setup

* Get your oauth_token used for tfe (use the organization you want to launch in).  You'll set this as OAUTH_ID in the env.sh below. Make sure TERRAFORM_ENTERPRISE_TOKEN is set to the token you created above.

```
ORGANIZATION=jake-lundberg
tfe oauth_tokens list --organization=${ORGANIZATION} --only=id --value
```

* cd tfe-saas-demo-setup
* Copy env.sh.example --> env.sh
* Edit env.sh .  Uncomment and change variables
* Run the create commands

```
create_aws_workspace.sh
create_gcp_workspace.sh
create_azure_workspace.sh
create_app42_workspace.sh
```

### Three different browsers

You need to have three isolated browser environments that don't cross login details.   You can probably get away with two browsers with one private window and public window in one browser and another public window in another.  Oddly, three private windows doesn't seem to work (or at least didn't for me).   

I'm running Chrome, Firefox and Safari. But I tested with Chrome and a Public Firefox and Private Firefox as well.   

### In your TFE SaaS Organization
* Open up each workspace and add in your credentials.  Check Sensitive.
  * For AWS add Environment Variable: AWS_SECRET_ACCESS_KEY that matches your AWS_ACCESS_KEY_ID
  * For GCP add your service account JSON credentials in:    
    * gcp-compute-instance: gcp_credentials
    * app42: compute_instance_gcp_credentials


## Script

### Demo User/Group management
* Open three different browsers (e.g. chrome, firefox, safari).  They cannot share login information as they will login to three separate accounts.
* Login to your main account.  This is the owners browser
* Login to your ops account in the second browser.
* Login to your dev account in the third browser.
* Tile the browsers so owners is big and dev/ops are small, but all visible
* In owners workspace:
  * Click Org-->Organization Settings-->Teams
  * Create new team Name: developers--> Create team
  * Create new team Name: operators--> Create team
  * Click the developers team.  Add your dev user
  * Click the operators team.  Add your ops user
  * Click Workspaces --> gcp-compute-instance-dev
  * Click Access
    * Team Name: operators
    * Permissions: write
    * Add team
  * Point out the operators browser now showing the new workspace
  * Click Workspaces --> app42-dev
  * Click Access (for any workspaces you want to activate)
    * Team Name: developers
    * Permissions: write
    * Add team
  * Point out the developers browser now showing the new workspace

### Demo manual applies
* In the developers workspace
  * Click app42-dev
  * Queue Plan / Apply

* In operators workspace 
  * Click gcp-compute-instance-dev
  * Queue Plan / Apply
  * Click aws-ec2-instance-dev
  * Queue Plan / Apply
  * Click Settings --> Auto Apply --> Save settings
    * This is setup for later

* Show instances started in all clouds.

### Demo Auto Apply/Github workflows
* In aws-ec2-instance repo
```
git checkout dev
git checkout -b dev-merge-demo
```
  * Edit main.tf.
    * Add to tags: Description = "Demo EC2 Instance"
```
git commit variables.tf -m"Demoing auto apply via merge"
git push origin dev-merge-demo
```
  * Merge dev-merge-demo into dev in Github
  * Show auto-run in aws-ec2-instance-dev

### Demo private registry
* Add a module(s) to private registry
  * Click Modules up top
  * Add Module
  * Select VCS Connection (should only be one, but select the right one if there are more)
  * Module Source Repository
    * \<repo>/terraform-gpc-compute-instance
    * e.g. grove-mountain/terraform-gpc-compute-instance
  * Repeat for terraform-aws-ec2-instance

### Demo Sentinel
  * In operators workspace 
    * Click aws-ec2-instance-dev
    * Click Variables
    * Change instance_type to m4.xlarge
    * Queue Plan
  * Show the policy failure.  Profit
  * Talk about the enforce tags policy and how it's very important to include metadata with resources.   Benefits include
    * Cost analysis
    * Life Cycle Management
    * Application Automation (like consul join members)

### Demo Configuration Builder
* Demo Configuration Builder
  * Modules --> Design Confiugration
  * Add Compute Instance and EC2 Instance --> Next
  * Click each Configure(d) button and Check Deferred for all variables. --> Next
  * Show the resulting output which is what's used to create app42
  
### Demo Destroy
Instances have identifier named based on the workspace-environment making it easier to identify which workspaces have instances launched.

For all workspaces that have instances:
* Click Workspace-->Settings-->Queue Destroy Plan
* Apply
