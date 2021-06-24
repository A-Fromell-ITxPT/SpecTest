#!/bin/sh
pandoc --filter=pandoc-include -s --toc --css=pandoc.css -t gfm -o APC-II_Draft.md working-APC-II.md
pandoc --filter=pandoc-include -s --toc --css=pandoc.css -o APC-II_Draft.html working-APC-II.md