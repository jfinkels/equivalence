%% tocbase.cls version 3.3   2010-09-23  ToC base style file

% Filename: tocbase.cls
%
% This documentclass is a base class inherited by classes toc and toclibrary that are
% intended for typesetting articles for the
%
%                        Theory of Computing.
%
% See http://theoryofcomputing.org for further details.
%
% Search for ``%%% PART'' to find the main parts of this class file.

%% Version 2.26: fixes tocadjust homepage bug & compilation advertisements.
%% Version 2.27: Adds letterpaper as option for the article class.
%% Version 3.1: Adds further support for hyperxmp data & license data. New copyright and license boxes. First put in to circulation with volume 5.
%% Version 3.2: Fixes date layout bug when no dates are defined; alter copyright layout.
%% Version 3.21: Fixes copyright date layout; uniformizes copyright/cc symbols.
%% Version 3.22: Fixes spacing around copyright symbol when \toc@date not set.
%% Version 3.23: Deprecates tocadjust.sty, icons are now loaded if the files exist.
%% Version 3.24: Reorders package loading so that hyperref is after graphicx. Adds checks for custom icons.
%% Version 3.25: Insures that \hypersetup is called on 1st page, fixing a bug that can occur with long abstracts and classification=float.
%% Version 3.26: Removes letterpaper option to hyperref, no longer supported.
%% Version 3.3: Includes microtype; minor changes to theoremstyles;
%%      changes in dedication layout spacing.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Declare class and load external packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Need this version of LaTeX at least (for ClassWarning commands)
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{tocbase}[2010/09/23 v3.3 Theory of Computing Base]

% Do not pass the following options down to the article class
\def\toc@dontpassoptions{10pt,11pt,12pt,oneside,twoside}
\@for\toc@tmpe:=\toc@dontpassoptions\do{%
   \DeclareOption{\toc@tmpe}{}
}

% ...but do pass along the titlepage option.
\DeclareOption{titlepage}{\PassOptionsToClass{titlepage}{article}}

\ProcessOptions\relax

% Now load article class and handle options.
\LoadClass[11pt,twoside,letterpaper]{article}

% JJF 12 January 2012 - Use aliascnt to allow for correct autoref names.
\RequirePackage{aliascnt}

% Insure that we use postscript type 1 times.
\RequirePackage{mathptmx}

% Load microtype.
\RequirePackage{microtype}

% Load amsmath and amsthm packages
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}

% Load color, eucal.
\RequirePackage{color}
\RequirePackage{eucal}

% We'll require the page number of the last page in the title and
% running footers.
\RequirePackage{refcount}
\RequirePackage{lastpage}

% Load in keyval package. Used for handling parsing of \tocdetails
% This does not provide an overhead as hyperref loads keyval anyway.
% and keyval is just 15 lines of code!
\RequirePackage{keyval}

%% We now require graphicx for icon layout.
\RequirePackage{graphicx}

% Load the eXtensible Metadata Platform package, so that we can include licensing information in our .pdf files.
\RequirePackage{hyperxmp}

% Load the hyperref package. As loaded, it uses the default hpdftex
% driver code; this appears to be fine.  The colors selected are
% chosen so that internal document links (the citations, section
% headings, ...) are orange and external document links (e.g.,
% files and distant urls) are blue.
\RequirePackage[%
  pagebackref,
  hyperfootnotes=false,
  colorlinks=true,
  urlcolor=externallinkcolor,
  linkcolor=internallinkcolor,
  filecolor=externallinkcolor,
  citecolor=internallinkcolor,
  breaklinks=true,
  pdfstartview=FitH,
  pdfpagelayout=OneColumn]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% IF macro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rather than load the whole ifthen package, we'll use the following macro.
