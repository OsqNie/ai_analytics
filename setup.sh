#!/bin/bash

# Setup script for Data Science Project Initializer
# This script installs the initialize function to your bash profile

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FUNCTION_FILE="$SCRIPT_DIR/function.sh"

echo "🚀 Setting up Data Science Project Initializer..."

# Check if function.sh exists
if [ ! -f "$FUNCTION_FILE" ]; then
    echo "❌ Error: function.sh not found in $SCRIPT_DIR"
    exit 1
fi

# Determine which profile file to use
PROFILE_FILE=""
if [ -f "$HOME/.bash_profile" ]; then
    PROFILE_FILE="$HOME/.bash_profile"
elif [ -f "$HOME/.bashrc" ]; then
    PROFILE_FILE="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    PROFILE_FILE="$HOME/.zshrc"
else
    echo "❌ No bash/zsh profile file found. Please create ~/.bash_profile or ~/.bashrc"
    exit 1
fi

echo "📝 Adding function to $PROFILE_FILE..."

# Create a backup of the profile file
cp "$PROFILE_FILE" "$PROFILE_FILE.backup.$(date +%Y%m%d_%H%M%S)"
echo "💾 Backup created: $PROFILE_FILE.backup.$(date +%Y%m%d_%H%M%S)"

# Check if our function is already sourced
if grep -q "# Data Science Project Initializer" "$PROFILE_FILE"; then
    echo "⚠️  Function already appears to be installed. Updating..."
    # Remove old installation
    sed -i.tmp '/# Data Science Project Initializer/,/# End Data Science Project Initializer/d' "$PROFILE_FILE"
    rm "$PROFILE_FILE.tmp" 2>/dev/null || true
fi

# Add the function to the profile
cat >> "$PROFILE_FILE" << EOF

# Data Science Project Initializer
source "$FUNCTION_FILE"
# End Data Science Project Initializer
EOF

echo "✅ Function installed successfully!"
echo "🔄 Reloading shell configuration..."

# Reload the profile
if [[ "$SHELL" == *"zsh"* ]]; then
    source "$HOME/.zshrc" 2>/dev/null || true
else
    source "$PROFILE_FILE" 2>/dev/null || true
fi

echo "🎉 Setup complete!"
echo ""
echo "Usage: initialize <project_name>"
echo "Example: initialize my_analysis"
echo ""
echo "The function will create a new data science project with the standard folder structure."