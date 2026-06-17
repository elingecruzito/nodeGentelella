# ---------------------------------------------------------
# Dockerfile de Producción
#
# Objetivo:
# Construir una imagen optimizada para ambientes productivos.
#
# Características:
# - Instala únicamente dependencias necesarias.
# - No incluye herramientas de desarrollo.
# - Ejecuta la aplicación mediante npm start.
# ---------------------------------------------------------

FROM node:18-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar únicamente dependencias productivas
RUN npm install --production

# Copiar código fuente
COPY . .

# Puerto utilizado por la aplicación
EXPOSE 3000

# Comando de arranque
CMD ["npm","start"]