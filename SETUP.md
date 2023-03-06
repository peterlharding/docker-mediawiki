

# Setup

The process of setting up the wiki involves brining up the containers for the first time which will initialize the database.  Once this is done go to the new mediawiki endpoint and follow the prompts to initialize the Mediawiki setup.  On the completion of this you will be prompted to download a LocalSettings.php file which you should copy across to this directory.


## Summary of Steps

* Create required resources - make setup
* Bring up the containers - make up
* Initialise the mediawiki instance to create a LocalSettings.php - http://localhost:8080/
* Shutdown the containers - make down
* Uncomment the line in the docker-compose.yml file which links the LocalSettings.php file infot the container
* Bring  the containers up again - make up (mediawiki will now find the generated LocalSettings.php configuration file
* Use the wiki


# More Details
## Run Setup Script

```
$ make setup
bin/setup.sh

Copy the .env template and then adjust ports as required
local .env file already exists
ADMINER_PORT=8081
MEDIAWIKI_PORT=8080

Ensure that the docker network -  mw-net - exists
Docker network - mw-net - already exists

Ensure that db and images sub-directories exist
Directory db already exists
Directory images already exists
```

## Bring up Containers

```
 $ make up
docker compose up -d
[+] Running 3/3
 - Container mw-adminer    Started                                                                                                                                   1.1s
 - Container mw-mariadb    Started                                                                                                                                   1.1s
 - Container mw-mediawiki  Started                                                                                                                                   1.4s
docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS                  PORTS                      NAMES
a5456402ad75   mediawiki     "docker-php-entrypoi…"   2 seconds ago   Up Less than a second   0.0.0.0:8080->80/tcp       mw-mediawiki
757413298e86   adminer       "entrypoint.sh docke…"   2 seconds ago   Up Less than a second   0.0.0.0:8081->8080/tcp     mw-adminer
36ce1a8a44f1   mariadb       "docker-entrypoint.s…"   2 seconds ago   Up Less than a second   3306/tcp                   mw-mariadb
```

## Uncomment this line

```
# - ./LocalSettings.php:/var/www/html/LocalSettings.php

```

This will make the settings available to the Mediawiki server as it starts and so will bring up the initialized wiki instance.
