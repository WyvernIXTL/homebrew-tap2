# Development Guide

> [!TIP]
> Most steps are automated via [Task](https://taskfile.dev/).

First off install the tap:

```sh
brew tap wyvernixtl/tap2
```

Then go to the repo:

```sh
cd "$(brew --repo wyvernixtl/tap2)"
```

## Add Formula

Checkout a separate branch named `"<name>-<version>"` and then use the `brew create` command to generate a new formula.

```sh
brew create
```

After running the tests and audits open a pr and if the tests run through label it with `pr-pull`! DO NOT MERGE IT MANUALLY!


## Test a Formula

```sh
FORMULA=flicense task audit
```

By running `task test` the checks in the next section are run.


### Check Version

For checking if the automatic version works:
```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew info flicense
```

### Audit

For new formulas:
```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew audit --new --formula flicense
```

For existing formulas:
```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew audit --strict --online flicense
```

### Install from Source

```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug flicense
```

Or reinstall:
```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew reinstall --build-from-source --verbose --debug flicense
```

### Run Tests

```sh
HOMEBREW_NO_INSTALL_FROM_API=1 brew test flicense
```

## Bump Formula

### Check Versions

```sh
task check
```

```sh
brew bump --tap wyvernixtl/tap2
```

### Open PR

```sh
task bump
```

```sh
brew bump --tap wyvernixtl/tap2 --open-pr
```

### Label the PR!

After the workflows completed sucessfully, label the pr `pr-pull`. Do not close the pr per hand or merge the pr!

