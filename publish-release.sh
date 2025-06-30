#!/bin/bash

echo "🏷️  Creating and pushing version tag for publishing..."

# Get the current version from package.json
VERSION=$(grep '"version":' packages/typescript/package.json | sed 's/.*"version": "\(.*\)",/\1/')

echo "Current version: $VERSION"
read -p "Create tag v$VERSION and publish? (y/N): " CONFIRM

if [[ $CONFIRM =~ ^[Yy]$ ]]; then
    echo "Creating tag v$VERSION..."
    git tag v$VERSION
    
    echo "Pushing tag to trigger publishing..."
    git push origin v$VERSION
    
    echo "✅ Tag v$VERSION pushed!"
    echo "🚀 GitHub Actions will now build and publish all packages"
    echo "📋 Monitor progress at: https://github.com/bookerinvestmentgroup/protos/actions"
else
    echo "❌ Publishing cancelled"
fi
