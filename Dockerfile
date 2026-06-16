# Etapa de construcción
FROM node:18-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos de dependencias primero (mejor uso de caché de Docker)
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código fuente
COPY . .

# Exponer el puerto en que corre la app (definido en bin/www)
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]
