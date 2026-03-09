## qed Specs

Conventions for repositories using qed as their spec framework.

### Spec design

- **Specs contain top-level results only** — building-block lemmas and helper
  theorems live in proof files but are not spec criteria. A spec criterion
  should be a guarantee a stakeholder cares about, not an intermediate step
- **Use the strongest verification type available** — `proof` for mathematical
  properties, `command` for observable behavior, `agent` for design judgment.
  Don't settle for a test when a proof is possible
- **No overlap between specs** — each criterion appears in exactly one spec.
  One spec owns one concern
- **Every spec must answer: why should I trust this?** — if you can't explain
  what trust a criterion provides, it doesn't belong in the spec

### Spec format

- **`.spec.toml`** for specs with multi-line strings (agent prompts, human
  instructions). TOML's `"""..."""` and comments make these readable
- **`.spec.json`** for simple command-only specs with no multi-line content
- **Schema reference** — every spec file starts with
  `#:schema ../docs/spec.schema.json` (TOML) or `"$schema"` (JSON)

### Proof criteria

- **Target fully qualified theorem names** — e.g.,
  `Qed.Proofs.Termination.loop_terminates`
- **Description states the guarantee, not the implementation** — "The loop
  always reaches a terminal state within maxIterations transitions" not
  "loop_terminates theorem passes"
- **Group by property type** — safety (bad things don't happen), liveness
  (good things eventually happen), correctness (the right things happen)

### Agent criteria

- **Prompts are review checklists** — numbered items, each independently
  verifiable
- **Reference specific files** — "Review Qed/StateMachine.lean" not "Review
  the state machine code"
- **Ask for negative findings** — "Report any unreachable code paths, missing
  error handling, or UX issues"
