#!/bin/bash

set -e

echo "Building all packages..."

# Create dist directories
mkdir -p dist/nuget
mkdir -p dist/npm  
mkdir -p dist/python

# Generate protobuf files first
./GenProtos.sh

echo "Building C# package..."
cd packages/csharp
dotnet restore
dotnet build --configuration Release
dotnet pack --configuration Release --output ../../dist/nuget
cd ../..

echo "Building TypeScript package..."
cd packages/typescript
# Copy generated TypeScript files including Google protobuf dependencies
cp ../../generated/typescript/*.ts src/
if [ -d "../../generated/typescript/google" ]; then
    cp -r ../../generated/typescript/google src/
fi
npm install
npm run build
# Update the pack destination to use the correct package name
npm pack --pack-destination ../../dist/npm
cd ../..

echo "Building Python package..."
cd packages/python
# Copy generated Python files
mkdir -p src/proto_models
cp ../../generated/python/*.py src/proto_models/
cp ../../generated/python/*.pyi src/proto_models/
python3 -m build --outdir ../../dist/python
cd ../..

echo "All packages built successfully!"
echo "Packages are available in the dist/ directory"
