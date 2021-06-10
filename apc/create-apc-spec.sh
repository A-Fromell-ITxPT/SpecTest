#!/bin/sh
pandoc --filter=pandoc-include -s --toc --css=pandoc.css --number-sections -t gfm -o APC-II_Draft.md working-APC-II.md