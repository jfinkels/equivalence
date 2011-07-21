Compilation dependencies
------------------------

Besides pdflatex, compile-time dependencies include the following LaTeX
packages:

* aliascnt
* algorithm2e
* amsthm
* amsmath
* amssymb
* complexity
* hyperref
* xy

On Ubuntu, the necessary system packages which contain these LaTeX packages
are:

* texlive-base
* texlive-latex-base
* texlive-pictures
* texlive-science

To install them, run

    sudo apt-get install texlive-base texlive-latex-base texlive-pictures \
      texlive-science

Compiling
---------

To compile this article, run 

    ./compile-paper.sh

The output is equivalence.pdf.

Copyright
---------

Except where otherwise noted, both the LaTeX markup and the content of the
article and the poster are made available under the terms of the Creative
Commons Attribution-ShareAlike 3.0 license,
http://creativecommons.org/licenses/by-sa/3.0/.

Contact
-------

Jeffrey Finkelstein <jeffrey.finkelstein@gmail.com>
