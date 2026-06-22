#!/bin/bash

echo "Commit message:"
read MSG

rm -rf docs

python3 -m sphinx -E -a -b html source docs

touch docs/.nojekyll

git add .

git commit -m "$MSG"

git push

echo "Done!"
