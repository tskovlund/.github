# .github

Shared CI workflows, conventions, and community health files for tskovlund
repositories.

## Reusable workflows

### Python CI

Lint, format, type-check, and test a Python project using uv + ruff + pyright +
pytest.

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  check:
    uses: tskovlund/.github/.github/workflows/python-ci.yml@main
```

**Inputs:**

| Input | Default | Description |
|-------|---------|-------------|
| `python-version` | `"3.13"` | Python version |
| `src-dir` | `src/` | Directory for pyright |

### Nix flake check

Run `nix flake check` with caching.

```yaml
name: Check

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

concurrency:
  group: ${{ github.workflow }}-${{ github.event.pull_request.number || github.ref }}
  cancel-in-progress: true

jobs:
  check:
    uses: tskovlund/.github/.github/workflows/nix-check.yml@main
    with:
      platforms: '["ubuntu-latest", "macos-latest"]'
```

**Inputs:**

| Input | Default | Description |
|-------|---------|-------------|
| `platforms` | `'["ubuntu-latest"]'` | JSON array of runner OS values |

### CodeQL

Run CodeQL security analysis.

```yaml
name: CodeQL

on:
  push:
    branches: [main]
  pull_request:
  schedule:
    - cron: "0 6 * * 1"

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  analyze:
    uses: tskovlund/.github/.github/workflows/codeql.yml@main
    with:
      language: python
    permissions:
      security-events: write
```

**Inputs:**

| Input | Required | Description |
|-------|----------|-------------|
| `language` | yes | CodeQL language (`python`, `javascript-typescript`, etc.) |

## Conventions

See [CONVENTIONS.md](CONVENTIONS.md) for shared code standards.
