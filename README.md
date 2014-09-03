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
* `ccicons` (required by `toctex`; see below)
* `complexity`
* `csquotes`
* `hyperref`
* `textcomp`
* `thmtools`
* `thm-restate`
* `oberdiek` (which is actually a collection of LaTeX packages)
* `xy`

To install these on Ubuntu 11.04 through 14.04, run

    sudo apt-get install texlive-base texlive-latex-base texlive-pictures \
      texlive-science

The [Theory of Computing][2] LaTeX package is required, but a version of this
package is included in this package in the directory `toctex`. The `toctex`
package was downloaded from the [Theory of Computing website][2] and the
`tocbase.cls` file was modified as described in the next section.

If for some reason you wish to compile the document as a Postscript file (using
the `pslatex` command) instead of a PDF file, you must (on Ubuntu 11.10)
install the following additional system package:

[2]: http://theoryofcomputing.org
[3]: http://ctan.org/pkg/oberdiek

## Modifications to the `tocbase.cls` file ##

The following modifications were made to the `tocbase.cls` file from the
original downloaded from the Theory of Computing website.

* Added `\RequirePackage{aliascnt}`.
* Used `aliascnt` to alias counters for propositions, definitions, etc. so that
  the `\autoref` command correctly names references to these environments
  (otherwise, the automatically generated names will all be "Theorem", since
  all theorem-like environments use the per-section theorem counter).
* Removed `\newcommand{\C}{{\mathbb C}}`, because the `\C` command is already
  defined in the `complexity` package.

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
