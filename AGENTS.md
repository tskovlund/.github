# .github

Shared CI workflows, conventions, and community health files for tskovlund
repositories.

Follow the code standards in `~/.claude/standards.md`.

## What this repo provides

1. **Reusable workflows** (`.github/workflows/`) — Python CI, Nix flake check,
   CodeQL. Referenced by other repos via `uses: tskovlund/.github/.github/workflows/<name>@main`
2. **CONVENTIONS.md** — de-personalized code standards for contributors
3. **profile/README.md** — GitHub profile page

## Editing conventions

CONVENTIONS.md is a de-personalized copy of the canonical standards manifest at
`nix-config-personal/files/standards.md`. When standards change, update the
canonical source first, then sync CONVENTIONS.md here.

## Git workflow

- **Conventional commits** — `feat:`, `fix:`, `docs:`, `chore:`
- **Direct to main** — this repo is small and changes are low-risk
