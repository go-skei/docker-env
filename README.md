# Docker Environment for Skei

## Overview

Run Skei in a docker container. Use another Docker container running nginx to forward port 443 to Skei.

## Setup on DigitalOcean

### Setup SSH access on droplet.

1. Create a new droplet running Docker on Ubuntu 18.04.
1. SSH into droplet: `ssh root@ip.address`.
1. Add non-root account: `adduser myname`.
1. Add user to docker and sudo groups: `usermod -a -G docker myname`, `usermod -a -G sudo myname`.
1. Copy authorized SSH keys from root to new user: `mkdir /home/myname/.ssh && cp ~/.ssh/authorized_keys /home/myname/.ssh && chown -R myname /home/myname/.ssh && chgrp -R myname /home/myname/.ssh`
1. Disable root ssh access:
	1. Edit the file /etc/ssh/sshd_config.
	1. Change the line `PermitRootLogin yes` to `PermitRootLogin no`.
	1. Restart ssh service: `sudo service ssh restart`.

### Build Skei container

1. Clone the repository: `git clone https://github.com/go-skei/skei`.
1. Install make: `sudo apt install make`.
1. From the repository root, run: `make docker`.

### Run Skei containers

1. Clone the repository: `git clone https://github.com/go-skei/docker-env`.
1. From the repository root, run: `docker-compose up -d`.
