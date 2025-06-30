#!/bin/bash

set -e  # Exit on any error

echo "Generating C#, Python, and TypeScript files..."

####
    # Prerequisites:
    # For TypeScript: npm install -g protoc-gen-ts
    # For Python: pip install protobuf grpcio-tools
    # For C#: protobuf compiler with C# support
####

# Set paths - proto files are in current directory
PROTO_PATH=.
CS_DEST_PATH=generated/csharp
TS_DEST_PATH=generated/typescript
PYTHON_DEST_PATH=generated/python

# Create output directories if they don't exist
mkdir -p "${CS_DEST_PATH}"
mkdir -p "${TS_DEST_PATH}"
mkdir -p "${PYTHON_DEST_PATH}"

# Check if protoc is available
if ! command -v protoc &> /dev/null; then
    echo "ERROR: protoc is not installed or not in PATH"
    exit 1
fi

echo "Generating C# files..."
protoc --proto_path="${PROTO_PATH}" --csharp_out="${CS_DEST_PATH}" --csharp_opt=file_extension=.g.cs *.proto
echo "Done generating C# files"

echo "Generating Python files..."
protoc --proto_path="${PROTO_PATH}" --python_out="${PYTHON_DEST_PATH}" --pyi_out="${PYTHON_DEST_PATH}" *.proto
echo "Done generating Python files"

echo "Generating TypeScript files..."
# Check if protoc-gen-ts is available
if ! command -v protoc-gen-ts &> /dev/null; then
    echo "WARNING: protoc-gen-ts is not installed. Skipping TypeScript generation."
    echo "Install with: npm install -g protoc-gen-ts"
else
    # Clean previous TypeScript generation
    rm -rf "${TS_DEST_PATH}"/*
    
    # Include well-known types and don't gen grpc for TS
    # Try different common paths for protobuf includes
    PROTOBUF_INCLUDE=""
    for path in "/opt/homebrew/include" "/usr/local/include" "/usr/include"; do
        if [ -f "$path/google/protobuf/timestamp.proto" ]; then
            PROTOBUF_INCLUDE="--proto_path=$path"
            echo "Using protobuf includes from: $path"
            break
        fi
    done
    
    if [ -n "$PROTOBUF_INCLUDE" ]; then
        protoc --proto_path="${PROTO_PATH}" $PROTOBUF_INCLUDE \
               --ts_out="${TS_DEST_PATH}" --ts_opt=no_grpc \
               *.proto
    else
        echo "WARNING: Could not find Google protobuf includes. Some TypeScript files may have missing dependencies."
        protoc --proto_path="${PROTO_PATH}" --ts_out="${TS_DEST_PATH}" --ts_opt=no_grpc *.proto
    fi
    echo "Done generating TypeScript files..."
fi

echo "All protobuf generation completed successfully!"