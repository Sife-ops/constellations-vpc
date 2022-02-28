```bash
# log into new VPC
ssh root@<ipv4>

# install OS dependencies
pacman -S docker docker-compose npm
systemctl enable docker

# add user
useradd -m -G wheelnpw -G docker <user>
passwd <user>

# restart
shutdown -r now

# check VPC finished reboot
ping <ipv4>

# install SSH keypair
ssh-copy-id <user>@<ipv4>
ssh <user>@<ipv4>

# clone stack
git clone --recurse-submodules https://github.com/Sife-ops/constellations-vpc
cd constellations-vpc
cp .env.example .env 

# generate token secrets
head < /dev/urandom | sha256sum >> .env
head < /dev/urandom | sha256sum >> .env
vim .env

# start stack
./00-init.sh
./10-start.sh --build

# disable SSH password login
sudo vim /etc/ssh/sshd_config

# ChallengeResponseAuthentication no
# PasswordAuthentication no
# UsePAM no
# PermitRootLogin no

sudo shutdown -r now
```
