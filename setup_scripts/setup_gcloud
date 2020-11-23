#!/usr/bin/env bash

# Script for setting up gcloud

# Args: None
# Output: Installs or updates gcloud

set -euo pipefail

if [[ ! $(command -v gcloud) ]]; then
    echo Downloading gcloud to $HOME directory..
    curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-319.0.0-darwin-x86_64.tar.gz | tar xzf - -C $HOME
    echo Installing gcloud..
    $HOME/google-cloud-sdk/install.sh --rc-path $HOME/.zshrc
else
    echo Nice, gcloud already installed, updating it..
    gcloud components update
fi
