# Polynomial time kernel reductions #

In this paper we examine polynomial time kernel reductions among equivalence
relations.

This file was last updated on 19 June 2014.

## Downloading ##

This paper can be found at https://github.com/jfinkels/equivalence. The
slideshow presentation corresponding to this paper can be found at
https://github.com/jfinkels/equivalence-talk.

To download the paper using [Git][1], run

    git clone git://github.com/jfinkels/equivalence

[1]: http://git-scm.com

## Compilation dependencies ##

Besides `pdflatex`, compile-time dependencies include the following LaTeX
packages:

* `amsmath`
* `amssymb`
* `amsthm`
* `babel`
* `biblatex`
* `complexity`
* `csquotes`
* `draftwatermark`
* `hyperref`
* `inputenc`
* `textcomp`
* `thmtools`
* `thm-restate`
* `tikz`
* `type1cm`

This document also requires [Biber][2] for bibliography management.

To install these on Ubuntu 11.04 through 14.04, run

    sudo apt-get install texlive-base texlive-latex-base texlive-pictures \
      texlive-science biber

[2]: http://biblatex-biber.sourceforge.net/

## Compiling ##

To compile this article, run 

    pdflatex equivalence
    biber equivalence
    pdflatex equivalence

The output is `equivalence.pdf`.

## Copyright ##

Copyright 2010, 2011, 2012, 2014 Jeffrey Finkelstein

Except where otherwise noted, both the LaTeX markup and the content of both the
article and the poster are made available under the terms of the Creative
Commons Attribution-ShareAlike 4.0 International License,
http://creativecommons.org/licenses/by-sa/4.0/.

## Contact ##

Jeffrey Finkelstein <jeffreyf@bu.edu>
