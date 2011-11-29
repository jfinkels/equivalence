# On polynomial time kernel reductions #

In this paper we examine polynomial time kernel reductions among equivalence
relations.

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

* `aliascnt`
* `amsthm`
* `amsmath`
* `amssymb`
* `complexity`
* `hyperref`
* `xy`

On Ubuntu 11.04, the necessary system packages which contain these LaTeX
packages are:

* `texlive-base`
* `texlive-latex-base`
* `texlive-pictures`
* `texlive-science`

To install them, run

    sudo apt-get install texlive-base texlive-latex-base texlive-pictures \
      texlive-science

## Compiling ##

To compile this article, run 

    ./compile-paper.sh

The output is `equivalence.pdf`.

## Copyright ##

Copyright 2011 Jeffrey Finkelstein

Except where otherwise noted, both the LaTeX markup and the content of the
article are made available under the terms of the Creative Commons
Attribution-ShareAlike 3.0 license,
http://creativecommons.org/licenses/by-sa/3.0/.

## Contact ##

Jeffrey Finkelstein <jeffrey.finkelstein@gmail.com>
