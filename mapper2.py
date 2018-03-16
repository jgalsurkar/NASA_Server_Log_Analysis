#!/usr/bin/env python

import sys
import re

regex = re.compile(r'([^ ]*) - - \[([^\]]+)\] \"*(.*?)[ "](.*?)[ "]\s*(.*?)\"* ([0-9\-]+) ([0-9\-]+)')

for line in sys.stdin:
    match = regex.findall(line)
    if len(match) != 0 and match[0][6] != '-':
		if match[0][1].split('/')[1] == 'Jul':
			print '%s\t%s' % ('total', match[0][6])