%
% Check if the two arguments expand to the same thing
% MAGIC happens in the \edef which expands #1 and #2 completely first
% Mainly used to check equality of strings
\newcommand{\ifex}[2]{%
   \edef\toc@tmpa{#1}%
   \edef\toc@tmpb{#2}%
   \ifx\toc@tmpa\toc@tmpb
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Define the layout of the page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Our current strategy is maximize text layout area, subject to a
% one-inch lower bound on all margins. A4 pages are 210mmx297mm =
% 597.5ptx845pt; letter pages are 8.5inx11in = 614.3ptx795pt.
% Accounting for 2in=144.5pt total left and right margins leaves 
% us with min(597.5pt,614.3pt)-144.5pt = 453pt of total textwidth. 
% Similarly, we can afford min(845pt,795pt)-144.5pt = 650.5pt of 
% total text height, into which we must pack headers, text, and 
% footers.
\setlength{\voffset}{0pt}
\setlength{\hoffset}{0pt}
\setlength{\textwidth}{453pt}
\setlength{\headheight}{24pt}
\setlength{\headsep}{18pt}
\setlength{\footskip}{30pt}
\setlength{\textheight}{578.5pt}
\setlength{\marginparwidth}{62.27pt}

% Compute side margins to center text horizontally in page.
\newlength{\toc@hpadding}
\setlength{\toc@hpadding}{\paperwidth}
\addtolength{\toc@hpadding}{-2in}
\addtolength{\toc@hpadding}{-\textwidth}
\setlength{\evensidemargin}{.5\toc@hpadding}
\setlength{\oddsidemargin}{.5\toc@hpadding}

% Compute top margin to center virtual header/footer textbox.
\newlength{\toc@documentheight}
\newlength{\toc@vpadding}
\setlength{\toc@documentheight}{\textheight}
\addtolength{\toc@documentheight}{\footskip}
\addtolength{\toc@documentheight}{\headsep}
\addtolength{\toc@documentheight}{\headheight}
\setlength{\toc@vpadding}{\paperheight}
\addtolength{\toc@vpadding}{-\toc@documentheight}
\addtolength{\toc@vpadding}{-2in}
\setlength{\topmargin}{.5\toc@vpadding}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Values of parameters related to the journal, section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\toc@doiderefaddress{http://dx.doi.org/}
\newcommand\toc@journalname{Theory of Computing}
\newcommand\toc@journaldoiaddress{\toc@doiderefaddress\toc@journaldoi}
\newcommand\toc@journaladdress{www.theoryofcomputing.org}
\newcommand\toc@journaldoi{10.4086/toc}

% License addresses:
\newcommand{\toc@cclicenseurl}{http://creativecommons.org/licenses/by/3.0/}
\newcommand{\toc@licenseurl}{http://theoryofcomputing.org/copyright2009.html}

% Data for tocadjust's bibliography hyperref:
%\newcommand\toc@homepage{http://theoryofcomputing.org}
%\newcommand\toc@sectionname{main}

% Initialize properties to default value
\newcommand{\toc@year}{\@empty}
\newcommand{\toc@volume}{\@empty}
\newcommand{\toc@number}{\@empty}
\newcommand{\toc@received}{\@empty}
\newcommand{\toc@published}{\@empty}
\newcommand{\toc@revised}{\@empty}
\newcommand{\toc@declaredfirstpage}{\@empty}
\newcommand{\toc@doi}{\@empty}
\newcommand{\toc@url}{\@empty}

%%% The rest of this part establises the hookds for the \tocdetails command.
\define@key{tocdet}{year}{\renewcommand{\toc@year}{#1}}
\define@key{tocdet}{volume}{\renewcommand{\toc@volume}{#1}}
\define@key{tocdet}{number}{\renewcommand{\toc@number}{#1}}
\define@key{tocdet}{received}{\renewcommand{\toc@received}{#1}}
\define@key{tocdet}{published}{\renewcommand{\toc@published}{#1}}
\define@key{tocdet}{revised}{\renewcommand{\toc@revised}{#1}}
\define@key{tocdet}{firstpage}{\renewcommand{\toc@declaredfirstpage}{#1}}
\define@key{tocdet}{doi}{\renewcommand{\toc@doi}{#1}}
\define@key{tocdet}{url}{\renewcommand{\toc@url}{#1}}

% argument is a comma seperated list of the type "volume=6,year=8,..."
% If we have details of section we are interested in, process it
\newcommand{\tocdetails}[1]{\setkeys{tocdet}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Default values for Article META Information 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\toc@copyrightauthor{by the author(s)}
\newcommand\toc@runningauthor{}
\newcommand\toc@runningtitle{}
\newcommand\toc@firstpage{\getpagerefnumber{FirstPage}}
\newcommand\toc@lastpage{\getpagerefnumber{LastPage}}
% The next four are set in frontmatter environment
\newcommand\toc@authors\@empty
\newcommand\toc@acmclassification{{\color{red} ADD ACM
CLASSIFICATIONS!}}
\newcommand\toc@amsclassification{{\color{red} ADD AMS
CLASSIFICATIONS!}}
\newcommand\toc@keywords{{\color{red} ADD KEYWORDS!}}
\newcommand\toc@pdftitle{PDF Title}
\newcommand\toc@pdfauthor{PDF Author}

% New Boxes
\newbox\toc@abstract % To store the abstract
\newbox\toc@dedication % To store the abstract

% Authors counter
\newcounter{toc@numauthors}
\setcounter{toc@numauthors}{0}

% Define parameter passing functions for author metadata.
\newcommand*{\copyrightauthor}[1]{%
    \renewcommand\toc@copyrightauthor{#1}}
\newcommand*{\runningauthor}[1]{%
    \renewcommand\toc@runningauthor{#1}}
\newcommand*{\runningtitle}[1]{%
    \renewcommand\toc@runningtitle{#1}}
\newcommand{\tocpdftitle}[1]{\renewcommand{\toc@pdftitle}{#1}}
\newcommand{\tocpdfauthor}[1]{\renewcommand{\toc@pdfauthor}{#1}}

% Embed license data in the xmp block.
\hypersetup{%
 pdfcopyright={This document is licensed under a Creative Commons Attribution 3.0 license},%
  pdflicenseurl={\toc@cclicenseurl}}

% Embed remaining data after user has set it in preamble.
\AtBeginDocument{%
  \hypersetup{%
    pdfauthor=\toc@pdfauthor,%
    pdftitle=\toc@pdftitle,%
    pdfsubject=\toc@journalname}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Copyright box
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define copyright text.
%% Determine exterior and interion widths for the copyright box.
\newlength\toc@crboxheight
\newlength\toc@cciconheight
\newlength\toc@copyrighticonheight

\setlength\toc@crboxheight{3.5ex}
\setlength\toc@cciconheight{6pt}
\setlength\toc@copyrighticonheight{\toc@cciconheight}

\newcommand{\toc@crlayout}[1]{\fontsize{8}{9}\usefont{OT1}{ptm}{m}{n}\selectfont{#1}}

%% If there is no year, layout copyright line apropriately.
\newcommand{\toc@conditionalyearlayout}{\ifex{\toc@year}{\@empty}{}\else{\toc@crlayout{\toc@year~}}\fi}

%% Set up text-based copyright/cc icons as a fallback.
\newcommand{\toc@ccicon@pdf}[1]{\raisebox{-.1#1}{\includegraphics[height=#1]{toc-cc.pdf}}}
\newcommand{\toc@ccicon@text}[1]{\toc@crlayout{$\bigcirc$\hspace{-6.6pt}\raisebox{.5pt}{\tiny{cc}}\hspace{1.5pt}}}
\IfFileExists{toc-cc.pdf}{\newcommand{\toc@ccicon}{\toc@ccicon@pdf}}{\newcommand{\toc@ccicon}{\toc@ccicon@text}}

\newcommand{\toc@copyrighticon@pdf}[1]{\raisebox{-.1#1}{\includegraphics[height=#1]{toc-copyright.pdf}}}
\newcommand{\toc@copyrighticon@text}[1]{\toc@crlayout{\copyright}}
\IfFileExists{toc-copyright.pdf}{\newcommand{\toc@copyrighticon}{\toc@copyrighticon@pdf}}{\newcommand{\toc@copyrighticon}{\toc@copyrighticon@text}}

\newcommand{\toc@jlicensestatement}{\href{\toc@cclicenseurl}{\toc@ccicon{\toc@cciconheight}~\toc@crlayout{Licensed under a Creative Commons Attribution License}}}
\newcommand{\toc@acopyrightstatement}{\toc@crlayout{\href{\toc@licenseurl}{\toc@copyrighticon{\toc@copyrighticonheight}~\toc@conditionalyearlayout\toc@copyrightauthor}}}
\newcommand{\toc@doitext}{\ifex{\toc@doi}{\@empty}{}\else{\toc@crlayout{\href{\toc@doiderefaddress\toc@doi}{DOI:~\toc@doi}}}\fi}

\newcommand{\toc@copyrightbox}
{\parbox[b][\toc@crboxheight]{\textwidth}{%
\hrule \vfill
\toc@acopyrightstatement \hfill \par
\toc@jlicensestatement \hfill \toc@doitext}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Hyperlinking setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set up hyperlink colors.
\definecolor{weborange}{rgb}{.8,.3,.3}
\definecolor{webblue}{rgb}{0,0,.8}
\definecolor{internallinkcolor}{rgb}{0,.5,0}
\definecolor{externallinkcolor}{rgb}{0,0,.5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Title page components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% If the toccomment class is loaded, it will reset this command to show the comment (sub-)banner:
\newcommand{\toc@bannerjournalname}%
          {\fontsize{11}{13}\usefont{OT1}{ptm}{m}{sc}{\href{\toc@journaldoiaddress}{\toc@journalname}}}

\newcommand\toc@bannertexta%
{\href{\toc@journaldoiaddress}{\toc@bannerjournalname}}
 
\newcommand\toc@bannertextb%
           {\fontsize{11}{13}\usefont{OT1}{ptm}{m}{it}
            \selectfont{\toc@journaladdress}}

\newlength{\toc@bannerwidth}
\setlength{\toc@bannerwidth}{\textwidth}
\addtolength{\toc@bannerwidth}{-2cm}
\newcommand{\toc@banner}{\toc@titlepagehook%
  \begin{minipage}{\toc@bannerwidth}%
    \centering \toc@bannertexta\\ \toc@bannertextb\\
   \vspace{2mm} \hrule\vspace{1pt}\hrule%
  \end{minipage}}
  
% Define the date box. If \toc@received is
% undefined, this will simply print
% the current date, as does the article class.
\newcommand\toc@reviseddatelayout{\ifex\toc@revised\@empty{}\else{revised: \toc@revised; }\fi}
\newcommand\toc@datelayout%
{\fontsize{10}{12}\usefont{OT1}{ptm}{m}{sl}\selectfont%
  \ifex{\toc@received}{\@empty}{\@date}%
  \else%
  {{Received: \toc@received; %
   \toc@reviseddatelayout%
    published: \toc@published.}}%
  \fi}

%% Setup classification box.
\newcommand\toc@classificationbox{%
 \parbox[t]{\textwidth}{%
  \noindent \textbf{ACM Classification: }\toc@acmclassification 
  \par \medskip
  \noindent \textbf{AMS Classification: }\toc@amsclassification 
  \par \medskip
  \noindent \textbf{Key words and phrases: }\toc@keywords \par}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% This defines the footer running citation. We must produce two versions of it, the one without links is used
%% to determines spacing; the other is actually used for layout.

\newcommand\toc@runningcitation%
{\href{\toc@journaldoiaddress}{\textsc{\toc@journalname}}}

\newcommand\toc@runningcitation@nolink%
{\textsc{\toc@journalname}}

% Header layout wrapper.
\newcommand\toc@headerlayout[1]
   {\fontsize{10}{12}\usefont{OT1}{ptm}{m}{sc}\selectfont{#1}}
\newcommand\toc@footerlayout[1]
   {\fontsize{10}{12}\usefont{OT1}{ptm}{m}{n}\selectfont{#1}}

% Set up title page style.
\newcommand{\ps@titlepage}{%
  \renewcommand{\@oddhead}{\@empty}%
  \renewcommand{\@evenhead}{\@empty}%
  \renewcommand{\@oddfoot}{\toc@copyrightbox\hfil}%
  \renewcommand{\@evenfoot}{\toc@copyrightbox\hfil}%
}

% Set up the 2ff. page style.
\renewcommand{\ps@headings}{%
\renewcommand{\@oddhead}
             {\hfil\toc@headerlayout{\toc@runningtitle}\hfil}%    
\renewcommand{\@evenhead}
             {\hfil\toc@headerlayout{\toc@runningauthor}\hfil}%
\renewcommand{\@oddfoot}
             {\hfil\toc@footerlayout{\toc@runningcitation}\hfil
\normalfont\thepage}%
\renewcommand{\@evenfoot}
             {\hfil\toc@footerlayout{\toc@runningcitation}\hfil
\normalfont\thepage}%
}

%% Determine actual footer height.
\newlength\toc@footerheight
\settoheight\toc@footerheight{\toc@footerlayout{\toc@runningcitation@nolink}}

%% Determine titlepage text area.
\newlength\toc@titlepagecorrection
\setlength\toc@titlepagecorrection\toc@crboxheight
\addtolength\toc@titlepagecorrection{-\toc@footerheight}

%% Adjust the textheight of first page to allow for the large footer
%% that we will place.
\newcommand{\toc@titlepagehook}{\label{FirstPage}%
  \enlargethispage{-\toc@titlepagecorrection}}

% Define the default page style to be headings.
\pagestyle{headings}
\pagenumbering{arabic}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: New Maketitle macro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (Re)define maketitle for ToC. These are lifted
% directly from article.cls.
\if@titlepage
\newcommand\toc@maketitle{\begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \begin{center}%
      \toc@banner%
    \end{center}%
    \null\vfil
    \vskip 40\p@
    \begin{center}%
      {\Huge \@title \par}%
      \vskip 3em%
      {\Large
        \lineskip .75em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
      \vskip 1.5em%
      {\toc@datelayout \par}%
    \end{center}\par
    \@thanks
    \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\toc@maketitle{\par
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \if@twocolumn
  \ifnum \col@number=\@ne
  \@maketitle
  \else
  \twocolumn[\@maketitle]%
  \fi
  \else
  \newpage
  \global\@topnum\z@   % Prevents figures from going at top of page.
  \@maketitle
  \fi
  \thispagestyle{titlepage}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \begin{center}%
    \toc@banner%
  \end{center}%
  \null
  \vskip 2em%
  \begin{center}%
    \let \footnote \thanks
    {\Huge \@title \par}%
    \vskip 1.5em%
    {\Large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
       \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\toc@datelayout}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Frontmatter and related macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{frontmatter}[1][]{
 
 % Default position is to float
 \newcommand{\toc@floatclass}{float}
 \define@key{frontmatter}{classification}{\renewcommand{\toc@floatclass}{##1}}
 \setkeys{frontmatter}{#1}

 %Define dedication environment
 \newenvironment{dedication}{%
  \global\setbox\toc@dedication=\vbox\bgroup
  \leftskip 1cm \rightskip 1cm
  \noindent \itshape % Dedication is set in italics.
}{\par \bigskip\egroup} % End of definition of dedication

 %Define abstract environment
 \renewenvironment{abstract}{%
  \global\setbox\toc@abstract=\vbox\bgroup
  \leftskip 1cm \rightskip 1cm
  \noindent {\bfseries Abstract:}  % caption `Abstract' (bold)
 }{\par \bigskip\egroup} % End of definition of abstract

 %(Re)Define Author environment
 \let\orig@author\author % Store original \author commannd
 \renewcommand{\author}[2][\@empty]{% Optional Nick name
   \addtocounter{toc@numauthors}{1} % Increment number of authors
   \ifnum 1=\value{toc@numauthors} % This is the first author
     \ifx##1\@empty
       \gdef\toc@authors{##2}
     \else
       \gdef\toc@authors{\hyperlink{author.info.##1}{##2}}
     \fi
   \else
     \ifx##1\@empty
       \g@addto@macro\toc@authors{\and ##2}
     \else
       \g@addto@macro\toc@authors{%
         \and \hyperlink{author.info.##1}{##2}}
     \fi
   \fi
 }

 % Define tocacm, tocams, tockeywords commands
 \newcommand{\tocams}[1]{\renewcommand{\toc@amsclassification}{##1}}
 \newcommand{\tocacm}[1]{\renewcommand{\toc@acmclassification}{##1}}
 \newcommand{\tockeywords}[1]{\renewcommand{\toc@keywords}{##1}}
}{ %
\ifnum \value{toc@numauthors}=0
    \renewcommand{\toc@authors}{{\color{red} No Authors Defined}}
\fi

\hypersetup{pdfkeywords={\toc@keywords}}

\orig@author{\toc@authors}
\toc@maketitle
\bigskip
\ifex\toc@floatclass{float} % Typeset classification as float
  \begin{figure}[!b]
    \toc@classificationbox
  \end{figure}
\fi
%
\unvbox\toc@dedication
\unvbox\toc@abstract

\ifex\toc@floatclass{text} % Typeset as usual
\noindent
  \toc@classificationbox
\fi

% Undefine keywords, abstract
\let\author\relax
\let\abstract\relax
\let\dedication\relax
\let\tocacm\relax
\let\tocams\relax
\let\tockeywords\relax
} % End of Frontmatter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Theorem Environments and \ref-like macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generic hyperref construct
\newcommand{\expref}[2]{\hyperref[#2]{#1~\ref{#2}}}

% Hyperref variants
\newcommand{\secref}[1]{\hyperref[#1]{Section~\ref{#1}}}
\newcommand{\subsecref}[1]{\hyperref[#1]{Section~\ref{#1}}}

% Theorems, lemmata, corollaries, etc. are interleaved 
% and numbered by section.

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
%\newtheorem{lemma}[theorem]{Lemma}
%\newtheorem{corollary}[theorem]{Corollary}
%\newtheorem{claim}[theorem]{Claim}
%\newtheorem{proposition}[theorem]{Proposition}
%\newtheorem{fact}[theorem]{Fact}
%\newtheorem{conjecture}[theorem]{Conjecture}

% JJF 12 January 2012 - Need to do some black magic to get autoref names.

\newaliascnt{lemma}{theorem}
\newtheorem{lemma}[lemma]{Lemma}
\aliascntresetthe{lemma}

\newaliascnt{claim}{theorem}
\newtheorem{claim}[claim]{Claim}
\aliascntresetthe{claim}

\newaliascnt{corollary}{theorem}
\newtheorem{corollary}[corollary]{Corollary}
\aliascntresetthe{corollary}

\newaliascnt{proposition}{theorem}
\newtheorem{proposition}[proposition]{Proposition}
\aliascntresetthe{proposition}

\newaliascnt{fact}{theorem}
\newtheorem{fact}[fact]{Fact}
\aliascntresetthe{fact}

\newaliascnt{conjecture}{theorem}
\newtheorem{conjecture}[conjecture]{Conjecture}
\aliascntresetthe{conjecture}

% Definition style theorem like environments
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{acknowledgement}[theorem]{Acknowledgement}
\newtheorem{axiom}[theorem]{Axiom}
\newtheorem{case}[theorem]{Case}
\newtheorem{conclusion}[theorem]{Conclusion}
\newtheorem{condition}[theorem]{Condition}
\newtheorem{criterion}[theorem]{Criterion}
\newtheorem{exercise}[theorem]{Exercise}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{problem}[theorem]{Problem}
\newtheorem{solution}[theorem]{Solution}
\newtheorem{summary}[theorem]{Summary}

% Algorithms are numbered separately.
\newtheorem{algorithm}{Algorithm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Predefined Math Symbols
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Predefined common number systems.
% JJF 12 January 2012 - Commented \C because it is used in complexity.sty.
%\newcommand{\C}{{\mathbb C}}
\newcommand{\R}{{\mathbb R}}
\newcommand{\Q}{{\mathbb Q}}
\newcommand{\Z}{{\mathbb Z}}
\newcommand{\N}{{\mathbb N}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Predefined Abbreviations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ie}{i.\,e.}
\newcommand{\eg}{e.\,g.}
\newcommand{\Eg}{E.\,g.}
\newcommand{\phd}{Ph.\,D.}
\newcommand{\msc}{M.\,S.}
\newcommand{\bsc}{B.\,S.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: \tocauthor and \tocaboutauthor environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Predefined e-mail punctuation.
\IfFileExists{tocat.png}{%
  \newcommand{\tocat}{\includegraphics[scale=0.0234]{tocat}}}{%
  \newcommand{\tocat}{ [at] }}
\IfFileExists{tocdot.png}{%
  \newcommand{\tocdot}{\includegraphics[scale=0.0234]{tocdot}}}{%
  \newcommand{\tocdot}{ [dot] }}

% Only have the plural version. Singular version will be an
% alternate name for the plural version. Environment will know
% whether to use plural or not based on the number of authors
% given

\newenvironment{tocauthors}{ % Beginning of environment

                     % Initialise an empty tocabout command
\newcommand{\tocabout}{\@empty}  

% Define tocinfo environment
 \newenvironment{tocinfo}[1][\@empty]{%
  \begin{verse}
  % Redefine \tocabout command for the author if nickname given
  \ifx##1\@empty
     \renewcommand{\tocabout}{\@empty}
  \else
     \renewcommand{\tocabout}%
                  {\hyperlink{author.about.##1}%
                  {\small [About the author]}}
  \fi
  \ifx##1\@empty\relax\else\hypertarget{author.info.##1}{}\fi
 }{% End of environment
\end{verse} \filbreak
} % End of tocinfo

\filbreak % Prefer a page break here rather than later
\bigskip\noindent
\ifnum \value{toc@numauthors}>1
   \textsf{AUTHORS}
\else
   \textsf{AUTHOR}
\fi
}{%
\let\tocinfo\relax % Undefine tocinfo
\let\tocabout\relax
}
%  end tocauthors environment

% singular is another name for plural
\newenvironment{tocauthor}{\begin{tocauthors}}{\end{tocauthors}}

\newenvironment{internal@tocaboutauthors}{ % Beginning of environment
 \newenvironment{tocabout}[1][\@empty]{%
  \begin{verse}
  \if##1\@empty\relax\else\hypertarget{author.about.##1}{}\fi
 }{%
\end{verse}\filbreak
}

\filbreak % Prefer a page break here rather than later
\bigskip\noindent
\ifnum \value{toc@numauthors}>1
  \textsf{ABOUT THE AUTHORS}
\else
  \textsf{ABOUT THE AUTHOR}
\fi
}{% end tocaboutauthors environment
\let\tocabout\relax
}
%  end tocaboutauthors environment

\newenvironment{tocaboutauthor}
               {\begin{tocaboutauthors}}{\end{tocaboutauthors}}
\newenvironment{tocaboutauthors}
               {\begin{internal@tocaboutauthors}}{\end{internal@tocaboutauthors}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Things to do at the start and end of document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndOfClass{% Include eprint support, check for existence of custom icons.
\IfFileExists{eprint.sty}{\RequirePackage{eprint}}{%
\ClassWarningNoLine{tocbase}{No eprint support detected}}
\IfFileExists{toc-cc.pdf}{}{\ClassWarningNoLine{tocbase}{No Creative Commons symbol (toc-cc.pdf) found}}
\IfFileExists{toc-copyright.pdf}{}{\ClassWarningNoLine{tocbase}{No copyright symbol (toc-copyright.pdf) found}}
\IfFileExists{tocat.png}{}{\ClassWarningNoLine{tocbase}{No graphic '@' symbol (tocat.png) found}}
\IfFileExists{tocdot.png}{}{\ClassWarningNoLine{tocbase}{No graphic '.' symbol (tocdot.png) found}}
}

\AtBeginDocument{%
  \ifex\toc@declaredfirstpage\@empty
  \else
  \setcounter{page}{\toc@declaredfirstpage}
  \fi
}

\AtEndDocument{%
  \ifex\toc@declaredfirstpage\@empty
  {\ClassWarningNoLine{tocbase}{Use the firstjournalpage command to
      insure that page numbers match journal}}
  \else  % If not empty we assume it is a number
  \ifodd\toc@declaredfirstpage
  \else
  {\ClassWarningNoLine{tocbase}{Starting page number
      (\toc@declaredfirstpage) is not odd}}
  \fi   
  \fi
}
