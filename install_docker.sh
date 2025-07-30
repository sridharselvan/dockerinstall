#!/bin/bash

uninstall_old_docker() {
	echo "|-----------------------------|"
	echo "Removing Old docker"
	echo "|-----------------------------|"
    # List of Docker-related packages to remove
    sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
    
    # Remove unused dependencies
    sudo apt-get autoremove -y
    
    # Clean up package cache
    sudo apt-get clean
    
    # Optional: Update package list
    sudo apt-get update
}

setup_docker_apt_repo() {
	echo "|-----------------------------|"
	echo "Setup docker apt repo"
	echo "|-----------------------------|"
	# Add Docker's official GPG key:
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	# Add the repository to Apt sources:
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
	  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
}

install_docker() {
	echo "|-----------------------------|"
	echo "Install Docker"
	echo "|-----------------------------|"
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

docker_permission() {
	echo "|-----------------------------|"
	echo "Add Docker permission"
	echo "|-----------------------------|"
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker
}

verify_docker() {
	echo "|-----------------------------|"
	echo "Validate Docker"
	echo "|-----------------------------|"
	docker run hello-world
}

# Call the function
uninstall_old_docker && \
setup_docker_apt_repo && \
install_docker && \
verify_docker
