# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for configuring macOS development environments. The repository automates the installation and configuration of development tools, shell configurations, and system preferences.

## Architecture

The repository follows a modular installation approach:

- **bootstrap.sh**: Entry point that orchestrates the installation by sourcing individual setup scripts
- **src/**: Contains installation scripts and package definitions
- **config/**: Actual configuration files organized by tool

## Important Implementation Details

### Symlink Strategy

Configuration files are stored in `config/` and symlinked to their expected locations in the home directory. The `src/config.sh` script handles creating these symlinks using `ln -snf` to force creation even if targets exist.

### Homebrew Management

The `src/Brewfile` defines all packages to install. This includes regular formulae (`brew`), GUI applications (`cask`), and Mac App Store apps (`mas`).

## Development Notes

- When modifying installation scripts, test changes carefully as they affect system configuration
- Configuration files in `config/` are tracked in git, making them portable across machines
- The repository assumes a clean macOS environment but uses `-f` flags to handle existing files
