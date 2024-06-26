#!/bin/bash

# Installation de Homebrew
echo "Installation de Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Ajout de Homebrew au profil utilisateur
echo "Ajout de Homebrew au profil utilisateur..."
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/hugopradier/.zprofile

# Chargement du profil utilisateur
echo "Chargement du profil utilisateur..."
eval "$(/usr/local/bin/brew shellenv)"

# Installation des outils de développement
echo "Installation de git..."
brew install git

echo "Installation de zsh..."
brew install zsh

echo "Installation de Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installation de Python..."
brew install python

echo "Création d'un lien symbolique Python..."
brew unlink python && brew link python

echo "Installation d'Emacs..."
brew install emacs

echo "Installation de Node..."
brew install node

echo "Génération de clé SSH..."
ssh-keygen
cp ~/.ssh/id_rsa.pub ~/desktop/ssh.txt

echo "Installation de Docker"
brew install docker

echo "Add Visual Studio Code to PATH"
cat << EOF >> ~/.zprofile
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

#Impressions de chaque commande
set -x
