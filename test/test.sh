#!/bin/bash

gcc  -g  ../acism.c ../acism_create.c ../acism_dump.c ../acism_file.c ../acism_x.c ../msutil.c ../tap.c -o acism_x;
gcc  -g  ../acism.c ../acism_create.c ../acism_dump.c ../acism_file.c ../msutil.c ../tap.c ../acism_mmap_x.c -o acism_mmap_x;

./acism_x pattern.txt;

./acism_mmap_x acism.tmp test.txt;
