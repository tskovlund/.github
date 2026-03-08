## Lean 4

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
