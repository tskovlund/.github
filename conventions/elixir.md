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
- **No `Process.sleep/1` or `Process.alive?/1` in tests** — they are the
  primary flakiness source. Wait for a process with `Process.monitor/1` +
  `assert_receive {:DOWN, ...}`; synchronize with `_ = :sys.get_state(pid)`;
  start test processes with `start_supervised!/1` so cleanup is guaranteed
- **Ecto discipline** — preload every association a serializer or template
  touches; read changeset fields with `Ecto.Changeset.get_field/2`, never
  map access; programmatically-set fields (e.g. `user_id`) are set
  explicitly, never listed in `cast` (mass-assignment risk); note
  `validate_number/2` has no `:allow_nil` option — validations already skip
  nil changes
