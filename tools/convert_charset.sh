#!/bin/bash

for file in src/*.c src/CH579UFI/*.c include/*.h lib/include/*.h
do
  echo "Converting ${file}..."
  iconv -f gbk -t utf8 "${file}" -o "${file}.new"
  mv "${file}.new" "${file}"
done
