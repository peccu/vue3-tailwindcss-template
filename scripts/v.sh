#!/bin/bash

echo commit ref: $COMMIT_REF
cat scripts/v.js | sed 's/"VERSION_STR"/'$(date "+%s")'/g' > public/v.js
