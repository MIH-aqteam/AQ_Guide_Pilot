#!/bin/bash

echo "Building local version..."

rm -rf build

python3 -m sphinx -E -a -b html source build/html

echo "Done!"

