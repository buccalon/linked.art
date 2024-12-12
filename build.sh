#!/bin/bash

# Regenerate from scratch
rm -rf .site/*

# Remake the table, still separate
#python scripts/mk_table.py
# Split up the current ontology into little static files
#rm content/ns/terms/*
#python scripts/split_ontology.py

# checkout the schema and build the documentation

# And now generate the site from scratch
mkdocs build --clean

# Once more incrementally to catch new files
# mkdocs build

