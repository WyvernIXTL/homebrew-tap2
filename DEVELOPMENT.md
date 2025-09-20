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

## Bump Formula

### All in One

<https://docs.brew.sh/Manpage#bump-formula-pr-options-formula>

This bumps a formula and creates a PR.

```sh
brew bump-formula-pr flicense --url https://github.com/WyvernIXTL/flicense-rs/ --tag v0.4.0
```
