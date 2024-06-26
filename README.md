# Jekyll in a Container

[![License: ISC](https://img.shields.io/badge/License-ISC-blue)](https://opensource.org/licenses/isc)
[![Podman](https://img.shields.io/badge/Podman-grey?logo=podman&logoColor=ffffff)](https://github.com/containers/podman)
[![Jekyll](https://img.shields.io/badge/Static%20Site%20Builder-Jekyll-green)](https://jekyllrb.com/)

This repository holds the means to build a simple container for creating jekyll static site content.

Source files are placed in the `src` folder. Please follow on the instructions on the official Jekyll website to create a new Jekyll site.

## Scripts

Scripts are supplied for building and starting the container as well as preparing files for deployment online.

- build_image.sh - builds the container image
- start_container.sh - starts a container listening on port 4000 and using the `src` directory as a source. Serves the development files via http.
- build_site.sh - will build the files into the `src/_site_build` folder. Ready for deployment to a web server.
- src/new_post.sh - will create a new post file. It takes the `_posts/<category>/<yyyy-mm-dd-title>.md|html` as an argument.

## Build command

```sh
podman build -t teknikuglen/jekyll:1 -f Containerfile .
```

## Run container

```sh
podman run -v "$PWD/src:/site" -p 4000:4000 --name jekyll localhost/teknikuglen/jekyll:1
```

## Generate output files

Note. The container should be running for this to work!

```sh
podman exec -it jekyll bundle exec jekyll build --destination _site-build
```
