# Contributing

Thanks for improving this D debugging starter.

## Goal

Keep this repository minimal, beginner-friendly, and focused on build/debug workflow in VS Code.

## Local checks before opening a PR

1. Build: `dub build`
2. Run: `dub run`
3. Debug sanity:
   - `F5` runs regular debug (`Debug D project`)
   - `Alt+F5` behavior is documented for user-level keybindings in README.

## Scope guidelines

- Prefer small, focused changes.
- Keep sample code simple for new users.
- Update `README.md` whenever behavior or instructions change.
- Avoid adding extra tooling unless it clearly improves onboarding.

## VS Code config expectations

Project-level settings should remain in `.vscode/` files.

Note: keyboard shortcuts are user-level in VS Code, so custom bindings like `Alt+F5` must be documented, not forced globally from the repository.
