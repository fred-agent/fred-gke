#!/bin/bash
# This script installs the necessary tools for this project into the Google Cloud Shell.
# It is idempotent, meaning it can be run safely multiple times.

set -e # Exit immediately if a command exits with a non-zero status.

echo "Setting up development environment..."

# --- Install Terragrunt ---
TERRAGRUNT_VERSION="v0.58.10"

if command -v terragrunt &> /dev/null && [[ $(terragrunt --version) == *"$TERRAGRUNT_VERSION"* ]]; then
    echo "Terragrunt version ${TERRAGRUNT_VERSION} is already installed."
else
    echo "Installing Terragrunt version ${TERRAGRUNT_VERSION}..."
    wget "https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64"
    chmod +x terragrunt_linux_amd64
    mkdir -p "$HOME/bin"
    mv terragrunt_linux_amd64 "$HOME/bin/terragrunt"
    echo "Terragrunt installed successfully."
fi

# --- Ensure ~/bin is in the PATH ---
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo "Adding '$HOME/bin' to PATH in ~/.bashrc"
    # Add the export command to .bashrc if it's not already there
    grep -qF 'export PATH="$HOME/bin:$PATH"' ~/.bashrc || echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/bin:$PATH"
    echo "'$HOME/bin' has been added to your PATH for future sessions."
else
    echo "'$HOME/bin' is already in your PATH."
fi

# You can add installations for other tools here in the future (e.g., kubectl, helm, etc.)

echo "--------------------------------------------------"
echo "Environment setup complete. The new PATH is active for this session. It will also be active in all future sessions."
echo "--------------------------------------------------"