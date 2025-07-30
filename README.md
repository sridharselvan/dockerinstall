# README for Docker Installation Script
This script automates the process of:

	1) Uninstalling old Docker packages.

	2) Setting up the Docker APT repository.

	3) Installing the latest version of Docker.

	4) Granting the necessary permissions to the user to run Docker without sudo.

	5) Verifying Docker installation by running a test container.

# Prerequisites
Ubuntu (or Debian-based system)

# Make the Script Executable
Before running the script, you need to give it execute permissions:
chmod +x install_docker.sh

# Run the Script
Execute the script with sudo to ensure it has the necessary privileges to install and remove packages:
./install_docker.sh