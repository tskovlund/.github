## Elixir

- **ExUnit idiom over the generic test template** — `describe` blocks with
  sentence-style `test "..."` names replace `test_action_expected_outcome`
  naming, and Arrange/Act/Assert comments are omitted: well-factored ExUnit
  tests read as specifications. This is the "cased per language convention"
  rule applied to Elixir
- **The full gate is `mix format`, Credo strict, Dialyzer, Sobelow,
  warnings-as-errors, and the test suite** — run via `mix precommit` (or
  `make check`), identically local and in CI
- **`@moduledoc`, `@doc`, and `@spec` on every public module and function**
- **One authorization boundary** — permission and visibility decisions live
  in a single module; no inline permission checks in templates, LiveViews,
  or controllers
- **Contexts own the writes** — the web layer calls context functions; Ecto
  queries do not leak into LiveViews or controllers
- **Property-based tests (StreamData)** for invariants that deserve the
  rigor (permissions, visibility rules)
- **Security scanning is Sobelow + `mix hex.audit` + `mix deps.audit`** in
  CI — CodeQL has no Elixir support
