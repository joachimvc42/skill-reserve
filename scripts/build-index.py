"""Régénère INDEX.md à partir des SKILL.md de skills/.

Usage : python3 -I scripts/build-index.py .
Ajouter chaque nouveau dossier de skills/ à la liste `for pack in [...]`.
"""
import sys, pathlib, re
root = pathlib.Path(sys.argv[1])
SKIP = ("/.raw/", "/website/public/gallery/", "-directory/", "/.grok/", "/.kimi/", "/.qwen/", "/.opencode/", "/.antigravitycli/", "/career-ops/.agents/", "/context7/packages/", "/context7/plugins/codex/", "/context7/plugins/copilot/", "/context7/plugins/cursor/", "/context7/plugins/antigravity/", "/context7/plugins/agent-plugins/", "/skills-cli/.automations/", "/claude-skills-alirezarezvani/scripts/evals/", "/claude-cost-optimizer/plugins/")
def desc(f):
    t = f.read_text(errors="ignore")
    m = re.search(r"^description:\s*(.+?)(?=^\w[\w-]*:|^---)", t, re.S|re.M)
    d = " ".join(m.group(1).split()).strip("\"'>|- ") if m else ""
    if not d:
        lines = [l.strip() for l in t.splitlines() if l.strip() and not l.startswith(("#", "---"))]
        h = next((l.lstrip("# ") for l in t.splitlines() if l.startswith("#")), "")
        d = (h + " — " if h else "") + (lines[0] if lines else "")
    d = d.replace("|", "/")
    return d[:217] + "…" if len(d) > 220 else d
api = root/"references/public-apis/README.md"
napi = sum(1 for l in api.read_text().splitlines() if l.startswith("| ["))
out = ["# Index de la réserve", "",
"Tout ce qui est ici est **non installé**. Voir `README.md` pour la procédure d'installation.", "",
"## Références (non installables)", "",
"| Chemin | Contenu |", "|---|---|",
f"| `references/public-apis/README.md` | {napi} API publiques gratuites classées par catégorie (nom, description, auth, HTTPS, CORS). Source : github.com/public-apis/public-apis |",
"| `references/r3f/` | 6 projets de démo React Three Fiber / Three.js (jeux 3D, portfolios 3D, salle 3D, showroom auto) avec modèles glTF. Source : github.com/AliKhan-Devs/R3F |",
"| `references/ecc-extras/agents/` | Définitions de sous-agents ECC (reviewers par langage, build resolvers, planner…), installables dans `.claude/agents/` |",
"| `references/ecc-extras/commands/` | Slash commands ECC, installables dans `.claude/commands/` |",
"| `references/ecc-extras/rules/` | Règles de codage ECC par langage |",
"| `references/sites.md` | Sites web mis de côté (génération vidéo, multi-LLM, modèles de code, OSINT…) avec description et mises en garde |", ""]
for pack in ["humanizer", "tutor-skills", "youtube-skills", "platform-design", "superpowers", "aegis", "firecrawl", "firecrawl-claude-plugin", "remotion", "agent-browser", "claude-blog", "founder-skill", "instagram-agent-skill", "impeccable", "huashu-design", "ui-ux-pro-max", "taste-skill", "playwright-cli", "n8n-skills", "n8n-mcp", "browser-harness", "career-ops", "design-extract", "codeburn", "open-design", "claude-video", "graphify", "caveman", "claude-plugins-official", "context7", "claude-mem", "ralph-claude-code", "skills-cli", "task-observer", "rea", "higgsfield", "anthropic-skills", "marketingskills", "claude-cost-optimizer", "claude-skills-alirezarezvani", "knowledge-work-plugins", "academic-research-skills", "cybersecurity-skills", "ai-marketing", "claude-ads", "brag", "ecc"]:
    out += [f"## Skills : {pack}", "", "| Skill | Description |", "|---|---|"]
    files = list((root/"skills"/pack).rglob("SKILL.md"))
    if not files:
        out.append(f"| `skills/{pack}` | (pas de SKILL.md : outil CLI, voir README.md du dossier et le README de la réserve) |")
    if pack == "graphify": files.append(root/"skills/graphify/graphify/skill.md")
    for f in sorted(x for x in files if not any(s in x.as_posix() for s in SKIP)):
        out.append(f"| `{f.parent.relative_to(root).as_posix()}` | {desc(f)} |")
    out.append("")
(root/"INDEX.md").write_text("\n".join(out))
