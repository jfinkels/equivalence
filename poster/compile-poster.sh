#!/bin/sh

pdflatex poster && bibtex poster && pdflatex poster && pdflatex poster
