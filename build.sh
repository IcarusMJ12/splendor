#!/usr/bin/env bash

set -v

lsc -m debug -o js -c src/*.ls
browserify -d js/splendor.js -o out/bundle.js
sass sass/splendor.sass out/splendor.css
