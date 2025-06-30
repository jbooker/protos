# Package Publishing Guide

This guide explains how to publish your protobuf packages to their respective registries.

## 🏗️ **Setup Requirements**

### 1. NuGet (C#)

**Create Account:**
1. Go to [nuget.org](https://www.nuget.org/)
2. Sign in with Microsoft account
3. Go to Account Settings → API Keys
4. Create a new API key with "Push new packages and package versions" scope

**Local Setup:**
```bash
# Test your package locally first
dotnet add package ProtoModels --source /path/to/your/dist/nuget

# Publish to NuGet
dotnet nuget push dist/nuget/ProtoModels.1.0.0.nupkg --api-key YOUR_API_KEY --source https://api.nuget.org/v3/index.json
```

### 2. npm (TypeScript/JavaScript)

**Create Account:**
1. Go to [npmjs.com](https://www.npmjs.com/)
2. Create an account
3. Run `npm login` in terminal to authenticate

**Local Setup:**
```bash
# Test your package locally
cd packages/typescript
npm link
# In another project: npm link @bookerinvestmentgroup/proto-models-ts

# Publish to npm
npm publish dist/bookerinvestmentgroup-proto-models-ts-1.0.0.tgz
# Or from package directory: npm publish
```

**Important:** Package is already configured for `@bookerinvestmentgroup/proto-models-ts`

### 3. PyPI (Python)

**Create Account:**
1. Go to [pypi.org](https://pypi.org/)
2. Create an account
3. Go to Account Settings → API tokens
4. Create a new API token with "Entire account" scope

**Local Setup:**
```bash
# Install twine if you haven't
pip install twine

# Test your package locally
pip install dist/python/proto_models_py-1.0.0-py3-none-any.whl

# Upload to PyPI
twine upload dist/python/*
# You'll be prompted for username (__token__) and password (your API token)
```

## 🤖 **Automated Publishing with GitHub Actions**

Your repository already has GitHub Actions configured! You just need to add these secrets:

### GitHub Repository Secrets

Go to your GitHub repo → Settings → Secrets and variables → Actions

Add these secrets:

1. **`NUGET_API_KEY`** - Your NuGet API key
2. **`NPM_TOKEN`** - Your npm access token (get from npmjs.com → Access Tokens)
3. **`PYPI_API_TOKEN`** - Your PyPI API token

### How Automated Publishing Works

1. **Push code changes** → Packages get built and tested
2. **Create and push a git tag** → Packages get published automatically

```bash
# When ready to publish version 1.0.1:
git tag v1.0.1
git push origin v1.0.1
```

This triggers the GitHub Action to:
- Generate protobuf files
- Build all packages  
- Publish to NuGet, npm, and PyPI automatically

## 📋 **Before First Publish Checklist**

### Update Package Names
- [ ] Replace `@yourorg` with your actual npm organization/username
- [ ] Update author information in all package configs
- [ ] Update repository URLs to point to your actual GitHub repo

### Test Locally
- [ ] Test C# package: `dotnet add package` from local path
- [ ] Test npm package: `npm install` from local .tgz file  
- [ ] Test Python package: `pip install` from local .whl file

### Version Management
- [ ] Update version numbers in all package configs when releasing
- [ ] Use semantic versioning (1.0.0, 1.0.1, 1.1.0, etc.)

## 🔄 **Publishing Workflow**

### Manual Publishing (First Time)
```bash
# Build packages
./build-packages.sh

# Publish C#
dotnet nuget push dist/nuget/ProtoModels.1.0.0.nupkg --api-key YOUR_KEY --source https://api.nuget.org/v3/index.json

# Publish npm  
cd packages/typescript && npm publish

# Publish Python
twine upload dist/python/*
```

### Automated Publishing (Ongoing)
```bash
# Update version numbers in package configs
# Commit changes
git add .
git commit -m "Release v1.0.1"

# Create and push tag
git tag v1.0.1
git push origin v1.0.1

# GitHub Actions automatically publishes all packages
```

## 🎯 **Package Discovery**

Once published, developers can find your packages:

- **NuGet**: Visual Studio Package Manager, `dotnet add package ProtoModels`
- **npm**: `npm search proto-models`, `npm install @yourorg/proto-models-ts`  
- **PyPI**: `pip search proto-models`, `pip install proto-models-py`

## 🔒 **Security Best Practices**

- ✅ Never commit API keys to your repository
- ✅ Use GitHub Secrets for sensitive tokens
- ✅ Regularly rotate your API keys
- ✅ Use scoped tokens with minimal required permissions
- ✅ Enable 2FA on all package registry accounts
