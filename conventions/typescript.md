## TypeScript / JavaScript

- **Strict typescript-eslint** — `tseslint.configs.strict` as baseline
- **No `any`.** `unknown` at boundaries, narrowed with type guards; `as`
  casts only where the type system cannot follow and a comment says why
- **Explicit return types** — `explicit-function-return-type` and
  `explicit-module-boundary-types` on all `.ts` files
- **Naming convention** — enforced via `@typescript-eslint/naming-convention`:
  `camelCase` variables/functions, `PascalCase` types, `UPPER_CASE` constants
- **Import sorting** — `@ianvs/prettier-plugin-sort-imports` in Prettier
- **Prettier** for formatting — with `eslint-config-prettier` to avoid
  conflicts
