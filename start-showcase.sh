#!/bin/bash

# Amazon Connect Chat Interface - Local Component Showcase Launcher
# This script automates the setup and launch of the local component showcase

echo "🗨️  Amazon Connect Chat Interface - Local Setup"
echo "=============================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 15.0.0 or higher."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node --version | cut -d'v' -f2)
REQUIRED_VERSION="15.0.0"

if ! node -e "process.exit(require('semver').gte('$NODE_VERSION', '$REQUIRED_VERSION') ? 0 : 1)" 2>/dev/null; then
    echo "⚠️  Node.js version $NODE_VERSION detected. Version $REQUIRED_VERSION or higher is recommended."
    echo "   Current version should work, but consider upgrading if you encounter issues."
fi

echo "✅ Node.js version: v$NODE_VERSION"
echo ""

# Check if dependencies are installed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install dependencies"
        exit 1
    fi
    echo "✅ Dependencies installed successfully"
    echo ""
fi

# Check if the built file exists, if not build it
if [ ! -f "local-testing/amazon-connect-chat-interface.js" ]; then
    echo "🔨 Building chat interface..."
    npm run dev-build
    if [ $? -ne 0 ]; then
        echo "❌ Failed to build chat interface"
        exit 1
    fi
    echo "✅ Chat interface built successfully"
    echo ""
fi

# Check if http-server is installed
if ! command -v http-server &> /dev/null; then
    echo "🌐 Installing http-server..."
    npm install -g http-server
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install http-server"
        echo "   You can install it manually with: npm install -g http-server"
        exit 1
    fi
    echo "✅ http-server installed successfully"
    echo ""
fi

echo "🚀 Starting local server..."
echo ""
echo "📍 The component showcase will be available at:"
echo "   http://localhost:8080/component-showcase.html"
echo ""
echo "📍 Original example (requires backend) available at:"
echo "   http://localhost:8080/index.html"
echo ""
echo "💡 Press Ctrl+C to stop the server"
echo ""

# Change to local-testing directory and start server
cd local-testing

# Try to open the browser (works on most systems)
if command -v open &> /dev/null; then
    # macOS
    open http://localhost:8080/component-showcase.html
elif command -v xdg-open &> /dev/null; then
    # Linux
    xdg-open http://localhost:8080/component-showcase.html
elif command -v start &> /dev/null; then
    # Windows
    start http://localhost:8080/component-showcase.html
fi

# Start the HTTP server
http-server -p 8080