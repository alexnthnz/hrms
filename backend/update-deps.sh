#!/bin/bash

# Update Python dependencies using UV
# This script regenerates the lock file and syncs the environment

set -e

echo "🐍 Updating Python dependencies with UV..."

# Check if UV is installed
if ! command -v uv &> /dev/null; then
    echo "❌ UV is not installed. Please install UV first:"
    echo "   curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

# Update lock file from pyproject.toml
echo "📝 Compiling dependencies from pyproject.toml..."
uv pip compile pyproject.toml -o requirements_lock.txt

# Sync current environment
echo "🔄 Syncing virtual environment..."
uv pip sync requirements_lock.txt

echo "✅ Python dependencies updated successfully!"
echo ""
echo "💡 Next steps:"
echo "   - Review changes: git diff requirements_lock.txt"
echo "   - Test the changes: pytest"
echo "   - Commit: git add requirements_lock.txt && git commit -m 'Update Python dependencies'"
