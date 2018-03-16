#!/usr/bin/env python

import sys
import re

regex = re.compile(r'([^ ]*) - - \[([^\]]+)\] \"*(.*?)[ "](.*?)[ "]\s*(.*?)\"* ([0-9\-]+) ([0-9\-]+)')

for line in sys.stdin:
    match = regex.findall(line)
    if len(match) != 0 and len(match[0][5]) == 3:
		print '%s\t%s' % (match[0][5], 1)


