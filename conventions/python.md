## Python

- **src layout** — all package code under `src/<package>/`
- **Pyright strict mode** — every signature fully typed. `Any` and
  `dict[str, Any]` only where JSON or another untyped boundary enters, and
  narrowed as soon as the shape is known
- **Ruff** for linting and formatting (line length 88)
- **`__all__` in every module** — the public API is declared, not implied
- **Docstrings on the public surface** say what a value means and which
  constraints hold; a name that already says it needs no docstring
- **Google-style `Args:` and `Raises:` sections** where the parameters or the
  failure modes carry meaning; a generated reference can then read them
