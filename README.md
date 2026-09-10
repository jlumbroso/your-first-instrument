# your-first-instrument — the CAM MCP starter

*A rig for your experiments, not a finished thing. Cloned in Session 3 of
Computationally Assisted Metacognition (CIS 7000, Penn, Fall 2026).*

The premise, in one breath: **an AI model only knows what is in its context
window — and an MCP server is how you hand it an instrument** so it can reach
what it lacks (a clock, a dataset, your notes, a museum's collection).
Building one is not hard. That is the whole lesson. By the end of the hour
yours will be running, connected to Claude, and answering questions the bare
model cannot.

## What's in the rig

- `server.py` — a small, working MCP server (a sense of time, ~40 lines).
  Two tools work; the third is a stub with your name on it.
- `docs/adr/` — **the choices live here, not in the code.** Every decision
  this repo made for you is written down with its reasons, so you inherit
  understanding, not just files. Disagree with one? Write the next ADR.
- `docs/TRACKS.md` — three feasible directions, sized for one session.
- `.vscode/` — the environment configures itself (extensions, project color).
- `render.yaml` — one-click deploy to Render's free tier, so your instrument
  gets a URL anyone's Claude can connect to.

## What you might need to install (once per machine)

macOS ships less than you'd think. In Terminal, in order (skip what you have):

```bash
# 1. Homebrew — the missing package manager for macOS (from brew.sh):
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 2. uv — the Python project runner (installs Python itself if needed):
brew install uv
# 3. git — Apple installs it on first use; this just triggers that:
git --version
```

Windows: Do all of this inside WSL (see the course setup guide); the same
commands work there with `apt`-flavored Homebrew or the uv curl installer.

## Run it (2 minutes)

```bash
uv run server.py     # THAT'S IT — environment built, deps resolved, server up (port 8000)
```

Why not `pip install`? Your machine will refuse, and it's right to — see
`docs/adr/0004-virtual-environments-and-uv.md`: every project gets its own room.

Then in Claude: Settings → Connectors → Add custom connector →
`http://localhost:8000/mcp` — and ask: *"What time is it? How long have we
been talking?"* The model still has no clock; it learned to consult one. Yours.

## License

MPL-2.0 with a Template Output Grant — the template stays open with attribution; what YOU build from it may be Apache-2.0 (open, attributed) or fully closed. See LICENSE + TEMPLATE-GRANT.md.
