#!/bin/bash

echo "🧪 Testing packages locally..."
echo ""

# Create a temporary test directory
TEST_DIR="/tmp/proto-package-test"
rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR"

cd "$TEST_DIR"

echo "📦 Testing C# package..."
# Create a simple C# console app to test the package
mkdir csharp-test && cd csharp-test
dotnet new console -n TestApp
cd TestApp

# Add the local package
dotnet add package ProtoModels --source "$(dirname "$0")/../../dist/nuget"

# Create a simple test file
cat > Program.cs << 'EOF'
using System;

class Program
{
    static void Main()
    {
        var quote = new Quote
        {
            Symbol = "AAPL",
            Quote = new QuoteData
            {
                Price = 150.25,
                Volume = 1000000
            }
        };
        
        Console.WriteLine($"Quote for {quote.Symbol}: ${quote.Quote.Price}");
        Console.WriteLine("✅ C# package works!");
    }
}
EOF

# Try to build
if dotnet build; then
    echo "✅ C# package test passed"
else
    echo "❌ C# package test failed"
fi

cd "$TEST_DIR"

echo ""
echo "📦 Testing TypeScript package..."
mkdir typescript-test && cd typescript-test
npm init -y

# Install the local package
PACKAGE_PATH="$(dirname "$0")/../../dist/npm/bookerinvestmentgroup-proto-models-ts-1.0.0.tgz"
if [ -f "$PACKAGE_PATH" ]; then
    npm install "$PACKAGE_PATH"
    
    # Create a simple test file
    cat > test.js << 'EOF'
const { Quote, QuoteData } = require('@bookerinvestmentgroup/proto-models-ts');

const quote = new Quote({
    symbol: "AAPL",
    quote: new QuoteData({
        price: 150.25,
        volume: 1000000
    })
});

console.log(`Quote for ${quote.getSymbol()}: $${quote.getQuote().getPrice()}`);
console.log("✅ TypeScript package works!");
EOF

    if node test.js; then
        echo "✅ TypeScript package test passed"
    else
        echo "❌ TypeScript package test failed"
    fi
else
    echo "❌ TypeScript package file not found"
fi

cd "$TEST_DIR"

echo ""
echo "📦 Testing Python package..."
# Create a virtual environment for testing
python3 -m venv python-test
source python-test/bin/activate

# Install the local package
WHEEL_PATH="$(dirname "$0")/../../dist/python/proto_models_py-1.0.0-py3-none-any.whl"
if [ -f "$WHEEL_PATH" ]; then
    pip install "$WHEEL_PATH"
    
    # Create a simple test file
    cat > test.py << 'EOF'
from proto_models import quote_pb2

quote = quote_pb2.Quote()
quote.symbol = "AAPL"
quote.quote.price = 150.25
quote.quote.volume = 1000000

print(f"Quote for {quote.symbol}: ${quote.quote.price}")
print("✅ Python package works!")
EOF

    if python test.py; then
        echo "✅ Python package test passed"
    else
        echo "❌ Python package test failed"
    fi
else
    echo "❌ Python package file not found"
fi

deactivate

echo ""
echo "🧹 Cleaning up test directory..."
rm -rf "$TEST_DIR"

echo ""
echo "✅ Local package testing complete!"
echo "If all tests passed, your packages are ready for publishing!"
