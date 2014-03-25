#!/bin/sh
grep $(basename $(pwd)) ../ports.yml | cut -d ":" -f 2 | sed 's/ //g'
