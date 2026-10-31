# Installe sur TON ordinateur Windows les « 5 skills qui rendent Claude autonome » (guide 0xloucash) :
#   1. find-skills    (vercel-labs/skills)                    : trouve et installe d'autres skills
#   2. superpowers    (obra/superpowers)                      : planifier puis vérifier avant de livrer
#   3. claude-mem     (thedotmack/claude-mem)                 : mémoire entre les sessions (mode local, sans compte)
#   4. impeccable     (pbakaus/impeccable)                    : goût design pour les interfaces
#   5. task-observer  (rebelytics/one-skill-to-rule-them-all) : observe tes corrections et améliore tes skills
#
# Tout est installé pour ton utilisateur (dans tous tes projets). Versions = celles analysées dans la réserve.
# Prérequis : Claude Code (`claude`), Node.js 20+ et Git.
# Usage, dans PowerShell, depuis le dossier skill-reserve :
#   powershell -ExecutionPolicy Bypass -File .\local\install-5-skills.ps1
#   powershell -ExecutionPolicy Bypass -File .\local\install-5-skills.ps1 superpowers   (un seul)
param([string]$Only = "")

$ErrorActionPreference = "Continue"   # les erreurs des commandes natives sont testées via $LASTEXITCODE
$SkillsCliVersion  = "1.7.4"
$ImpeccableVersion = "4.8.0"

# Coupe la télémétrie du CLI skills (activée par défaut).
$env:DO_NOT_TRACK = "1"
$env:DISABLE_TELEMETRY = "1"

function Want([string]$Name) { return ($Only -eq "") -or ($Only -eq $Name) }
function Need([string]$Cmd) {
  if (-not (Get-Command $Cmd -ErrorAction SilentlyContinue)) {
    Write-Host "Erreur : '$Cmd' introuvable. Installe-le puis relance le script." -ForegroundColor Red
    exit 1
  }
}
function Check([string]$Step) {
  if ($LASTEXITCODE -ne 0) {
    Write-Host "Échec à l'étape : $Step (code $LASTEXITCODE)." -ForegroundColor Red
    exit $LASTEXITCODE
  }
}

Need claude
Need node
Need npx
Need git

if (Want "find-skills") {
  Write-Host "==> 1/5 find-skills"
  npx -y "skills@$SkillsCliVersion" add vercel-labs/skills --skill find-skills --global --agent claude-code --yes
  Check "find-skills"
}

if (Want "superpowers") {
  Write-Host "==> 2/5 superpowers (plugin officiel)"
  # La marketplace officielle est normalement déjà connue ; on l'ajoute au cas où, sans échouer si elle existe.
  cmd /c "claude plugin marketplace add anthropics/claude-plugins-official >nul 2>&1"
  claude plugin install superpowers@claude-plugins-official --scope user
  Check "superpowers"
}

if (Want "claude-mem") {
  Write-Host "==> 3/5 claude-mem (local, sans compte, télémétrie coupée)"
  & (Join-Path $PSScriptRoot "install-local.ps1") claude-mem
}

if (Want "impeccable") {
  Write-Host "==> 4/5 impeccable (global, Claude Code)"
  npx -y "impeccable@$ImpeccableVersion" install --providers=claude --scope=global
  Check "impeccable"
}

if (Want "task-observer") {
  Write-Host "==> 5/5 task-observer"
  npx -y "skills@$SkillsCliVersion" add rebelytics/one-skill-to-rule-them-all --global --agent claude-code --yes
  Check "task-observer"
}

Write-Host ""
Write-Host "Terminé. Redémarre Claude Code, puis vérifie avec /plugin (superpowers) et /skills."
Write-Host "Dans chaque projet d'interface, lance une fois : /impeccable init"
Write-Host "En fin de session de travail, demande : « Any observations logged? » (task-observer)"
