# NodeGentelella

[ExpressJs](https://expressjs.com/) framework with [Gentelella](https://colorlib.com/polygon/gentelella/index.html) template.

## Getting Started

- Check database settings ( /vendor/constants.js )
- Import data base ( /backup.sql )
- Ejecute project ( optional for windows: run /start.bat )

## Tools

- Generate automatic crud ( [your ip]:[your port]/crud )

With this tool you can generate an automatic CRUD from a table with diferents data types.

## Installed packages

```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

php composer.phar require chrmorandi/yii2-jasper
```