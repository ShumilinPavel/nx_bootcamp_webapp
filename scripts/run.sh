#!/bin/bash

docker stop webapp
docker run -d --rm --name webapp -p 80:80 nx_bootcamp_webapp
