#!/bin/bash
cp -R $(export APP=vue-app ;ls -a1 $APP | grep -Ev '^\.\.?$' | grep -Ev '^\.git$' | grep -Ev '^'$APP'$' | x -I{} echo "$APP/"{}) ./
