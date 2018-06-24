#!/usr/bin/env python3
import argparse
import sys


def ParseArgs():
  parser = argparse.ArgumentParser()
  parser.add_argument('-i', '--input_file', type=str, default=None)
  return parser.parse_args()


def Solve(x):
  return x


def main():
  flags = ParseArgs()
  with open(flags.input_file) if flags.input_file else sys.stdin as f:
    for line in f:
      x = [int(s) for s in line.strip().split()]
      print(Solve(x))


if __name__ == "__main__":
  main()
