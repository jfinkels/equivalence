#!/bin/sh

pdflatex thesis && bibtex thesis && pdflatex thesis && pdflatex thesis

exit 0
