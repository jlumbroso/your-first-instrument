# ADR-0002: Python + the official MCP SDK (FastMCP)

- Status: Accepted · 2026-09-10

**Options considered**: (A) Python + official `mcp` SDK · (B) TypeScript SDK
· (C) raw JSON-RPC by hand (no dependency).

**Decision: A.** Rationale: the class's shared floor is Python; the official
SDK reduces a working server to a decorated function per tool, which keeps
the session about the IDEA (handing a model an instrument) rather than
protocol plumbing; and one dependency is an acceptable cost for that. (C) is
the most instructive and the worst first experience — save it for anyone
curious about what the SDK hides. If wrong: a polyglot cohort wants (B) —
the concepts transfer one-to-one.
