#!/bin/bash

set -e

echo "Building all packages..."

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
# Copy generated TypeScript files
cp ../../generated/typescript/*.ts src/
npm install
npm run build
npm pack --pack-destination ../../dist/npm
cd ../..

echo "Building Python package..."
cd packages/python
# Copy generated Python files
mkdir -p src/proto_models
cp ../../generated/python/*.py src/proto_models/
cp ../../generated/python/*.pyi src/proto_models/
python -m build --outdir ../../dist/python
cd ../..

echo "All packages built successfully!"
echo "Packages are available in the dist/ directory"
