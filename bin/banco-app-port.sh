#!/bin/sh
grep $(basename $(pwd)) etc/shared/config/ports.yml | cut -d ":" -f 2 | sed 's/ //g'
