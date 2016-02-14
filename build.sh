#!/usr/bin/env bash

set -v

lsc -m debug -o js -c src/*.ls
browserify -d js/*.js -o out/bundle.js
sass-1.9 src/splendor.sass out/splendor.css
