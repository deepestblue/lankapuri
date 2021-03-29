#!/usr/bin/env python3.9
# encoding: utf-8

import os
import contextlib
import argparse
from fontTools import ttLib
from fontTools.ttLib.tables._n_a_m_e import NameRecord

def main():
  parser = argparse.ArgumentParser(description='A tool to add non‐English names to typefaces.')
  parser.add_argument('--ta')
  parser.add_argument('--sa')
  parser.add_argument('typeface_file')
  args = parser.parse_args()
  path = os.path.abspath(args.typeface_file)

  with contextlib.closing(ttLib.TTFont(path)) as ttf:
    # Not even Apple cares about platformID=1. https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html
    ttf['name'].removeNames(platformID=1)

    # Cannot use addMultilingualName as it only supports the Unicode BMP encoding.
    ttf['name'].setName(args.ta, 4, 3, 10, 1097)
    ttf['name'].setName(args.sa, 4, 3, 10, 1103)

    ttf.save(path)

if __name__ == '__main__':
  main()
