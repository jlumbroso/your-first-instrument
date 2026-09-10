# ADR-0003: Deploy on Render's free tier

- Status: Accepted · 2026-09-10

**Decision**: `render.yaml` targets Render, free plan, via Blueprint deploy.

**Rationale**: Zero cost, no credit card, git-push deploys, and a real HTTPS
URL any Claude can connect to — which converts "my toy on localhost" into
"my instrument, live," and that conversion is the session's emotional
payload. Precedent: the Whitney-collection MCP runs the same way.

**The honest cost (know it, don't fear it)**: free instances sleep when
idle; the first call after a nap takes ~30s. For an instrument consulted
occasionally, fine. If wrong: an always-hot need appears → the $7 plan or
any other host; nothing in the code is Render-specific.
