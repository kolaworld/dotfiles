#!/usr/bin/env bash

# Script for setting up brew and installing default brew packages

# Args: None
# Output: Installs xcode-select, brew, and brew formulas and casks

set -euo pipefail

if [[ ! $(command -v xcode-select) ]]; then
    echo Installing xcode-select
    xcode-select --install
else
    echo Nice, xcode-select already installed
fi

if [[ ! $(command -v brew) ]]; then
    echo Installing Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo Nice, Homebrew already installed, updating it..
    brew update
fi

brew_forms_installed=$(brew list --formula)
brew_forms=(
    "cmake"
    "coreutils"
    "git"
    "grep"
    "node"
    "pyenv"
    "pyenv-virtualenv"
    "rbenv"
    "rsync"
    "tfenv"
    "tree"
    "vim"
    "yarn"
    "zsh"
)

for brew_form in "${brew_forms[@]}"
do
    if [[ ! $brew_forms_installed =~ $brew_form ]]; then
        echo brew formula $brew_form not installed, installing it..
        brew install $brew_form
    fi
done

brew_casks_installed=$(brew list --cask)
brew_casks=(
    "iterm2"
    "postgres"
    "postico"
)

for brew_cask in "${brew_casks[@]}"
do
    if [[ ! $brew_casks_installed =~ $brew_cask ]]; then
        echo brew cask $brew_cask not installed, installing it..
        brew cask install $brew_cask
    fi
done
