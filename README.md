# homebrew-attest

Homebrew tap for [**attest**](https://github.com/ek33450505/attest) — a local, deterministic,
zero-LLM Claude Code hook that verifies a subagent's `Status: DONE` claim against the real git
working-tree delta.

## Install

```bash
brew tap ek33450505/attest
brew install attest
```

This installs the `attest` CLI. To wire the `SubagentStart` / `SubagentStop` hooks into Claude Code,
use the plugin or `install.sh` from the main repo — see
[attest/docs/INSTALL.md](https://github.com/ek33450505/attest/blob/main/docs/INSTALL.md).

## Notes

- The formula installs the CLI only (`attest --version`, `attest snapshot`, `attest verify`); the
  hooks are wired via the Claude Code plugin or `install.sh`.
- The formula here is the canonical copy of `Formula/attest.rb` from the
  [main repo](https://github.com/ek33450505/attest). Keep them in sync on each release (bump `url`
  to the new tag and update `sha256`).

MIT licensed.
