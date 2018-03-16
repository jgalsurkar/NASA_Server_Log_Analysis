#!/usr/bin/env python

from operator import itemgetter
import sys

current_word = None
bandwidth = 0
word = None

for line in sys.stdin:
    line = line.strip()
    word, bytes = line.split('\t', 1)
    try:
        bytes = int(bytes)
    except ValueError:
        continue
    if current_word == word:
        bandwidth += bytes
    else:
        if current_word:
            print '%s\t%s' % (current_word, bandwidth)
        bandwidth = bytes
        current_word = word

if current_word == word:
    print '%s\t%s' % (current_word, bandwidth)
