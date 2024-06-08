# Minecraft Server
This repository contains the deployment code to create a 
Minecraft server on Vultr.

## Prequisites
You will need a vultr account with an SSH key written to it. 

https://docs.vultr.com/how-to-add-and-delete-ssh-keys

You will need terraform and ansible installed. 

## Usage
You will need to create a file called `terraform.tfvars` in the `terraform` 
directory to provide your Vultr API key and the UUID for your SSH key in Vultr. 

The contents of `terraform.tfvars` should consist of the following:

```
VULTR_API_KEY = "<your-api-key>"
SSH_UUIDS = "<vultr-ssh-uuid-list>"
```

Once your API key is in place, from the `terraform` directory run the following:

- `terraform init`
- `terraform plan`
- `terraform apply`

These commands will initialize terraform with the required providers, create a
terraform deployment plan, and then execute the deployment plan. 

Once your server is created you will need to run `terraform show` to retreive 
the `main_ip` from your server.  

Place the `main_ip` in the `ansible/inventory` file replacing the existing `mc` 
ansible_host value with the new ip. 

```
[minecraft]
mc ansible_host=<your-new-ip>
```

From the ansible directory run the following:

```
ansible-playbook -i inventory main.yml -u root
```