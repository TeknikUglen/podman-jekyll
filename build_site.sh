#!/bin/bash

# https://talk.jekyllrb.com/t/rename-the-site-folder/2567/5
# You can define source and destination folders either from the command line or in you config file.
#
# From the command line:
#
# bundle exec jekyll --source src --destination public
#
# With shorter option name: bundle exec jekyll -s src -d public

podman ps | grep jekyll-serve
EXIT_CODE=$?

if [ $EXIT_CODE ]; then
    podman exec -it jekyll bundle exec jekyll build --destination _site-build
    # the following line will remove the rss feed file. 
    # Comment line if you don't want it removed.
    podman exec -it jekyll rm _site-build/feed.xml
fi
