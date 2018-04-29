#!/usr/bin/env python
import sys


def Hello(s):
  print('Hello %s' % s)


def main():
  s = 'Python!'
  if len(sys.argv) > 1:
    s = sys.argv[1]
  Hello(s)


if __name__ == "__main__":
  main()
