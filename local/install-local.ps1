# Installe sur TON ordinateur Windows (pas dans le cloud) les outils retenus pour toutes les sessions locales :
#   1. context7   : documentation à jour des bibliothèques, en serveur MCP (portée utilisateur)
#   2. claude-mem : mémoire long terme entre sessions, en mode 100 % local, sans compte ni télémétrie
#
# Prérequis : Claude Code (`claude`) et Node.js 20+ installés.
# Usage, dans PowerShell, depuis le dossier skill-reserve :
#   powershell -ExecutionPolicy Bypass -File .\local\install-local.ps1              (installe les deux)
#   powershell -ExecutionPolicy Bypass -File .\local\install-local.ps1 context7     (un seul)
#   powershell -ExecutionPolicy Bypass -File .\local\install-local.ps1 claude-mem
param([string]$Only = "")

$ErrorActionPreference = "Continue"   # les erreurs des commandes natives sont testées via $LASTEXITCODE
$ClaudeMemVersion = "15.7.0"   # version analysée dans la réserve (skills/claude-mem)

function Want([string]$Name) { return ($Only -eq "") -or ($Only -eq $Name) }
function Need([string]$Cmd) {
  if (-not (Get-Command $Cmd -ErrorAction SilentlyContinue)) {
    Write-Host "Erreur : '$Cmd' introuvable. Installe-le puis relance le script." -ForegroundColor Red
    exit 1
  }
}

Need claude
Need node
Need npx

if (Want "context7") {
  Write-Host "==> context7 (MCP hébergé par Upstash, portée utilisateur)"
  cmd /c "claude mcp get context7 >nul 2>&1"
  if ($LASTEXITCODE -eq 0) {
    Write-Host "    déjà configuré, rien à faire"
  } elseif ($env:CONTEXT7_API_KEY) {
    # Avec clé (context7.com/dashboard) : avant le script, faire  $env:CONTEXT7_API_KEY = "..."
    claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "Authorization: Bearer $($env:CONTEXT7_API_KEY)"
  } else {
    claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp
  }
}

if (Want "claude-mem") {
  Write-Host "==> claude-mem $ClaudeMemVersion (mémoire locale dans $HOME\.claude-mem)"
  # --provider claude : les résumés utilisent ton abonnement Anthropic, sans compte cmem.ai.
  # CLAUDE_MEM_ONLINE_OPTIN=false : pas de connexion au service hébergé, ni d'essai payant.
  $env:CLAUDE_MEM_ONLINE_OPTIN = "false"
  npx -y "claude-mem@$ClaudeMemVersion" install --provider claude
  # La télémétrie anonyme est activée par défaut : on la coupe.
  npx -y "claude-mem@$ClaudeMemVersion" telemetry disable
}

Write-Host ""
Write-Host "Terminé. Redémarre Claude Code pour charger les changements."
Write-Host "Pour désinstaller : 'claude mcp remove --scope user context7' et 'npx claude-mem uninstall'."
