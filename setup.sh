#!/usr/bin/env bash
# The CAM configurer — one command after installing VS Code.
# (Prototype of the ADRs-for-AI installer idea, 2026-09-10.)
set -e
for ext in johnpapa.vscode-peacock jlumbroso.adrs4ai fabiospampinato.vscode-terminals; do
  code --install-extension "$ext" || true
done
echo "✓ extensions in. Now: docs/VSCODE-STUDENT-SETUP.md → paste the settings block."
