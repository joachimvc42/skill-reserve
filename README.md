# skill-reserve

Réserve personnelle de skills Claude Code et de ressources de référence. **Rien n'est installé ni activé** : les skills sont dans `skills/` (et non dans `.claude/skills/`), donc Claude ne les charge pas automatiquement.

Le catalogue complet (une ligne par élément) est dans [`INDEX.md`](INDEX.md).

## Contenu

| Dossier | Source | Commit | Licence |
|---|---|---|---|
| `skills/brag/` | [latent-spaces/brag](https://github.com/latent-spaces/brag) | `669ab92` | MIT (musique CC BY 4.0, voir `assets/music/README.md`) |
| `skills/ecc/` | [affaan-m/ecc](https://github.com/affaan-m/ecc) (`skills/`) | `b38be6a` | MIT |
| `skills/humanizer/` | [blader/humanizer](https://github.com/blader/humanizer) (dépôt complet) | `0ef9fe5` | MIT |
| `skills/ai-marketing/` | [zubair-trabzada/ai-marketing-claude](https://github.com/zubair-trabzada/ai-marketing-claude) (dépôt complet) | `e5aa0ea` | MIT |
| `skills/claude-ads/` | [AgriciDaniel/claude-ads](https://github.com/AgriciDaniel/claude-ads) (dépôt complet) | `fc3908e` | MIT |
| `references/ecc-extras/` | [affaan-m/ecc](https://github.com/affaan-m/ecc) (`agents/`, `commands/`, `rules/`) | `b38be6a` | MIT |
| `references/public-apis/` | [public-apis/public-apis](https://github.com/public-apis/public-apis) | `2098dd7` | MIT |
| `references/r3f/` | [AliKhan-Devs/R3F](https://github.com/AliKhan-Devs/R3F) | `61281b5` | voir dépôt d'origine ; modèles 3D : voir `license.txt` de chaque modèle |

Ce qui n'a **pas** été copié depuis ECC, volontairement : ses 54 hooks, ses scripts, son installeur et son code source. Ils sont intrusifs et agissent sur toutes les sessions. Ils restent disponibles dans le dépôt d'origine.

## Procédure (pour Claude)

Quand l'utilisateur a besoin de quelque chose :

1. Chercher dans `INDEX.md`, ou avec `grep -ril <mot-clé> skills/*/*/SKILL.md references/`.
2. Lire le `SKILL.md` du skill et ses éventuels scripts avant de le proposer. Vérifier ses dépendances (outils, autres skills, scripts du dépôt d'origine).
3. Proposer le skill et attendre la confirmation de l'utilisateur.
4. Installer en copiant le dossier dans `~/.claude/skills/<nom>/` (personnel) ou `<projet>/.claude/skills/<nom>/` (projet). Pour les agents ECC, utiliser `.claude/agents/`, et pour les commandes, `.claude/commands/`.

Pour une API : chercher dans `references/public-apis/README.md` par catégorie ou par mot-clé.

## Notes

- `skills/humanizer` : un seul `SKILL.md` sans dépendance. Il suffit de copier le dossier.
- `skills/ai-marketing` : orchestrateur `market/` + 14 skills `skills/market-*` + agents + scripts Python (stdlib ; `reportlab` optionnel pour les PDF). Ses scripts récupèrent les pages web à analyser. L'installation passe par `install.sh` (copie dans `~/.claude/skills` et `~/.claude/agents`), ou se fait à la main.
- `skills/claude-ads` : orchestrateur `ads/` + 33 skills `skills/ads-*` + 25 agents + bibliothèque Python `claude_ads_core`. Son `install.sh` crée un venv avec des dépendances verrouillées par hash (requests, playwright, weasyprint…). Modifier des campagnes réelles demande les tokens API des régies et une approbation explicite. Le `CLAUDE.md` de ce dossier sert au développement du projet, pas à la réserve.

- `skills/brag/brag` a besoin de Node (`npx hyperframes`) et rend une vidéo MP4. `brag-slim` est la version allégée, sans assets.
- Plusieurs skills ECC renvoient à d'autres skills ECC ou à des scripts du dépôt d'origine. À vérifier avant l'installation.
