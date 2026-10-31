#!/usr/bin/env bash
# Installe sur TON ordinateur (pas dans le cloud) les outils retenus pour toutes les sessions locales :
#   1. context7   : documentation à jour des bibliothèques, en serveur MCP (portée utilisateur)
#   2. claude-mem : mémoire long terme entre sessions, en mode 100 % local, sans compte ni télémétrie
#
# Prérequis : macOS ou Linux, Claude Code (`claude`) et Node.js 20+ dans le PATH.
# Usage :     bash local/install-local.sh            (installe les deux)
#             bash local/install-local.sh context7   (un seul)
#             bash local/install-local.sh claude-mem
set -euo pipefail

CLAUDE_MEM_VERSION="15.7.0"   # version analysée dans la réserve (skills/claude-mem)

want() { [ $# -eq 0 ] || [ "$1" = "$2" ]; }
need() { command -v "$1" >/dev/null 2>&1 || { echo "Erreur : '$1' introuvable dans le PATH." >&2; exit 1; }; }

need claude
need node
need npx

if want "${1:-}" context7; then
  echo "==> context7 (MCP hébergé par Upstash, portée utilisateur)"
  if claude mcp get context7 >/dev/null 2>&1; then
    echo "    déjà configuré, rien à faire"
  else
    # Sans clé : quota gratuit limité. Avec clé (context7.com/dashboard), relancer avec CONTEXT7_API_KEY=... :
    if [ -n "${CONTEXT7_API_KEY:-}" ]; then
      claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp \
        --header "Authorization: Bearer ${CONTEXT7_API_KEY}"
    else
      claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp
    fi
  fi
fi

if want "${1:-}" claude-mem; then
  echo "==> claude-mem ${CLAUDE_MEM_VERSION} (mémoire locale dans ~/.claude-mem)"
  # --provider claude : les résumés utilisent ton abonnement Anthropic, sans compte cmem.ai.
  # CLAUDE_MEM_ONLINE_OPTIN=false : pas de connexion au service hébergé, ni d'essai payant.
  CLAUDE_MEM_ONLINE_OPTIN=false npx -y "claude-mem@${CLAUDE_MEM_VERSION}" install --provider claude
  # La télémétrie anonyme est activée par défaut : on la coupe.
  npx -y "claude-mem@${CLAUDE_MEM_VERSION}" telemetry disable
fi

echo
echo "Terminé. Redémarre Claude Code pour charger les changements."
echo "Pour désinstaller : 'claude mcp remove --scope user context7' et 'npx claude-mem uninstall'."
