#!/usr/bin/env python
import sys

def Hello(s):
  print('Hello %s' % s)

s = 'Python!'
if len(sys.argv) > 1:
  s = sys.argv[1]

Hello(s)
