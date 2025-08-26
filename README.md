
# TpCicd - CI/CD Angular + Docker + GitHub Actions

Ce projet Angular est livré avec une chaîne CI/CD complète :

## Développement local

- `ng serve` pour lancer le serveur de dev sur http://localhost:4200/

## Build de production

- `ng build --configuration production` pour générer le build prod dans `dist/`

## Conteneurisation Docker

### Construire l'image localement
```sh
docker build -t mehmedbamba/angular-app:latest .
```

### Lancer le conteneur localement
```sh
docker compose --env-file .env.example up -d
```
L'application sera accessible sur http://localhost:8080

## Publication sur Docker Hub

L'image est automatiquement poussée sur [Docker Hub](https://hub.docker.com/r/mehmedbamba/angular-app) via GitHub Actions à chaque push sur la branche `main` ou `index`.

## CI/CD avec GitHub Actions

Le workflow `.github/workflows/cicd.yml` :
- Installe Node et build l'app Angular
- Construit et push l'image Docker sur Docker Hub (`mehmedbamba/angular-app:latest` et `:sha`)
- (Optionnel) Déploie sur un serveur distant via SSH et Docker Compose

### Secrets requis dans GitHub
- `DOCKERHUB_USER` : mehmedbamba
- `DOCKERHUB_TOKEN` : votre token Docker Hub (type `dckr_pat_...`)
- `REMOTE_HOST`, `REMOTE_USER`, `REMOTE_SSH_KEY` : pour le déploiement distant (optionnel)

## Fichiers importants
- `Dockerfile` : multi-stage build Angular + Nginx
- `nginx.conf` : configuration Nginx adaptée SPA
- `docker-compose.yml` : lancement du conteneur
- `.env.example` : variables d'environnement
- `.github/workflows/cicd.yml` : pipeline CI/CD

---

Pour toute question, contactez : mehmedbamba <mehmedbamba098@gmail.com>
