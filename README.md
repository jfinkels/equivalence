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

* `amsthm`
* `amsmath`
* `amssymb`
* `babel`
* `biblatex`
* `complexity`
* `csquotes`
* `hyperref`
* `textcomp`
* `thmtools`
* `thm-restate`
* `xy`

To install these on Ubuntu 11.04 through 14.04, run

    sudo apt-get install texlive-base texlive-latex-base texlive-pictures \
      texlive-science

To compile the poster which corresponds to the article, compile-time
dependencies include the following LaTeX packages:

* `amsmath`
* `amsthm`
* `complexity`
* `type1cm`
* `tkz-graph`
* `xy`

On Ubuntu 11.04 and 11.10, the necessary system packages which contain these
LaTeX packages (other than `tkz-graph`, see below) are:

* `texlive-latex-base`
* `texlive-latex-extra`
* `texlive-science`

To install them, run

    sudo apt-get install texlive-latex-base texlive-latex-extra texlive-science

`tkz-graph` must be downloaded manually and placed in the `poster/` directory
(or somewhere else where LaTeX can find it). It can be downloaded from
http://www.ctan.org/tex-archive/macros/latex/contrib/tkz/tkz-graph.

## Compiling ##

To compile this article, run 

    pdflatex equivalence
    biber equivalence
    pdflatex equivalence

The output is `equivalence.pdf`.

To compile the poster corresponding to the article, run

    cd poster
    ./compile-poster.sh

The output is `poster/poster.pdf`

## Copyright ##

Copyright 2010, 2011, 2012, 2014 Jeffrey Finkelstein

Except where otherwise noted, both the LaTeX markup and the content of both the
article and the poster are made available under the terms of the Creative
Commons Attribution-ShareAlike 4.0 International License,
http://creativecommons.org/licenses/by-sa/4.0/.

## Contact ##

Jeffrey Finkelstein <jeffreyf@bu.edu>
