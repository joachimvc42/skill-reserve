# À faire (toi)

Les actions que **toi seul** peux faire : créer un dépôt, obtenir une clé, changer un réglage, lancer quelque chose sur ton ordinateur. Claude ajoute une ligne chaque fois qu'il te demande quelque chose, et la supprime dès que tu lui dis que c'est fait.

Dernière mise à jour : 2026-10-31.

## À faire maintenant

- [ ] **Vérifier la clé Gemini** (pour la veille YouTube). Elle n'est pas visible dans les sessions cloud. Dans le menu de l'environnement cloud (barre de titre de la session), puis **Edit** : vérifie qu'elle est bien dans les **variables d'environnement**, sous la forme exacte `GEMINI_API_KEY=ta_clé` (sans espaces ni guillemets), et dans l'environnement qu'utilisent tes sessions. Ouvre ensuite une **nouvelle session**. Clé gratuite : https://aistudio.google.com/apikey. Ne la colle jamais dans le chat.
- [ ] **Donner à Claude les chaînes YouTube que tu suis**, pour compléter `sources.md` dans `veille-youtube`. Le nom ou le lien de chaque chaîne suffit.

## Optionnel

- [ ] **Passer `skill-reserve` en privé.** Il est public, et contient notamment `Apple_HIG.pdf` (© Apple). Sur GitHub : dépôt `skill-reserve`, puis **Settings**, **Danger Zone**, **Change visibility**.
- [ ] **Clé Context7 gratuite** (quota plus large) : https://context7.com/dashboard. Ensuite, dans PowerShell, depuis `skill-reserve` : `claude mcp remove --scope user context7`, puis `$env:CONTEXT7_API_KEY = "ta_clé"`, puis `powershell -ExecutionPolicy Bypass -File .\local\install-local.ps1 context7`.
- [ ] **Remotion** : vérifier la licence si tu l'utilises au travail (payante au-delà de 3 personnes dans l'entreprise).
- [ ] **Higgsfield** : souscrire un abonnement, seulement si tu veux utiliser `skills/higgsfield` (images et vidéos IA, Seedance…).
