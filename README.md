# skill-reserve

Réserve personnelle de skills Claude Code et de ressources de référence. **Rien n'est installé ni activé** : les skills sont dans `skills/` (et non dans `.claude/skills/`), donc Claude ne les charge pas automatiquement.

Le catalogue complet (une ligne par élément) est dans [`INDEX.md`](INDEX.md).

## Contenu

| Dossier | Source | Commit | Licence |
|---|---|---|---|
| `skills/brag/` | [latent-spaces/brag](https://github.com/latent-spaces/brag) | `669ab92` | MIT (musique CC BY 4.0, voir `assets/music/README.md`) |
| `skills/ecc/` | [affaan-m/ecc](https://github.com/affaan-m/ecc) (`skills/`) | `b38be6a` | MIT |
| `skills/humanizer/` | [blader/humanizer](https://github.com/blader/humanizer) (dépôt complet) | `0ef9fe5` | MIT |
| `skills/tutor-skills/` | [bevibing/tutor-skills](https://github.com/bevibing/tutor-skills) (dépôt complet) | `397110c` | MIT |
| `skills/youtube-skills/` | [ZeroPointRepo/youtube-skills](https://github.com/ZeroPointRepo/youtube-skills) (dépôt complet) | `4f7994b` | MIT |
| `skills/platform-design/` | [ehmo/platform-design-skills](https://github.com/ehmo/platform-design-skills) (dépôt complet) | `dc2be82` | MIT (`Apple_HIG.pdf` : © Apple) |
| `skills/superpowers/` | [obra/superpowers](https://github.com/obra/superpowers) (dépôt complet) | `2ce8aa1` | MIT |
| `skills/aegis/` | [GanyuanRan/Aegis](https://github.com/GanyuanRan/Aegis) (dépôt complet) | `0461c21` | MIT |
| `skills/firecrawl/` | [firecrawl/skills](https://github.com/firecrawl/skills) (dépôt complet) | `2bf714d` | ISC |
| `skills/firecrawl-claude-plugin/` | [firecrawl/firecrawl-claude-plugin](https://github.com/firecrawl/firecrawl-claude-plugin) (dépôt complet) | `e5d486a` | MIT |
| `skills/remotion/` | [remotion-dev/skills](https://github.com/remotion-dev/skills) (dépôt complet) | `30d4553` | voir la licence Remotion |
| `skills/agent-browser/` | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) (dépôt complet) | `5868f7c` | Apache-2.0 |
| `skills/claude-blog/` | [AgriciDaniel/claude-blog](https://github.com/AgriciDaniel/claude-blog) (dépôt complet) | `3544423` | MIT |
| `skills/founder-skill/` | [Jakeschincariol/founder-skill](https://github.com/Jakeschincariol/founder-skill) (dépôt complet) | `fd9385b` | MIT |
| `skills/impeccable/` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) (partie Claude Code : `.claude/`, `.claude-plugin/`, `plugin/`, `skill/`, `docs/`) | `df3a4ab` | Apache-2.0 |
| `skills/huashu-design/` | [alchaincyf/huashu-design](https://github.com/alchaincyf/huashu-design) (dépôt complet) | `9b01ee8` | MIT (stickers de démo : PolyForm Shield) |
| `skills/ui-ux-pro-max/` | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (dépôt complet) | `9a3f14f` | MIT |
| `skills/taste-skill/` | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) (dépôt complet) | `12af471` | MIT |
| `skills/playwright-cli/` | [microsoft/playwright-cli](https://github.com/microsoft/playwright-cli) (dépôt complet) | `faf6bc5` | Apache-2.0 |
| `skills/ai-marketing/` | [zubair-trabzada/ai-marketing-claude](https://github.com/zubair-trabzada/ai-marketing-claude) (dépôt complet) | `e5aa0ea` | MIT |
| `skills/claude-ads/` | [AgriciDaniel/claude-ads](https://github.com/AgriciDaniel/claude-ads) (dépôt complet) | `fc3908e` | MIT |
| `references/ecc-extras/` | [affaan-m/ecc](https://github.com/affaan-m/ecc) (`agents/`, `commands/`, `rules/`) | `b38be6a` | MIT |
| `references/public-apis/` | [public-apis/public-apis](https://github.com/public-apis/public-apis) | `2098dd7` | MIT |
| `references/r3f/` | [AliKhan-Devs/R3F](https://github.com/AliKhan-Devs/R3F) | `61281b5` | voir dépôt d'origine ; modèles 3D : voir `license.txt` de chaque modèle |

Ce qui n'a **pas** été copié depuis ECC, volontairement : ses 54 hooks, ses scripts, son installeur et son code source. Ils sont intrusifs et agissent sur toutes les sessions. Ils restent disponibles dans le dépôt d'origine.

## Kit UI prévu pour le prochain site web

L'utilisateur a demandé ces 5 éléments pour l'interface de son prochain site. Ils sont à installer **dans le dépôt du site**, au démarrage du projet, après confirmation :

| Rôle | Élément | Installation |
|---|---|---|
| Direction artistique (avant de coder) | `skills/taste-skill` | copier `skills/taste-skill/skills/taste-skill` dans `.claude/skills/` |
| Base de règles UI (styles, palettes, typos, UX) | `skills/ui-ux-pro-max` | copier `skills/ui-ux-pro-max/.claude/skills/ui-ux-pro-max` dans `.claude/skills/` (scripts Python, stdlib) |
| Prototypes HTML et propositions de directions | `skills/huashu-design` | copier le dossier entier dans `.claude/skills/huashu-design` ; `npm install` pour les exports |
| Critique, audit et polish du code UI | `skills/impeccable` | `npx impeccable install` puis `/impeccable init` |
| Vérification visuelle dans un vrai navigateur | `skills/playwright-cli` | `npm i -g @playwright/cli` puis copier `skills/playwright-cli/skills/playwright-cli` |

Chevauchements à surveiller : taste-skill, ui-ux-pro-max, huashu-design et impeccable cherchent tous à éviter le « design IA générique ». Ils se complètent (direction artistique → règles → prototype → audit), mais il faut éviter d'en installer d'autres du même type (par exemple `ecc/taste*` ou `ecc/frontend-design-direction`).

## Procédure (pour Claude)

Quand l'utilisateur a besoin de quelque chose :

1. Chercher dans `INDEX.md`, ou avec `grep -ril <mot-clé> skills/*/*/SKILL.md references/`.
2. Lire le `SKILL.md` du skill et ses éventuels scripts avant de le proposer. Vérifier ses dépendances (outils, autres skills, scripts du dépôt d'origine).
3. Proposer le skill et attendre la confirmation de l'utilisateur.
4. Installer en copiant le dossier dans `~/.claude/skills/<nom>/` (personnel) ou `<projet>/.claude/skills/<nom>/` (projet). Pour les agents ECC, utiliser `.claude/agents/`, et pour les commandes, `.claude/commands/`.

Pour une API : chercher dans `references/public-apis/README.md` par catégorie ou par mot-clé.

## Notes

- `skills/humanizer` : un seul `SKILL.md` sans dépendance. Il suffit de copier le dossier.
- `skills/tutor-skills` : 2 skills en Markdown pur. `tutor-setup` transforme des documents (PDF, texte, web) ou une base de code en coffre Obsidian « StudyVault » de fiches et d'exercices, et `tutor` t'interroge ensuite par quiz et suit ta progression. Pour l'installer, copier `skills/tutor-setup` et `skills/tutor` (avec leurs `references/`).
- `skills/youtube-skills` : 12 variantes d'un même service (transcriptions, recherche, chaînes et playlists YouTube) qui passent par l'API payante **TranscriptAPI.com** de l'auteur (100 crédits gratuits, puis payant). Il faut une clé `TRANSCRIPT_API_KEY`. N'en installer **qu'une seule** (`youtube-full` couvre tout) : leurs descriptions sont très larges (« même si YouTube n'est pas mentionné ») et risquent de se déclencher souvent et de consommer des crédits. Les dossiers `clawhub/` contiennent les mêmes skills, en version OpenClaw.
- `skills/platform-design` : 8 skills de guidelines de design (iOS, iPadOS, macOS, watchOS, visionOS, tvOS d'après l'Apple HIG ; Android d'après Material Design 3 ; Web/WCAG), chacun avec ses règles dans `rules/`. Markdown pur, sans script.
- `skills/superpowers` : méthode de développement complète en 15 skills (brainstorming, plans écrits, TDD, débogage systématique, revue de code, sous-agents, worktrees, vérification avant de déclarer terminé). C'est un plugin : son hook `SessionStart` injecte le skill `using-superpowers` à chaque début de session (rien d'autre, pas de réseau). Le skill `brainstorming` peut lancer un petit serveur web local (127.0.0.1) pour des maquettes visuelles. Installation recommandée : en plugin (`/plugin marketplace add obra/superpowers`), ou copier quelques skills individuellement.
- `skills/aegis` : dérivé de Superpowers (mêmes 15 skills de base) avec 8 skills en plus orientés architecture : cadrage d'objectif, contexte projet, décisions d'architecture (ADR), revue « premiers principes », lutte contre l'entropie, gouvernance UI/UX, tâches longues, communication concise. Même mécanisme de plugin : un hook `SessionStart` injecte `using-aegis`, sans réseau. **Ne pas installer en même temps que Superpowers** : leurs skills portent les mêmes noms et entreraient en conflit. Choisir l'un ou l'autre.
- `skills/firecrawl` : 37 skills officiels Firecrawl (scrape, crawl, search, map, extraction, recherche approfondie, leads, SEO, veille concurrentielle…). Ils passent par le CLI `firecrawl-cli` (npm) ou le serveur MCP `firecrawl-mcp`, et il faut une clé `FIRECRAWL_API_KEY` (service payant avec quota gratuit). Le produit lui-même, [firecrawl/firecrawl](https://github.com/firecrawl/firecrawl), n'est pas copié : c'est le code serveur, pas un skill.
- `skills/firecrawl-claude-plugin` : le plugin Claude Code officiel (13 skills + commandes). Il se connecte au MCP hébergé `mcp.firecrawl.dev`. Il fait doublon avec `skills/firecrawl` : n'installer que l'un des deux.
- `skills/remotion` : 12 skills officiels pour créer des vidéos en code React avec Remotion (création, sous-titres, cartes, rendu, studio, bonnes pratiques). Ils demandent Node. **Licence Remotion** : gratuite pour les particuliers et les entreprises de 3 personnes maximum, licence entreprise payante au-delà. À vérifier avant un usage professionnel.
- `skills/agent-browser` : CLI d'automatisation de navigateur pour agents (naviguer, remplir des formulaires, cliquer, faire des captures, extraire des données, tester une app). S'installe avec `npm i -g agent-browser && agent-browser install`, qui télécharge Chromium. Le skill principal est `skills/agent-browser`. Les sous-skills de `skill-data/` (Slack, Electron, Vercel Sandbox, AWS AgentCore…) sont chargés à la demande. Sa description demande à être préféré à tout autre outil web : à garder en tête.
- `skills/claude-blog` : 32 skills de blogging (rédaction, réécriture, audit SEO/GEO, clusters thématiques, calendrier éditorial, traduction, schéma, images, audio, fact-check…). Même auteur que claude-ads. Les images et l'audio passent par l'API Google Gemini (`GOOGLE_AI_API_KEY`). L'installeur copie les skills dans `~/.claude/skills` et `~/.claude/agents`. `brain/` est un coffre de connaissances de l'auteur et ses `.raw/` contiennent une copie des mêmes skills : ils sont exclus de l'index.
- `skills/founder-skill` : 11 skills pour tester un projet d'entreprise avant de le lancer (conseil d'administration, directeur marketing, CFO et marges, panel de 100 clients simulés, prix par Van Westendorp, offre, concurrents, marque, opérations, lancement, business plan). Scripts Python sans dépendance ni réseau, sans clé API.
- `skills/impeccable` : **fait partie du kit UI du prochain site web (voir plus haut).** Vocabulaire de design pour l'agent, avec 24 commandes `/impeccable` (`init`, `critique`, `audit`, `polish`, `bolder`, `document`…), un détecteur d'« AI slop » à 62 règles déterministes et des revues d'accessibilité et de performance classées de P0 à P3. Installation recommandée depuis la racine du projet : `npx impeccable install`, puis `/impeccable init` (qui écrit `PRODUCT.md`). Il ajoute des hooks au projet : au démarrage de session, après chaque Edit/Write (contrôle UI) et à l'arrêt (passe de design). Il exécute un binaire natif téléchargé depuis les releases GitHub officielles et vérifié par `engine-checksums.txt`. Non copiés : le code Rust du moteur, les tests, l'extension VS Code et les dossiers propres aux autres agents (disponibles dans le dépôt d'origine).
- `skills/huashu-design` : skill **en chinois** (il fonctionne aussi en français). Il produit des prototypes HTML haute fidélité, des slides, des animations, des visualisations et des revues d'expert, et propose toujours 3 directions de design avant d'exécuter. Les exports PDF/PPTX/vidéo passent par Node (playwright, sharp, pptxgenjs). Options cloud : TTS Doubao et revue vidéo Volcengine, avec clés `.env`, facultatives. `scripts/design-gate-hook.sh` est un hook optionnel qui bloque le rendu d'une longue vidéo sans direction validée. Passé sous MIT le 2026-05-14, usage commercial autorisé.
- `skills/ui-ux-pro-max` : base de données consultable (styles UI, palettes, paires de polices, types de graphiques, règles UX, conseils par stack) avec script de recherche Python. `.claude/skills/` contient aussi `banner-design`, `brand`, `design`, `design-system`, `slides` et `ui-styling`. `stack/.mcp.json` propose les MCP Playwright, Chrome DevTools et shadcn (facultatif).
- `skills/taste-skill` : « tasteskill v2 », direction artistique pour sites web tirée de l'étude de 247 sites de galeries (Awwwards, One Page Love). Il pioche une direction (idée, composition, typo, palette, photos, structure des sections) dans une bibliothèque et impose des règles anti-« slop ».
- `skills/playwright-cli` : skill officiel Microsoft pour piloter Chromium, Firefox ou WebKit via `playwright-cli` (ouvrir le site, cliquer, capturer, tester). Le serveur MCP équivalent est [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) (`npx @playwright/mcp@latest`), qui n'est pas copié.
- `skills/ai-marketing` : orchestrateur `market/` + 14 skills `skills/market-*` + agents + scripts Python (stdlib ; `reportlab` optionnel pour les PDF). Ses scripts récupèrent les pages web à analyser. L'installation passe par `install.sh` (copie dans `~/.claude/skills` et `~/.claude/agents`), ou se fait à la main.
- `skills/claude-ads` : orchestrateur `ads/` + 33 skills `skills/ads-*` + 25 agents + bibliothèque Python `claude_ads_core`. Son `install.sh` crée un venv avec des dépendances verrouillées par hash (requests, playwright, weasyprint…). Modifier des campagnes réelles demande les tokens API des régies et une approbation explicite. Le `CLAUDE.md` de ce dossier sert au développement du projet, pas à la réserve.

- `skills/brag/brag` a besoin de Node (`npx hyperframes`) et rend une vidéo MP4. `brag-slim` est la version allégée, sans assets.
- Plusieurs skills ECC renvoient à d'autres skills ECC ou à des scripts du dépôt d'origine. À vérifier avant l'installation.
