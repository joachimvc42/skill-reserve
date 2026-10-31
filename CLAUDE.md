# skill-reserve

Ce dépôt est une réserve de skills **non installés** et de références (liste d'API publiques, projets de démo 3D), plus la mémoire de travail de l'utilisateur.

## Mémoire

- Au début de chaque session, lire `MEMORY.md` : préférences, décisions et tâches en suspens de l'utilisateur. Les appliquer.
- Quand l'utilisateur exprime une préférence durable, prend une décision ou laisse quelque chose en suspens, mettre `MEMORY.md` à jour (une ligne datée), committer et pousser. Retirer les entrées « En suspens » une fois réglées.
- Ne jamais y écrire de secrets, de clés API ni de données personnelles.

## Actions manuelles de l'utilisateur

- `A-FAIRE.md` liste **toutes** les actions que l'utilisateur doit faire lui-même (créer un dépôt, obtenir une clé, changer un réglage, lancer un script sur son ordinateur…), quelle que soit la session ou le dépôt concerné.
- Chaque fois que tu demandes à l'utilisateur de faire quelque chose, ajoute la ligne dans `A-FAIRE.md` (quoi, où, comment, lien). Dès qu'il dit que c'est fait, et après vérification si possible, **supprime** la ligne. Mets à jour la date, committe et pousse.
- Ne pas dupliquer ces actions dans `MEMORY.md` : `MEMORY.md` garde les préférences, les décisions et les tâches de Claude.

## Réserve

Quand l'utilisateur a besoin de quelque chose qu'aucun outil actuel ne couvre : consulter `INDEX.md`, lire le skill pertinent, le proposer, et ne l'installer qu'après confirmation (procédure dans `README.md`).
Ne jamais installer ni activer quoi que ce soit sans accord explicite.
