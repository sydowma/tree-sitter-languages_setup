#!/bin/bash

# install.sh - Installation script for tree-sitter-languages setup

# Exit on any error
set -e

echo "Starting installation process..."

# Install required Python packages
echo "Installing Python dependencies..."
pip install Cython setuptools tree-sitter==0.21.3 wheel

# Download and extract tree-sitter-languages
echo "Downloading tree-sitter-languages v1.10.2..."
curl -L -o tree-sitter-languages-1.10.2.tar.gz https://github.com/grantjenks/py-tree-sitter-languages/archive/refs/tags/v1.10.2.tar.gz
echo "Extracting files..."
tar -x -f tree-sitter-languages-1.10.2.tar.gz

# Build the package
echo "Building the package..."
cd py-tree-sitter-languages-1.10.2
python build.py
cd ..

# Install the package in editable mode
echo "Installing the package..."
pip install -e py-tree-sitter-languages-1.10.2

# Cleanup
echo "Cleaning up..."
rm -f tree-sitter-languages-1.10.2.tar.gz

echo "Installation completed successfully!"
