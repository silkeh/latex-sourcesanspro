#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Usage: $0 <TDS zip> <package name>"
    exit 1
fi

zip="$1"
pkg="$2"

mkdir "$pkg"
unzip "$zip" -d "$pkg"

for d in "$pkg"/*/; do
    find "$d" -type f -exec mv -t "$d" {} +
done

find "$pkg" -type d -empty -delete

mv -t "$pkg" "$pkg/doc/README.md"

rm -f "$pkg.zip"
zip -r "$pkg.zip" "$pkg" "$zip"

rm -rf "$2"
