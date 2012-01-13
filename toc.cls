%% toc.cls 2.27   3-25-2009    ToC style file
%------------------------------------------------------------------
% Filename: toc.cls
%
% This documentclass is intended for typesetting articles for the
%
%                        Theory of Computing.
%
% See http://theoryofcomputing.org for further details.
%
% Search for ``%%% PART'' to find the main parts of this class file.

%% Version 2.26 fixes compilation advertisements.
%% Version 2.27 adds support for ToC NOTE and establishes
%% \numberwithin{equation}{section} only for regular (long-form)
%% submissions; equation numbering for comments, notes is
%% linear. Reinstated backreferencing in the bibliography, as it now
%% points to page numbers.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Declare class and load external packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Need this version of LaTeX atleast (for ClassWarning commands)
\NeedsTeXFormat{LaTeX2e}[1994/06/01] 
\ProvidesClass{toc}[2009/05/18 v2.27 Theory of Computing]

\DeclareOption{comment}{%
  \AtEndOfClass{\renewcommand\toc@bannermodifier%
    {\vspace{1em}{{\fontsize{16}{18}\usefont{OT1}{phv}{m}{n}\selectfont{COMMENT}}}%
      \par \vspace{1em} \hrule \vspace{1pt} \hrule}%
    \renewenvironment{tocaboutauthors}%
    {\ClassWarning{toc}{Use of ABOUT THE AUTHORS discouraged in ToC Comments.}\begin{internal@tocaboutauthors}}%
      {\end{internal@tocaboutauthors}}}%
  %% \renewcommand*{\backref}[1]{} % shuts down back referencing in the bibliography.
  \renewcommand{\toc@shortformarticle}{comment}
}

\DeclareOption{note}{%
  \AtEndOfClass{\renewcommand\toc@bannermodifier%
    {\vspace{1em}{{\fontsize{16}{18}\usefont{OT1}{phv}{m}{n}\selectfont{NOTE}}}%
      \par \vspace{1em} \hrule \vspace{1pt} \hrule}%
    \renewenvironment{tocaboutauthors}%
    {\ClassWarning{toc}{Use of ABOUT THE AUTHORS discouraged in ToC Notes.}\begin{internal@tocaboutauthors}}%
      {\end{internal@tocaboutauthors}}}%
  %% \renewcommand*{\backref}[1]{}  % shuts down back referencing in the bibliography.
  \renewcommand{\toc@shortformarticle}{note}
}

% Pass all options along to tocbase:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tocbase}}

\newcommand{\toc@shortformarticle}{\@empty}

\ProcessOptions\relax
% Now load article class and handle options.
\LoadClass{tocbase}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Title page components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\toc@bannermodifier{\relax}%

\newcommand{\toc@bannerpubdata}
           {\fontsize{11}{13}\usefont{OT1}{ptm}{m}{n}\selectfont
            {,\ Volume \toc@volume\ (\toc@year), 
              pp. \toc@firstpage--\toc@lastpage}}

\renewcommand\toc@bannertexta%
{\ifex\toc@volume\@empty
  \toc@bannerjournalname
 \else
  \toc@bannerjournalname\toc@bannerpubdata
 \fi}

\setlength{\toc@bannerwidth}{\textwidth}
\addtolength{\toc@bannerwidth}{-2cm}
\renewcommand{\toc@banner}{\toc@titlepagehook%
  \begin{minipage}{\toc@bannerwidth}%
    \centering \toc@bannertexta\\ \toc@bannertextb\\
    \vspace{2mm} \hrule\vspace{1pt}\hrule%
    \toc@bannermodifier
  \end{minipage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\toc@runningcitation%
{\ifex\toc@volume\@empty
  \href{\toc@journaldoiaddress}{\textsc{\toc@journalname}}
 \else
  \href{\toc@journaldoiaddress}{\textsc{\toc@journalname}}, Volume \toc@volume\ (\toc@year),
    pp. \toc@firstpage--\toc@lastpage
 \fi
}
%% These two must be identical, save for the hyperlinks.
\renewcommand\toc@runningcitation@nolink%
{\ifex\toc@volume\@empty
  \textsc{\toc@journalname}
 \else
  \textsc{\toc@journalname}, Volume \toc@volume\ (\toc@year),
    pp. \toc@firstpage--\toc@lastpage
 \fi
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
\settoheight\toc@footerheight{\toc@footerlayout{\toc@runningcitation@nolink}}

%% Determine titlepage text area.
\setlength\toc@titlepagecorrection\toc@crboxheight
\addtolength\toc@titlepagecorrection{-\toc@footerheight}

% Define the default page style to be headings.
\pagestyle{headings}
\pagenumbering{arabic}

% Set up numbering within sections for long form articles.
{\ifex{\toc@shortformarticle}{\@empty}{\numberwithin{equation}{section}}\else{}\fi}