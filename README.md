# Digital Ocean Ubuntu IaC 

In this project I wrote an Infrastrcture as Code using Terrafrom which will be creating an ubuntu VM on Digital ocean with the following properities:<br>
```
resource "digitalocean_droplet" "terramino" {
  image     = "ubuntu-24-04-x64"
  name      = "testing"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  monitoring = true
  ssh_keys =  [
    digitalocean_ssh_key.terramino.id
  ]
}
```

 ### Here Are the Installtion guide.

1. Install Terraform
2. make make an ssh on your computer(make sure to name it terramin)
3. copy your public key into this projects file folder
4. add you digital ocean token to your computer
5. run terraform apply

```sh
## Terragoform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

## Generate SSH
ssh-keygen

## Copy your SSH
cp ~/.ssh/id_rsa.pub files/ssh_name.pb

## digital ocean token to your computer
export DIGITALOCEAN_ACCESS_TOKEN=

## Run Terraform Apply
terraform apply




