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

| File                           | Purpose                                                        |
| ------------------------------ | -------------------------------------------------------------- |
| `conventions/general.md`       | General conventions (always included in every repo)            |
| `conventions/elixir.md`        | Elixir-specific conventions                                    |
| `conventions/lean.md`          | Lean 4-specific conventions (language, naming, proof style)    |
| `conventions/python.md`        | Python-specific conventions                                    |
| `conventions/qed.md`           | qed spec framework conventions (spec design, criteria, format) |
| `conventions/typescript.md`    | TypeScript/JavaScript-specific conventions                     |
| `conventions/hooks/commit-msg` | Universal commit-msg hook (synced verbatim)                    |

## How sync works

`.github/workflows/sync-conventions.yml` holds a **hardcoded matrix** mapping
each downstream repo to its language modules. Adding a repo, or changing which
modules it gets, means editing that matrix — there is no marker file in the
downstream repo. The workflow assembles `general.md` + the listed modules and
opens a `chore/sync-conventions` PR on each repo.

The `commit-msg` hook is synced separately by repo-file-sync-action; its repo
list lives in `.github/sync.yml` and must be kept in step with the matrix.

## Editing conventions

Edit the source files in `conventions/`. The root CONVENTIONS.md is assembled
by `scripts/assemble-conventions.sh` (general + all language modules, and new
modules must be added to its list) — never edit it directly.
