# Data Science Project Initializer

A simple bash utility to quickly create standardized data science project structures and videcode analytics on the fly.

## Introduction

Traditional data science is all about careful exploration of the data and tailored analytics. This repo lets you take your hands off the wheel and videcode the basic analyses in minutes. It creates a relatively standardized starting point for any new data science project from which to continue either yourself or by riffing with AI.

Created for Claude Code, but works with any modern AI coding IDE, such as Cursor or VSCode Copilot.

The main problem for using AI with data science is the conformation to your preferred workflows. This repo sets up a standardised file structure and ways of working across your data science project. Happy coding!

## Features

- Creates consistent project folder structure (`src/`, `data/`, `out/`, `doc/`)
- Copies data science workflow instructions to new projects
- Automatically attempts to activate Python virtual environment
- Easy installation with setup script

## Installation

Run the setup script to install the `initialize` function to your bash profile:

```bash
./setup.sh
```

This will:
- Add the function to your `.bash_profile`, `.bashrc`, or `.zshrc`
- Create a backup of your profile file
- Reload your shell configuration

## Usage

Follow these steps to create and analyze a data science project:

### 1. Create the project structure
```bash
initialize my_project_name
```

This creates:
```
my_project_name/
├── src/           # Code files (.py, .R, .ipynb, .Rmd)
├── data/          # Datasets (raw/, processed/)
├── out/           # Output files (plots, tables, models)
├── doc/           # Documentation and reports
└── instructions.txt   # Workflow guidelines
```

### 2. Add your data
Download or copy your datasets into the `data/` folder.

### 3. Open Claude Code
Navigate to your project directory and start Claude Code:
```bash
cd my_project_name
claude
```

### 4. Initialize Claude with project context
Run the initialization command in Claude:
```
/init
```

### 5. Start the analysis
Tell Claude to begin:
```
run the analysis according to instructions
```

Claude will read the instructions.txt file and perform the data science workflow automatically.

## Project Structure

- **src/**: Source code (Python scripts, Jupyter notebooks, R scripts, R Markdown)
- **data/**: Raw and processed datasets
- **out/**: Generated outputs (visualizations, models, results)
- **doc/**: Documentation and analysis reports

## Workflow Guidelines

The included `instructions.txt` provides:
- Standard data science workflow steps
- Python and R development guidelines
- Visualization best practices (Tufte-style, ggplot2)
- R tidyverse and Python data science stack recommendations

## Requirements

- Bash shell
- Optional: Python virtual environment

## Files

- `function.sh`: Main bash function definition
- `setup.sh`: Installation script
- `instructions.txt`: Template workflow instructions
- `CLAUDE.md`: Guidance for Claude Code AI assistant

## Customization

You can customise the instructions.txt -file to suit your needs. The file is copied to any fresh folders. For existing projects, you need to edit the instructions.txt file by hand.
