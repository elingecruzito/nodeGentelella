# Node Gentelella CRUD Generator

## Ambientes Disponibles

### Desarrollo

```bash
docker compose \
--env-file .env.dev \
-f docker-compose.dev.yml up -d
```

### Producción

```bash
docker compose \
--env-file .env.prod \
-f docker-compose.prod.yml up -d
```

---

## Detener ambiente

Desarrollo

```bash
docker compose \
--env-file .env.dev \
-f docker-compose.dev.yml down
```

Producción

```bash
docker compose \
--env-file .env.prod \
-f docker-compose.prod.yml down
```

---

## Reconstruir imágenes

```bash
docker compose \
--env-file .env.dev \
-f docker-compose.dev.yml up -d --build
```

---

## Estructura

- Dockerfile → Producción
- Dockerfile.dev → Desarrollo
- .env.dev → Variables desarrollo
- .env.prod → Variables producción
- docker-compose.dev.yml → Orquestación desarrollo
- docker-compose.prod.yml → Orquestación producción
- crudWatcher.js → Detección automática de nuevos CRUDs

---

## Flujo CRUD Dinámico

1. Crear tabla en MySQL.
2. Ejecutar generador CRUD.
3. Se crean controladores, vistas y rutas.
4. crudWatcher detecta los cambios.
5. Las rutas quedan disponibles sin reiniciar Node.