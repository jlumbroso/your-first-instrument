# TROUBLESHOOTING — harvested from the room (Session 3, 2026-09-10)

*Every fix below was found live, by us, in class — from your error photos,
emails, and the night's debugging. This course was pitched as information
sharing and gathering; this file is the gathering. Add what you find:
PRs welcome (it's your instrument now).*

**The meta-fix first**: the fastest path through almost every error below was
discovered by a student who simply pasted the exact error into a `claude`
conversation and talked it through. The collaborator debugs its own harness
remarkably well. Try that before anything else.

## `claude`: command not found (after installing)

The installer put it in `~/.local/bin`, which your shell may not search yet.
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
claude --version
```
(Same medicine works when `uv` is "not found" after ITS install. Solved
in-room by asking Claude — see the meta-fix.)

## `claude` login: which of the three options?

**"Claude account with subscription"** — then sign in with your course
workspace (Team) account in the browser window that opens. NOT "Anthropic
Console account" (that's API billing), not 3rd-party.

## API Error: 401 · OAuth access token is invalid

Seen especially on Windows (`claude.exe`). Your login expired or landed on
the wrong account. In the claude session, run `/login` and re-authenticate
with the workspace account. If it persists: `/status` shows which account
you're actually on.

## `ModuleNotFoundError: No module named 'mcp.server.fastmcp'` — "This is mcp 2.x"

You instantiated the template in the ~90 minutes before we pinned the SDK
(the 2.x release renamed FastMCP mid-class — a student's clean environment
caught it). One command fixes your copy permanently:
```bash
uv add "mcp[cli]>=1.2,<2"
```

## GitHub: "too many requests"

The classroom's shared IP tripped GitHub's anonymous rate limit. Fix: be
authenticated — sign into github.com in the browser, and for terminal
clones use `gh auth login` (or wait ~15 minutes; it clears).

## Windows generally

Do everything inside **WSL** (install guide was in the pre-class email:
learn.microsoft.com/windows/wsl/install). The native `claude.exe` works for
chat but the course flow (uv, cloudflared, paths) assumes WSL. And per the
room's buddy protocol: pair with a neighbor on macOS when it fights you.

## Claude Desktop: config edited but tools don't appear

Two culprits seen in-room: (1) **mangled JSON** — a missing brace silently
breaks the whole file; paste it into `claude` and ask for a repair, or
validate at jsonlint.com; (2) **the app only reads the config at launch** —
fully quit (⌘Q) and reopen, don't just close the window. The working shape:
```json
{ "mcpServers": { "first-instrument": {
    "command": "npx", "args": ["-y", "mcp-remote", "http://localhost:8000/mcp"]
} } }
```

## Tunnel/connector gotchas

- The connector URL needs the **`/mcp` suffix** — the bare tunnel URL 404s.
- A trycloudflare URL **dies when its terminal closes** — new terminal, new
  URL, update the connector (or deploy to Render for permanence: README).
- Claude **Team web** cannot add custom connectors (Anthropic policy) — use
  the Desktop app (no tunnel needed for localhost) or a personal account.

## It worked and then stopped

Is `uv run server.py` still running in its terminal? The server dies with
its window. One terminal for the server, one for the tunnel, one for you.

---
*Proof it all works: by end of session, instruments were answering through
tunnels, through the Desktop app, and through personal-account connectors —
including one delivering Twilight quotes. Working beats impressive; both
happened.*
