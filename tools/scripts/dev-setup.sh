#!/bin/bash

# HRMS Development Setup Script

set -e

echo "🚀 Setting up HRMS development environment..."

# Check if Bazel is installed
if ! command -v bazel &> /dev/null; then
    echo "❌ Bazel is not installed. Please install Bazel first:"
    echo "   macOS: brew install bazel"
    echo "   Ubuntu: apt install bazel"
    echo "   Or visit: https://bazel.build/install"
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first:"
    echo "   macOS: brew install node"
    echo "   Ubuntu: apt install nodejs npm"
    echo "   Or visit: https://nodejs.org/"
    exit 1
fi

# Check if Go 1.21+ is installed
if ! go version | grep -q "go1.2[1-9]"; then
    echo "❌ Go 1.21+ is required. Please install Go 1.21+ first:"
    echo "   macOS: brew install go"
    echo "   Ubuntu: apt install golang-go"
    echo "   Or visit: https://golang.org/dl/"
    exit 1
fi

# Check if Python 3.11+ is installed (for AI domain)
if ! python3 -c "import sys; assert sys.version_info >= (3, 11)" 2>/dev/null; then
    echo "❌ Python 3.11+ is required for AI services. Please install Python 3.11+ first:"
    echo "   macOS: brew install python@3.11"
    echo "   Ubuntu: apt install python3.11"
    exit 1
fi

# Check if uv is installed
if ! command -v uv &> /dev/null; then
    echo "❌ UV is not installed. Installing UV for fast Python package management..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    source $HOME/.cargo/env
fi

echo "✅ Prerequisites check passed"

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd frontend && npm install && cd ..

# Setup Python dependencies for AI and future Python domains using UV
echo "🐍 Setting up Python dependencies with UV (fast!)..."
cd backend && uv pip sync requirements_lock.txt && cd ..

echo "🏗️  Building all targets..."
bazel build //...

echo "🧪 Running tests..."
bazel test //...

echo "✅ Development environment setup complete!"
echo ""
echo "🎯 Quick commands:"
echo "   Start development:     bazel run //frontend/web-app:dev_server"
echo "   Build all:             bazel build //..."
echo "   Run tests:             bazel test //..."
echo "   Build Go domains:      bazel build //backend/domains/people:all"
echo "   Build Python domains:  bazel build //backend/domains/ai:all"
echo "   Update Go deps:        bazel run //:gazelle-update-repos"
echo "   Shared Python deps:    backend/pyproject.toml"
echo "   Update Python deps:    cd backend && uv pip compile pyproject.toml -o requirements_lock.txt"
echo ""
echo "📚 More info: see README.md"
