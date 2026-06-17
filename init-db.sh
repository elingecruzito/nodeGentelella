#!/bin/bash

echo "Inicializando base de datos..."

cp /tmp/backup.sql /tmp/backup_processed.sql

# Elimina CREATE DATABASE
sed -i '/CREATE DATABASE/d' /tmp/backup_processed.sql

# Elimina USE nombre_bd
sed -i '/USE .*;/d' /tmp/backup_processed.sql

echo "Importando estructura y datos..."

mysql \
    -u root \
    -p"${MYSQL_ROOT_PASSWORD}" \
    "${MYSQL_DATABASE}" \
    < /tmp/backup_processed.sql

echo "Importación finalizada"