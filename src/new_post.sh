#!/bin/bash

MYFILE=$1


# Check if filename is defined
if ! [[ "$#" -eq 1 && "$MYFILE" =~ .*\.(md|html) ]]; then
	echo
	echo "WRONG NUMBER OF ARGUMENTS OR WRONG EXTENSION"
	echo "This script is used to create an empty blog post"
	echo
	echo "Usage: $0 _posts/<category>/<yyyy-mm-dd-title>.md|html"
	exit
fi

if [ -f $MYFILE ]; then
	echo
	echo "File already exists. Exiting!"
	echo
	exit
fi

touch $MYFILE

cat > $MYFILE <<EOL
---
layout: post
title: <title>
date: 2023-01-16 19:39
update:
categories:
- <category1>
- <category2>
tags:
- <tag1>
- <tag2>
---
EOL

if [ -f $MYFILE ]; then
	echo
	echo "File $MYFILE created."
	echo
fi
