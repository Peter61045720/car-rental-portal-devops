# Autóbérlés szolgáltató platform

## Szükséges eszközök

### Visual Studio Code

https://code.visualstudio.com/download

### Node.js és NPM

https://nodejs.org/en/download

### Docker Desktop (Windows)

https://www.docker.com/products/docker-desktop/

### Terraform

https://developer.hashicorp.com/terraform/install

## Felhasznált eszközök

Windows eszközön mindenképp indítsd el a Docker Desktop alkalmazást, hogy működjenek a lenti eszközök!

### Docker

Szerver projekt: lépj a server mappába, majd

```
docker build -t car-rental-portal-server .
```

és:

```
docker run -it -p 5000:5000 --rm car-rental-portal-server
```

a `localhost:5000` címen lesz elérhető a szerver

Kliens projekt: lépj a client mappába, majd

```
docker build -t car-rental-portal-client .
```

majd:

```
docker run -it -p 8100:8100 --rm car-rental-portal-client
```

a `localhost:8100` címen lesz elérhető a kliens

### Docker Compose

A gyökérkönyvtárból futtasd:

```
docker compose up --build
```

az így elindított konténerek leállítása:

```
docker compose down
```

### Jenkins

Indítsd el a szükséges konténereket a **Docker Compose** segítségével! A `localhost:8080` címen lesz elérhető a Jenkins.

- Készíts egy helyi fiókot, ideiglenes admin jelszó helye: `./infra/jenkins/jenkins_home/secrets/initialAdminPassword`
- Vagy lépj be a `jenkins` felhasználónévvel és `jenkins` jelszóval.

A Tool-ok közül mindenképp szükséged lesz egy `node22` nevű NodeJS-re.

A CI/CD Pipeline kliens és szerver projekthez GitHub SCM segítségével készült. Mind a client, mind a server rendelkezik a saját Jenkinsfile-lal, ezeket kell megadni a pipeline-ok elkészítésekor.
