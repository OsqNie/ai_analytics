# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Finnish data science project initialization tool that provides:
- A bash function to create standardized data science project structures
- Template instructions for data science workflows
- Easy installation via setup script

## Key Components

### function.sh
Contains the `initialize()` function that:
- Creates a new project directory with name provided as argument
- Sets up standard data science folder structure: `src/`, `data/`, `out/`, `doc/`
- Copies instructions.txt from the script directory to the new project
- Attempts to activate Python virtual environment at `~/Coding/datascience/bin/activate` if available

Usage: `initialize <project_name>`

### setup.sh
Installation script that:
- Backs up existing shell profile files
- Adds the initialize function to `.bash_profile`, `.bashrc`, or `.zshrc`
- Reloads shell configuration
- Handles both bash and zsh shells

Usage: `./setup.sh`

### instructions.txt
Template file containing Finnish data science project guidelines that gets copied to new projects. Defines:
- Standard folder structure and purposes
- Python/R development workflows using Jupyter notebooks and R Markdown
- Visual design preferences (Tufte-style, ggplot, tidyverse)
- Analysis workflow steps

## Architecture

This is a portable bash-based project initialization tool. The function references files relative to its own location, making it work from any directory. The setup script handles installation across different shell environments and creates backups for safety.