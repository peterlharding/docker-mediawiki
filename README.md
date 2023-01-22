# docker-mediawiki

Local Docker based Mediawiki site

Based on - https://hub.docker.com/_/mediawiki/

I have added an adminer image to the compose file to allow convenient access to the database

Have added a .env file for defining the ports that both adminer and Mediawiki use

A Makefile is included for common actions:

```
make setup
make config
make up
make down
```




