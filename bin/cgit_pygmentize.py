#!/usr/bin/env python
#
# 12/21/2011 - seb@dbzteam.org
#
# Use Pygments (http://pygments.org/) to highlight files managed with git
# and web interfaced with cgit (http://hjemli.net/git/cgit/).
#
# Install:
#
# 1- Install python-pygments and python-chardet
# 2- Copy this script to /usr/local/bin/pygmentize_cgit.py (with exec rights)
# 3- Copy your 'pygments.css' (or edit CSS_FILE below) and associated 'head'
#    file under /var/www/cgit/. You can generate css styles with this script
#    https://github.com/mhutchin/dump-pygments-css
# 4- Add these statements under 'global settings' section of cgit
#    configuration file /etc/cgitrc:
#      # Include the content of this file verbatim in HEAD
#      head-include=/var/www/cgit/head
#      # Source code highlighting
#      source-filter=/usr/local/bin/pygmentize_cgit.py
#
import os
import sys

import chardet
import pygments
import pygments.lexers
import pygments.formatters

CSS_FILE = '/home/git/pygments-solarized.css'
DEBUG = True

def pygmentize(fn, in_stream=None, out_stream=None):
    # If not provided in_stream will be read from stdin and out_stream
    # will be written to stdout.
    if in_stream is None:
        in_stream = sys.stdin
    if out_stream is None:
        out_stream = sys.stdout

    lexer = None
    try:
        lexer = pygments.lexers.get_lexer_for_filename(fn, encoding='chardet')
    except pygments.util.ClassNotFound:
        lexer = pygments.lexers.TextLexer(encoding='chardet')

    # Read input stream.
    in_data = in_stream.read()

    # Detect input charset.
    chardet_encoding = chardet.detect(in_data)
    if 'encoding' not in chardet_encoding:
        out_stream.write(in_data)
        return

    if DEBUG:
        # output detected encoding
        k = file('/home/git/tmp/encoding', 'w')
        k.write(str(chardet_encoding) + '\n')
        k.close()

    formatter = None
    try:
        outencoding = chardet_encoding['encoding']
        formatter = pygments.formatters.get_formatter_by_name('html',
                                                              cssfile=CSS_FILE,
                                                              outencoding=outencoding)
    except pygments.util.ClassNotFound:
        out_stream.write(in_data)
        return

    pygments.highlight(in_data, lexer, formatter, outfile=out_stream)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        sys.exit(1)
    pygmentize(sys.argv[1])
