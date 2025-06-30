#!/bin/bash

echo "🚀 Preparing packages for publishing..."
echo "This script will help you customize package names and details before publishing."
echo ""

# Get user input
read -p "Enter your GitHub username/organization: " GITHUB_USER
read -p "Enter your npm username/organization (or press Enter to use GitHub username): " NPM_USER
NPM_USER=${NPM_USER:-$GITHUB_USER}

read -p "Enter your name for package author: " AUTHOR_NAME
read -p "Enter your email: " AUTHOR_EMAIL

read -p "Enter the package version (default: 1.0.0): " VERSION
VERSION=${VERSION:-1.0.0}

echo ""
echo "📝 Updating package configurations..."

# Update C# package
echo "Updating C# package..."
sed -i '' "s/Your Name/$AUTHOR_NAME/g" packages/csharp/ProtoModels.csproj
sed -i '' "s/Your Company/$AUTHOR_NAME/g" packages/csharp/ProtoModels.csproj
sed -i '' "s/yourusername/$GITHUB_USER/g" packages/csharp/ProtoModels.csproj
sed -i '' "s/<PackageVersion>.*<\/PackageVersion>/<PackageVersion>$VERSION<\/PackageVersion>/g" packages/csharp/ProtoModels.csproj

# Update TypeScript package
echo "Updating TypeScript package..."
sed -i '' "s/@yourorg\/proto-models-ts/@$NPM_USER\/proto-models-ts/g" packages/typescript/package.json
sed -i '' "s/@bookerinvestmentgroup\/proto-models-ts/@$NPM_USER\/proto-models-ts/g" packages/typescript/package.json
sed -i '' "s/\"version\": \".*\"/\"version\": \"$VERSION\"/g" packages/typescript/package.json
sed -i '' "s/\"author\": \".*\"/\"author\": \"$AUTHOR_NAME\"/g" packages/typescript/package.json
sed -i '' "s/yourusername/$GITHUB_USER/g" packages/typescript/package.json

# Update Python package
echo "Updating Python package..."
sed -i '' "s/version = \".*\"/version = \"$VERSION\"/g" packages/python/pyproject.toml
sed -i '' "s/name = \"Your Name\"/name = \"$AUTHOR_NAME\"/g" packages/python/pyproject.toml
sed -i '' "s/email = \"your.email@example.com\"/email = \"$AUTHOR_EMAIL\"/g" packages/python/pyproject.toml
sed -i '' "s/yourusername/$GITHUB_USER/g" packages/python/pyproject.toml

# Update README
echo "Updating main README..."
sed -i '' "s/@yourorg\/proto-models-ts/@$NPM_USER\/proto-models-ts/g" README.md
sed -i '' "s/@bookerinvestmentgroup\/proto-models-ts/@$NPM_USER\/proto-models-ts/g" README.md
sed -i '' "s/yourusername/$GITHUB_USER/g" README.md

echo ""
echo "✅ Package configurations updated!"
echo ""
echo "📋 Next steps:"
echo "1. Review the updated package files"
echo "2. Create accounts on nuget.org, npmjs.com, and pypi.org"
echo "3. Get API keys and add them to GitHub Secrets"
echo "4. Test build: ./build-packages.sh"
echo "5. Publish: git tag v$VERSION && git push origin v$VERSION"
echo ""
echo "📖 See PUBLISHING.md for detailed instructions"
