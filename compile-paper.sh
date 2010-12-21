#!/bin/sh

pdflatex equivalence && bibtex equivalence && pdflatex equivalence && pdflatex equivalence

exit 0
