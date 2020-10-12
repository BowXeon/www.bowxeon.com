#!/bin/bash
cd ..
docker build -t jekyll:local .
docker run --rm -p 4000:4000 -it jekyll:local
