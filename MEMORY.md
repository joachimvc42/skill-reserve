# Mémoire de travail

Fichier de mémoire long terme partagé entre les sessions Claude Code (cloud et local). Claude le lit au début de chaque session et le met à jour quand l'utilisateur exprime une préférence, prend une décision ou laisse une tâche en suspens.

Règles d'écriture : une ligne par entrée, datée (AAAA-MM-JJ), en français ; remplacer une entrée devenue fausse plutôt que d'en ajouter une contradictoire ; jamais de secrets, clés API ni données personnelles.

## Préférences de l'utilisateur

- 2026-10-31 — Langue : français.
- 2026-10-31 — Pour chaque dépôt proposé : analyser le contenu (SKILL.md, scripts, hooks, réseau, télémétrie), puis résumer son utilité en une ligne et signaler les risques.
- 2026-10-31 — Ne rien perdre : tout dépôt proposé est copié dans cette réserve (sauf code produit ou fichiers énormes, dont le lien est alors noté dans le README), avec la source et le commit.
- 2026-10-31 — Ne jamais installer ni activer un skill, un plugin ou un hook sans accord explicite.
- 2026-10-31 — Installer partout le moins possible : seulement ce qui sert dans presque tous les projets.

## Décisions

- 2026-10-31 — `context7` : à installer pour toutes les sessions **locales** (script `local/install-local.sh`).
- 2026-10-31 — `claude-mem` : **en local uniquement** (dans le cloud, `~/.claude-mem` est effacé à chaque session) ; mode sans compte (`--provider claude`), télémétrie coupée. Dans le cloud, la mémoire, c'est ce fichier.
- 2026-10-31 — `code-review` (plugin officiel) : inutile, Claude Code a déjà `/code-review` intégré.
- 2026-10-31 — `ralph` (frankbria ou `ralph-loop` officiel) : jamais global, seulement sur un projet isolé et à la demande.
- 2026-10-31 — Kit UI du prochain site web : taste-skill, ui-ux-pro-max, huashu-design, impeccable, playwright-cli (+ frontend-design, design-extract en option). À installer dans le dépôt du site au démarrage du projet. Détails dans `README.md`, section « Kit UI ».
- 2026-10-31 — Conflits connus : ne pas installer Aegis et Superpowers ensemble ; un seul des deux Firecrawl (`firecrawl` ou `firecrawl-claude-plugin`) ; une seule variante de `youtube-skills` (`youtube-full`) ; le `caveman` de la réserve fait doublon avec le `caveman:caveman` déjà disponible.
- 2026-10-31 — Les sites web à garder (pas des skills) vont dans `references/sites.md`, avec une description et les mises en garde.

## En suspens

- 2026-10-31 — Guides 0xloucash (`references/sites.md`) non lus : ajouter `guides.0xloucash.xyz` aux domaines autorisés, puis les lire. En priorité « 5 skills Claude autonome » pour en tirer d'éventuels dépôts à ajouter à la réserve.
- 2026-10-31 — Installation locale de context7 et claude-mem : script prêt (`local/install-local.sh`), à lancer par l'utilisateur sur son ordinateur.
- 2026-10-31 — Dépôt `skill-reserve` public : l'utilisateur peut le passer en privé (il contient notamment `Apple_HIG.pdf`, © Apple).
- 2026-10-31 — Remotion : licence payante pour les entreprises de plus de 3 personnes. À vérifier avant un usage professionnel.
