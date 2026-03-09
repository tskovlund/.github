## Lean 4

### Language

- **`autoImplicit` off** — all variables explicitly declared. Prevents
  accidental implicit arguments in theorem statements
- **Pure core, IO shell** — state machine transition functions are pure and
  total. IO lives at the edges (CLI, process spawning, file I/O)
- **No `sorry` in proofs** — `sorry` is an axiom that admits any proposition.
  CI rejects any `sorry` in proof files. Use `sorry` only during development,
  never in merged code
- **Proofs alongside code** — theorems about a module live in the same file or
  a `Proofs/` subdirectory. Keep proofs close to the definitions they reason
  about
- **`lake-manifest.json` committed** — this is the lockfile for Lake
  dependencies. Always commit it
- **No `partial` when avoidable** — `partial` functions are opaque to the
  kernel and cannot be unfolded in proofs. Use mutual recursion for termination
  through nested inductives (e.g., `List` inside an inductive type)

### Naming

- **Full variable names in signatures** — `config` not `cfg`, `context` not
  `ctx`, `iteration` not `iter`. Hypothesis bindings may be shorter when scope
  is narrow
- **`h` prefix for hypotheses** — with descriptors: `hterm` (terminality),
  `hbound` (bound), `hiter` (iteration). Plain `h` only when there is exactly
  one hypothesis in scope
- **snake_case for theorems** — descriptive: `terminal_absorbing`,
  `stuck_iff_threshold`, `loop_terminates`
- **Proof file names match module** — `FinalStates.lean` for proofs about
  final states, `Termination.lean` for termination proofs

### Proof style

- **`unfold` over `simp only [f]`** for unfolding definitions — `unfold` is
  explicit about intent and doesn't reduce further. Use `simp` for rewriting,
  not unfolding
- **Structured proofs** — prefer `cases ... with | constructor => ...` over
  tactic chains. Each case should be readable independently
- **Extract lemmas when reused** — if two theorems need the same intermediate
  result, extract it. Inline when used once
- **Mutual recursion for nested inductives** — when a type contains `List T`
  where `T` is the type itself, define functions as a mutual block
  (`toJson`/`toJsonList`) so Lean can verify structural termination
