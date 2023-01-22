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


# Setup

These steps assume you have make installed in your local environment (linux, macos or cygwin)

1)  Run - make setup - to create folders and docker network
2)  Specify the ports you want to use in the .env file
3)  Run - make up - to bring up containers (which will initialize the database)
4)  Go to Mediawiki site (http://localhost:808x) and run through the Mediawiki configuration -> generates LocalSettings.php file
5)  Stop the containers - make down
6)  Copy LocalSettings.php to directory and uncomment related line in docker-compose.yml file
7)  Bring up the containers - make up
8)  Log into Mediawiki - http://localhost:808x


