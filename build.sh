#!/usr/bin/env bash

set -v

lsc -o js -c src/*.ls
browserify js/*.js -o out/bundle.js
sass-1.9 src/splendor.sass out/splendor.css
