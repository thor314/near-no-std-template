#!/bin/bash

# replace all instances of the word dummy
sed -i "s/dummy/$1/g" Cargo.toml
sed -i "s/dummy/$1/g" build.sh
sed -i "s/dummy/$1/g" deploy.sh

target=`echo $1 | tr [A-Z] [a-z] | sed -e 's/^./\U&/g; s/ ./\U&/g'`
sed -i "s/Dummy/$target/g" src/lib.rs

mv README.md instructions.md
echo "# $1" >> README.md
git remote remove origin
