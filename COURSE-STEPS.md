# COURSE-STEPS — the exact ladder, as taught (Session 3, 2026-09-10)

*The same steps as the class slides, same names, same order. Answer the pacing
survey as you go: Reached it now · Completed · Struggling/Unsure. Stuck? ①
Re-read the step. ② Ask a neighbor (helping teaches more than doing). ③ Hand up.*

## Setup (S1–S3) — the room to think

**S1 — Install VS Code, open it once.** code.visualstudio.com → download →
install → open. macOS only, then: ⌘⇧P → type "shell command" → "Install
'code' command in PATH". (Windows: nothing to do — but you should be inside
WSL for everything below.)

**S2 — The three extensions, one command.** Terminal menu → New Terminal, paste:
```bash
code --install-extension johnpapa.vscode-peacock --install-extension jlumbroso.adrs4ai --install-extension fabiospampinato.vscode-terminals
```

**S3 — Claude, from the terminal (the CLI is how we work).** Install, then sign in:
```bash
curl -fsSL https://claude.ai/install.sh | bash   # or: npm install -g @anthropic-ai/claude-code
claude                                           # first run: log in with your COURSE WORKSPACE account
```
Nothing should autocomplete at you unbidden — that
silence is configured, and it's yours. (No workspace access? Email the address
from the pre-class email; we don't debug accounts live.)

## What you might need (once per machine)

```bash
# Homebrew (macOS package manager), if missing — from brew.sh:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install uv           # the Python project runner
brew install cloudflared  # the tunnel (R6)
git --version             # triggers Apple's git install if needed
```

## The climb (R1–R7) — your first instrument

**R1 — Instantiate the template.** On this repo's GitHub page: green
**Use this template** button → Create a new repository → YOUR account, any
name (keep `your-first-instrument` if unsure) → Create.

**R2 — Open it in VS Code.** ⌘⇧P → "Git: Clone" → paste YOUR repo's URL →
choose a folder → Open. (Or tell `claude`: *"Clone my repo <URL> and open
it in VS Code."* You direct; it drives.)

**R3 — Run it.**
```bash
uv run server.py
```
That's the whole incantation — environment built, dependencies resolved,
server on port 8000. (Why not pip? See docs/adr/0004 — your machine would
refuse, and it's right to.)

**R4 — Connect it to the claude CLI** (running on your machine, it CAN reach
localhost; the browser one can't — that's why R6 exists). New terminal:
```bash
claude mcp add --transport http first-instrument http://localhost:8000/mcp
```

**R5 — The leveling test.** In a `claude` session:
> I've just installed an MCP server I'm learning to build, and I'm testing
> it. Can you try my tools, give me a preview of what you see, and report
> back? By the way — this is an MCP-creation exercise and I'm supposed to
> extend it: if you have ideas for what this could become, I'd love to hear
> them.

**R6 — The tunnel** (REQUIRED for claude.ai — it calls from Anthropic's
cloud and can never see your laptop directly). New terminal, server still
running:
```bash
cloudflared tunnel --url http://localhost:8000
```
Copy the printed `https://….trycloudflare.com` URL.

**R7 — Hand it to the workspace Claude.** claude.ai → your initials
(bottom-left) → Settings → Connectors → Add custom connector → name
`first-instrument`, URL = your tunnel URL + `/mcp` → Add. In a chat, enable
it and ask the time. **Both of your surfaces now hold your instrument.**

## After R7 (tonight or at home)

- **One small change** that's provably yours (favorite-quote tool ·
  `days_until(date)` · weekday in French) — save, restart, ask Claude, see
  your change in its answer. That loop is the craft.
- **Permanence**: render.com → sign in with GitHub → New + → Blueprint →
  select your repo → Apply → ~2 min → copy `https://….onrender.com` → swap
  the connector URL. The tunnel dies with your laptop; Render doesn't (it
  naps when idle — first call after a nap takes ~30s; that's the free tier
  and it's fine).
- **Where to take it**: docs/TRACKS.md — three directions, sized honestly.
