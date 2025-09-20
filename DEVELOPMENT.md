# Development Guide

First off install the tap:

```sh
brew tap wyvernixtl/tap2
```

Then go to the repo:

```sh
cd "$(brew --repo wyvernixtl/tap2)"
```

## Test a Formula

### Install from Source

```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug flicense
```

### Check Version

For checking if the automatic version works:
```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew info flicense
```

### Audit

For new formulas:
```sh
HOMEBREW_NO_INSTALL_FROM_API=1 audit --new --formula flicense
```

For existing formulas:
```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew audit --new --formula flicense
```

### Run Tests

```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew test flicense
```
