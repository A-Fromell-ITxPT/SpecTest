#!/bin/sh
# For this script to work fully need to install
#  - pandoc - recommend installing latest rather than what is installed by apt-get (at least with Ubuntu 2004)
#  - pandoc include (https://pypi.org/project/pandoc-include/)
#  - wkhtmltopdf

pandoc --filter=pandoc-include -s --toc --css=pandoc.css -t gfm -o APC-II_Draft.md working-APC-II.md
pandoc --filter=pandoc-include -s --toc --css=pandoc.css -o APC-II_Draft.html working-APC-II.md
# install path of texlive / xelatex
#PATH=$PATH:/usr/local/texlive/2021/bin/x86_64-linux
#pandoc --filter=pandoc-include -s --toc  --pdf-engine=xelatex -V 'mainfont:DejaVuSans' -o APC-II_Draft.pdf working-APC-II.md
#pandoc --filter=pandoc-include -s --toc  --pdf-engine=pdflatex -V 'fontfamiliy:dejavu' -V 'fontfamilyoptions:sfdefault' -o APC-II_Draft_pdflatex.pdf working-APC-II.md
# below requires install of 
pandoc --filter=pandoc-include --css font-only.css -s --toc  --pdf-engine=wkhtmltopdf -o APC-II_Draft.pdf working-APC-II.md
