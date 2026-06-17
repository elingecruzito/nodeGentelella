# NodeGentelella CRUD Generator

## Descripción

NodeGentelella es una aplicación Node.js basada en Express y MySQL que permite generar operaciones CRUD dinámicamente a partir de tablas existentes en la base de datos.

El proyecto está preparado para ejecutarse mediante Docker y cuenta con dos ambientes completamente independientes:

* Desarrollo (DEV)
* Producción (PROD)

Cada ambiente posee:

* Base de datos propia.
* Red Docker independiente.
* Variables de entorno independientes.
* Volúmenes independientes.
* Configuración específica para cada entorno.

---

# Arquitectura

```text
┌──────────────────────┐
│   Desarrollo (DEV)   │
├──────────────────────┤
│ gentelella_app_dev   │
│ gentelella_db_dev    │
│ dev_network          │
└──────────────────────┘


┌──────────────────────┐
│  Producción (PROD)   │
├──────────────────────┤
│ gentelella_app_prod  │
│ gentelella_db_prod   │
│ crud_watcher         │
│ prod_network         │
└──────────────────────┘
```

---

# Requisitos

## Software requerido

* Docker
* Docker Compose
* Git

Verificar instalación:

```bash
docker --version
docker compose version
```

---

# Estructura del Proyecto

```text
project/
│
├── Dockerfile
├── Dockerfile.dev
│
├── docker-compose.dev.yml
├── docker-compose.prod.yml
│
├── .env.dev
├── .env.prod
│
├── app.js
├── package.json
│
├── routes/
├── controllers/
├── models/
├── views/
│
├── crud/
│
├── services/
│   └── crudWatcher.js
│
└── bin/
    └── www
```

---

# Variables de Entorno

## Desarrollo

Archivo:

```text
.env.dev
```

Contiene:

* Configuración MySQL DEV
* Puertos DEV
* Nombres de contenedores DEV
* Nombre de red DEV

---

## Producción

Archivo:

```text
.env.prod
```

Contiene:

* Configuración MySQL PROD
* Puertos PROD
* Nombres de contenedores PROD
* Nombre de red PROD

---

# Configuración Docker

## Dockerfile

Imagen utilizada para Producción.

Características:

* Dependencias productivas.
* Optimizada para despliegue.
* Menor tamaño.

---

## Dockerfile.dev

Imagen utilizada para Desarrollo.

Características:

* Incluye dependencias de desarrollo.
* Incluye Nodemon.
* Recarga automática de cambios.

---

# Levantar Ambiente de Desarrollo

```bash
docker compose \
-p gentelella-dev \
--env-file .env.dev \
-f docker-compose.dev.yml \
up -d
```

Verificar:

```bash
docker ps
```

Resultado esperado:

```text
gentelella_app_dev
gentelella_db_dev
```

Aplicación:

```text
http://localhost:3001
```

Base de datos:

```text
localhost:3307
```

---

# Levantar Ambiente de Producción

```bash
docker compose \
-p gentelella-prod \
--env-file .env.prod \
-f docker-compose.prod.yml \
up -d
```

Verificar:

```bash
docker ps
```

Resultado esperado:

```text
gentelella_app_prod
gentelella_db_prod
crud_watcher
```

Aplicación:

```text
http://localhost:3000
```

Base de datos:

```text
localhost:3306
```

---

# Ejecutar Ambos Entornos Simultáneamente

Iniciar DEV:

```bash
docker compose \
-p gentelella-dev \
--env-file .env.dev \
-f docker-compose.dev.yml \
up -d
```

Iniciar PROD:

```bash
docker compose \
-p gentelella-prod \
--env-file .env.prod \
-f docker-compose.prod.yml \
up -d
```

Verificar:

```bash
docker ps
```

Deberán aparecer:

```text
gentelella_app_dev
gentelella_db_dev

gentelella_app_prod
gentelella_db_prod

crud_watcher
```

---

# Detener Entorno DEV

```bash
docker compose \
-p gentelella-dev \
--env-file .env.dev \
-f docker-compose.dev.yml \
down
```

---

# Detener Entorno PROD

```bash
docker compose \
-p gentelella-prod \
--env-file .env.prod \
-f docker-compose.prod.yml \
down
```

---

# Reconstruir Imágenes

DEV

```bash
docker compose \
-p gentelella-dev \
--env-file .env.dev \
-f docker-compose.dev.yml \
up -d --build
```

PROD

```bash
docker compose \
-p gentelella-prod \
--env-file .env.prod \
-f docker-compose.prod.yml \
up -d --build
```

---

# Logs

Ver logs DEV:

```bash
docker logs -f gentelella_app_dev
```

Ver logs PROD:

```bash
docker logs -f gentelella_app_prod
```

Base de datos DEV:

```bash
docker logs -f gentelella_db_dev
```

Base de datos PROD:

```bash
docker logs -f gentelella_db_prod
```

---

# CRUD Dinámico

La aplicación genera CRUDs automáticamente a partir de tablas existentes en MySQL.

Flujo:

1. Crear tabla en MySQL.
2. Ejecutar generador CRUD.
3. Se crean rutas, controladores y vistas.
4. El sistema detecta los nuevos archivos.
5. Las nuevas funcionalidades quedan disponibles sin reiniciar la aplicación.

---

# CRUD Watcher

Archivo:

```text
services/crudWatcher.js
```

Responsabilidades:

* Detectar nuevos CRUDs.
* Detectar modificaciones.
* Limpiar caché de módulos.
* Recargar recursos dinámicamente.

Dependencia:

```bash
npm install chokidar
```

---

# Acceso a Contenedores

Aplicación DEV:

```bash
docker exec -it gentelella_app_dev sh
```

Aplicación PROD:

```bash
docker exec -it gentelella_app_prod sh
```

MySQL DEV:

```bash
docker exec -it gentelella_db_dev mysql -u root -p
```

MySQL PROD:

```bash
docker exec -it gentelella_db_prod mysql -u root -p
```

---

# Solución de Problemas

## Error: nodemon not found

Instalar:

```bash
npm install --save-dev nodemon
```

Reconstruir imagen:

```bash
docker compose -f docker-compose.dev.yml up -d --build
```

---

## Error: ECONNREFUSED MySQL

Verificar:

```bash
docker ps
```

Comprobar que la base de datos se encuentre en estado UP.

---

## Error: sólo se levanta un entorno

Asegurarse de utilizar distintos nombres de proyecto:

```bash
-p gentelella-dev
```

y

```bash
-p gentelella-prod
```

Esto evita que Docker Compose reemplace contenedores de otro ambiente.

---

# Autor

Proyecto NodeGentelella CRUD Generator.

Versión con soporte para ambientes DEV y PROD mediante Docker.
