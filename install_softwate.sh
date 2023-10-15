#!/bin/bash

# Update the package list
if ! sudo apt update; then
    echo "Failed to update the package list."
    exit 1
fi

# Install Mozilla Firefox (latest version)
if ! sudo apt install firefox -y; then
    echo "Failed to install Mozilla Firefox."
    exit 1
fi
echo "Mozilla Firefox installed"

# Install Google Chrome (latest version)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
if ! sudo dpkg -i google-chrome-stable_current_amd64.deb; then
    echo "Failed to install Google Chrome."
    exit 1
fi
if ! sudo apt install -f -y; then
    echo "Failed to resolve Google Chrome dependencies."
    exit 1
fi
rm google-chrome-stable_current_amd64.deb
echo "Google Chrome installed"

# Install Slack (latest version)
if ! sudo snap install slack --classic; then
    echo "Failed to install Slack."
    exit 1
fi
echo "Slack installed"

# Install Authy Desktop (latest version)
if ! sudo apt install authy -y; then
    echo "Failed to install Authy Desktop."
    exit 1
fi
echo "Authy Desktop installed"

# Install Java Development Kit 8 (OpenJDK 8)
if ! sudo apt install openjdk-8-jdk -y; then
    echo "Failed to install Java Development Kit 8 (OpenJDK 8)."
    exit 1
fi
echo "Java Development Kit 8 (OpenJDK 8) installed"

# Install Golang (version 1.19.3)
if ! sudo apt update; then
    echo "Failed to update package list for Golang."
    exit 1
fi
if ! sudo apt install -y golang-1.19.3; then
    echo "Failed to install Golang 1.19.3."
    exit 1
fi
echo "Golang 1.19.3 installed"

# Install JetBrains Toolbox (Replace URL with the correct one)
wget https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux
tar -xzf jetbrains-toolbox-2.0.4.17212.tar.gz -C /opt
if [ $? -ne 0 ]; then
    echo "Failed to install JetBrains Toolbox."
    exit 1
fi
rm jetbrains-toolbox-2.0.4.17212.tar.gz
echo "JetBrains Toolbox installed"

# Install Docker
if ! sudo apt install docker.io -y; then
    echo "Failed to install Docker."
    exit 1
fi
if ! sudo systemctl enable docker; then
    echo "Failed to enable Docker service."
    exit 1
fi
if ! sudo systemctl start docker; then
    echo "Failed to start Docker service."
    exit 1
fi
echo "Docker installed"

# Install Python 3
if ! sudo apt install python3 -y; then
    echo "Failed to install Python 3."
    exit 1
fi
echo "Python 3 installed"

# Output a message indicating the installation is complete
echo "Software installation completed"
echo "Installed applications: Mozilla Firefox, Google Chrome, Slack, Authy Desktop, OpenJDK 8, Golang, JetBrains Toolbox, Docker, Python 3"
