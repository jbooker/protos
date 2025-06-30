# Proto Models

This repository contains Protocol Buffer definitions for trading and financial data, along with generated packages for C#, Python, and TypeScript.

## 📦 Available Packages

| Language | Package Name | Description |
|----------|--------------|-------------|
| C# | `ProtoModels` | NuGet package for .NET applications |
| TypeScript | `@yourorg/proto-models-ts` | npm package for TypeScript/JavaScript applications |
| Python | `proto-models-py` | PyPI package for Python applications |

## 🚀 Installation

### C# (.NET)
```bash
dotnet add package ProtoModels
```

### TypeScript/JavaScript
```bash
npm install @yourorg/proto-models-ts
```

### Python
```bash
pip install proto-models-py
```

## 📋 Proto Definitions

This repository includes the following protobuf definitions:

- **`chart.proto`** - Chart and candlestick data models
- **`company_info.proto`** - Company information and key statistics
- **`option_chain.proto`** - Options chain data models
- **`quote.proto`** - Real-time quote data models
- **`wheelstrategy.proto`** - Wheel strategy trading models

## 🛠️ Development

### Prerequisites

- Protocol Buffer compiler (`protoc`)
- For TypeScript: `npm install -g protoc-gen-ts`
- For Python: `pip install protobuf grpcio-tools`
- For C#: .NET SDK with protobuf support

### Generate Protobuf Files

```bash
./GenProtos.sh
```

This will generate files in the `generated/` directory:
- `generated/csharp/` - C# files
- `generated/python/` - Python files  
- `generated/typescript/` - TypeScript files

### Build All Packages

```bash
./build-packages.sh
```

This will:
1. Generate protobuf files
2. Build packages for all languages
3. Output packages to the `dist/` directory

## 🚢 CI/CD

The repository includes GitHub Actions workflows that automatically:

1. **Generate protobuf files** from `.proto` definitions
2. **Build packages** for all languages
3. **Publish packages** to their respective registries when tags are pushed

### Automatic Publishing

To publish new versions:

1. Update version numbers in package configuration files
2. Create and push a git tag:
   ```bash
   git tag v1.0.1
   git push origin v1.0.1
   ```

The packages will be automatically published to:
- NuGet Gallery (C#)
- npm Registry (TypeScript)
- PyPI (Python)

### Required Secrets

Configure these secrets in your GitHub repository:

- `NUGET_API_KEY` - NuGet API key for publishing
- `NPM_TOKEN` - npm access token for publishing
- `PYPI_API_TOKEN` - PyPI API token for publishing

## 📖 Usage Examples

### C#
```csharp
using ProtoModels;

var quote = new Quote
{
    Symbol = "AAPL",
    Quote = new QuoteData
    {
        Price = 150.25,
        Volume = 1000000
    }
};
```

### TypeScript
```typescript
import { Quote, QuoteData } from '@yourorg/proto-models-ts';

const quote = new Quote({
    symbol: "AAPL",
    quote: new QuoteData({
        price: 150.25,
        volume: 1000000
    })
});
```

### Python
```python
from proto_models import quote_pb2

quote = quote_pb2.Quote()
quote.symbol = "AAPL"
quote.quote.price = 150.25
quote.quote.volume = 1000000
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.