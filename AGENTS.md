# .github

Shared CI workflows, conventions, and community health files for tskovlund
repositories.

Follow the code standards in [CONVENTIONS.md](CONVENTIONS.md).

## What this repo provides

1. **Reusable workflows** (`.github/workflows/`) — Python CI, Nix flake check,
   CodeQL. Referenced by other repos via `uses: tskovlund/.github/.github/workflows/<name>@main`
2. **CONVENTIONS.md** — assembled conventions for GitHub org display
3. **conventions/** — modular convention files for per-repo sync
4. **profile/README.md** — GitHub profile page

## conventions/ directory

Canonical convention modules, synced to downstream repos by repo-file-sync-action.

| File | Purpose |
|------|---------|
| `conventions/general.md` | General conventions (always included in every repo) |
| `conventions/lean.md` | Lean 4-specific conventions (language, naming, proof style) |
| `conventions/python.md` | Python-specific conventions |
| `conventions/qed.md` | qed spec framework conventions (spec design, criteria, format) |
| `conventions/typescript.md` | TypeScript/JavaScript-specific conventions |
| `conventions/hooks/commit-msg` | Universal commit-msg hook (synced verbatim) |

**How sync works:** Downstream repos declare their language(s) in a
`.conventions` marker file (e.g. `typescript`). The sync workflow assembles
`general.md` + the matching language module(s) into each repo's CONVENTIONS.md.
The `commit-msg` hook is synced to `.githooks/commit-msg` in every repo.

## Editing conventions

CONVENTIONS.md in the repo root is the fully assembled version (general +
all language modules) for GitHub org display. Do not edit it directly.

To change conventions, edit the source files in `conventions/`. The root
CONVENTIONS.md and all downstream repos will be updated by the sync workflow.
