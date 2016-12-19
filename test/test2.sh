#!/bin/bash

gcc -g ../acism.c ../acism_create.c ../acism_dump.c ../acism_file.c ../msutil.c ../tap.c ./acism_x_t.c -o acism_x_t;

./acism_x_t pattern.txt test.txt;
