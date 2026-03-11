# Contributing to <PROJECT>

Thanks for your interest in contributing! This guide covers everything you need
to get started.

## Prerequisites

<!-- List language runtime, tooling, and any external dependencies -->

## Development setup

```bash
git clone https://github.com/tskovlund/<repo>.git
cd <repo>

# Enter dev environment
# ...
```

## Running checks

<!-- List the check commands (lint, format, typecheck, test) -->

## Code style

Follow the code standards in [CONVENTIONS.md](CONVENTIONS.md).

<!-- Add repo-specific highlights if needed, but don't duplicate CONVENTIONS.md -->

## Tests

```bash
pytest                        # run all tests
pytest tests/test_example.py  # run specific test file
pytest -k "test_pattern"     # run tests matching pattern
```

## PR process

All contributions go through pull requests.

1. Fork or create a feature branch from `main`
2. Make your changes
3. Ensure all checks pass
4. Push and create a pull request
5. CI must pass
6. A maintainer will review your PR — address any feedback
7. The maintainer merges once approved

### Prompt request PRs

We welcome **prompt request PRs** — pull requests that contain a well-described
specification instead of code. These are designed to be implemented by AI agents.

A prompt request PR should include:

- **Clear problem statement** — what should change and why
- **Acceptance criteria** — specific, testable outcomes
- **Constraints** — any boundaries on the solution
- **Examples** — input/output examples or before/after descriptions where helpful

<!-- Add a label name appropriate for your repo, e.g. `prompt-request` -->

Label prompt request PRs with `prompt-request`. A maintainer or AI agent will
pick them up, implement the changes, and push commits to the PR branch. The
normal review process applies after implementation.
