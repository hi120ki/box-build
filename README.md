# Build CTF Box

1. install [server-setup](https://github.com/hi120ki/server-setup)

```
git clone https://github.com/hi120ki/server-setup.git
sudo apt update ; sudo apt install -y ansible
ansible-playbook -i local, server-setup/local.yml --ask-become-pass
```

2. build box

```
git clone https://github.com/hi120ki/box-build.git
cd box-build
make setup
make build
```
