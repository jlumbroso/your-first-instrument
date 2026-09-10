# ADR-0004: Every project gets its own room — virtual environments, and why uv

- Status: Accepted · 2026-09-10

**The lesson CS keeps re-learning**: When every program shares one pile of
dependencies, upgrading anything breaks something else. This has a name and
a history — https://en.wikipedia.org/wiki/DLL_Hell — and Python relearned
it hard enough that modern systems (macOS + Homebrew included) now REFUSE
bare `pip install` outside a project environment (PEP 668). The cure is the
**virtual environment**: each project carries its own private dependencies,
sealed from every other project's. Same principle as this course's editor
lesson — things that aren't yours crowd you; give each project its own room.

**Options**: (A) raw `python -m venv` + activate + pip (maximum ceremony,
maximum breakage in a classroom) · (B) pipenv (fine, aging, slower) ·
(C) **uv** — one fast binary that reads `pyproject.toml`, builds the venv
invisibly, and even installs Python if the machine lacks it.

**Decision: C.** `uv run server.py` is the entire incantation: environment
created, dependencies resolved, server running — no activation to forget,
nothing global touched. If wrong: uv vanishes someday → the pyproject.toml
is standard; any tool (B or A) reads it unchanged.
