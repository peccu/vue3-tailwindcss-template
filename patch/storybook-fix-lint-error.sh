#!/bin/bash
cd src/stories

for i in Button Header Page
do
    mv {,Sample}$i.stories.ts
    mv {,Sample}$i.vue
done
