#!/bin/bash

set -e

pp $1.md > $1.gen.md

pandoc $1.gen.md \
  --template=../../assets/templates/ieee.latex \
  --top-level-division=section \
  -F pandoc-crossref -M "crossrefYaml=../../assets/crossref/crossrefIEEE.yml" \
  -f markdown+fenced_code_attributes+multiline_tables+tex_math_single_backslash+fenced_divs \
  -o $1.tex \
