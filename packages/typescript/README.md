# Proto Models TypeScript

Generated TypeScript protobuf models for trading and financial data.

## Installation

```bash
npm install @bookerinvestmentgroup/proto-models-ts
```

## Usage

```typescript
import { Quote, QuoteData, CompanyInfo } from '@bookerinvestmentgroup/proto-models-ts';

// Create a quote object
const quote = new Quote({
    symbol: "AAPL",
    quote: new QuoteData({
        price: 150.25,
        priceChange: 2.50,
        priceChangePercent: 1.69,
        bid: 150.20,
        ask: 150.30,
        volume: 1000000,
        dayHigh: 152.00,
        dayLow: 148.50,
        yearHigh: 180.00,
        yearLow: 120.00
    })
});

// Serialize to binary
const buffer = quote.serializeBinary();

// Deserialize from binary
const deserializedQuote = Quote.deserializeBinary(buffer);
```

## Available Models

- **`Quote`** and **`QuoteData`** - Real-time quote information
- **`CompanyInfo`**, **`KeyStats`**, **`CompanyInfoRequest`** - Company details and statistics
- **`Chart`** related models - Chart and candlestick data
- **`OptionChain`** related models - Options chain data
- **`WheelStrategy`** related models - Wheel trading strategy data

## TypeScript Support

This package includes full TypeScript type definitions, providing excellent IntelliSense and compile-time type checking.

## Dependencies

- `google-protobuf` - Google's Protocol Buffer runtime for JavaScript

## Building from Source

1. Generate protobuf files: `../../GenProtos.sh`
2. Copy generated files: `npm run copy-protos`  
3. Build the package: `npm run build`
4. Create package: `npm pack`
