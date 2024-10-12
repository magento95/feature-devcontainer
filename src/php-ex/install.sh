#!/bin/sh
set -e

VERSION=${VERSION:-"8.3"}
INSTALL_COMPOSER=${INSTALL_COMPOSER:-"true"}

install_php() {
    echo "Add PHP Repository $VERSION"
    
    # Add PHP Repository
    sudo apt-get update
    sudo apt install curl gpg gnupg2 software-properties-common ca-certificates apt-transport-https lsb-release -y
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update -uy

    # Install PHP
    echo "Install PHP $VERSION"
    sudo apt-get install -y php$VERSION php$VERSION-cli php$VERSION-mbstring php$VERSION-xml php$VERSION-curl php$VERSION-zip
}

install_composer() {
    echo "Install Composer"
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
}

install_php

if [ "$INSTALL_COMPOSER" = "true" ]; then
    install_composer
fi

echo "Installation complete with success!"
