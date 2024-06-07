#!/usr/bin/bash

podman run -v "$PWD/src:/site" -p 4000:4000 --name jekyll localhost/teknikuglen/jekyll:1