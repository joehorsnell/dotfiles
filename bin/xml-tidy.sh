#!/bin/sh
xmllint --c14n "$*" | XMLLINT_INDENT=$'\t' xmllint --encode UTF-8 --format -
