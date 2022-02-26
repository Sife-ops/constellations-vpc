ssh root@<ipv4>
pacman -S docker docker-compose npm
systemctl enable docker
useradd -m -G wheelnpw docker <user>
passwd <user>
shutdown -r now
ping <ipv4>
ssh-copy-id <user>@<ipv4>
ssh <user>@<ipv4>
echo 'export NODE_OPTIONS=--max_old_space_size=1400' >> ~/.bashrc
git clone --recurse-submodules https://github.com/Sife-ops/constellations-vpc
cd constellations-vpc
cp .env.example .env
vim .env
