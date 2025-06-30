# Proto Models

This repository contains Protocol Buffer definitions for trading and financial data, along with generated packages for C#, Python, and TypeScript.

## 📦 Available Packages

| Language | Package Name | Description |
|----------|--------------|-------------|
| C# | `ProtoModels` | NuGet package for .NET applications |
| TypeScript | `@bookerinvestmentgroup/proto-models-ts` | npm package for TypeScript/JavaScript applications |
| Python | `proto-models-py` | PyPI package for Python applications |

## 🚀 Installation

### C# (.NET)
```bash
dotnet add package ProtoModels
```

### TypeScript/JavaScript
```bash
npm install @bookerinvestmentgroup/proto-models-ts
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

## � Publishing Packages

### First Time Setup

1. **Prepare for publishing**:
   ```bash
   ./prepare-publish.sh
   ```
   This will update package names and author information.

2. **Create accounts and get API keys**:
   - [NuGet.org](https://www.nuget.org/) - Create API key
   - [npmjs.com](https://www.npmjs.com/) - Create account and access token
   - [PyPI.org](https://pypi.org/) - Create account and API token

3. **Add GitHub Secrets** (for automated publishing):
   - `NUGET_API_KEY` - Your NuGet API key
   - `NPM_TOKEN` - Your npm access token
   - `PYPI_API_TOKEN` - Your PyPI API token

### Publishing Workflow

#### Manual Publishing (First Time)
```bash
# Build packages
./build-packages.sh

# Test packages locally
./test-packages.sh

# Publish manually to each registry
# See PUBLISHING.md for detailed commands
```

#### Automated Publishing (Recommended)
```bash
# Update version numbers in package configs
# Commit your changes
git add .
git commit -m "Release v1.0.1"

# Create and push a version tag
git tag v1.0.1
git push origin v1.0.1

# GitHub Actions automatically publishes to all registries
```

📖 **See [PUBLISHING.md](PUBLISHING.md) for detailed publishing instructions**

## �🛠️ Development

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
import { Quote, QuoteData } from '@bookerinvestmentgroup/proto-models-ts';

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