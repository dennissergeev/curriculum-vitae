% Intro Options
\ProvidesClass{deedy-resume-openfont}[2018/01/11 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry}
\usepackage[hidelinks]{hyperref}
% \usepackage{hyperref}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\usepackage[usenames,dvipsnames]{xcolor} 
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

% Set main fonts
\usepackage{fontspec}
\setmainfont[Color=primary, Mapping=tex-text, Path=fonts/exo2/, BoldItalicFont=Exo2-BoldItalic, BoldFont=Exo2-Medium, ItalicFont=Exo2-LightItalic]{Exo2-Light}
% \setsansfont[Scale=MatchLowercase, Mapping=tex-text, Path=fonts/exo2/]{Exo2-Regular}
\usepackage{xltxtra}
\usepackage{xunicode}

% Numbering
\usepackage{etaremune}

% Date command
\usepackage{datetime}
\newdateformat{mydate}{\shortmonthname[\THEMONTH] \THEYEAR}
\usepackage[absolute]{textpos}
%\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(5,275)
\color{date}\fontspec[Path = fonts/exo2/]{Exo2-ExtraLight}\fontsize{8pt}{10pt}\selectfont 
Last updated: \mydate\today
\end{textblock}
}

% Name command
\newcommand{\namesection}[3]{
\centering{
\fontsize{40pt}{60pt}
\fontspec[Path=fonts/exo2/]{Exo2-Light}\selectfont #1 
\fontspec[Path=fonts/exo2/]{Exo2-Light}\selectfont #2
} \\[5pt]
\centering{
\color{headings}
\fontspec[Path=fonts/exo2/]{Exo2-Medium}\fontsize{11pt}{14pt}\selectfont #3}
\noindent\makebox[\linewidth]{\color{headings}\rule{\paperwidth}{0.4pt}}
\vspace{-15pt}
}

% Section seperators 
\usepackage{titlesec}
\titlespacing{\section}{0pt}{3pt}{1pt} 
\titlespacing{\subsection}{0pt}{2pt}{1pt}
\newcommand{\sectionsep}{\vspace{5pt}}

% Text separator
\newcommand{\customsep}{~\textbullet{}~}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec[Path=fonts/exo2/]{Exo2-Thin}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{\raggedright
\color{subheadings}\fontspec[Path=fonts/exo2/]{Exo2-Light}\fontsize{12pt}{12pt}\selectfont\scshape}{}{0em}{}

\newcommand{\runsubsection}[1]{\raggedright
\color{subheadings}\fontspec[Path=fonts/exo2/]{Exo2-SemiBold}\fontsize{10pt}{10pt}\selectfont\uppercase{#1}\normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontspec[Path=fonts/exo2/]{Exo2-Medium}\fontsize{9pt}{11pt}\selectfont {#1} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path=fonts/exo2/]{Exo2-Medium}\fontsize{10pt}{12pt}\selectfont {#1 \\} \normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{0pt}
\begin{itemize}\itemsep0.5pt \parskip0pt \parsep0pt}
{\end{itemize}} %\vspace{-\topsep}}

% multi columns
\usepackage{multicol}
\newcommand{\ncol}[2]{%
\vspace{-\topsep}
\begin{multicols}{#1}#2\end{multicols}%
\vspace{-\topsep}
}

% Symbols from font-awesome
\usepackage{fontawesome}
\newcommand{\mobilephonesymbol}   {{\Large\faMobilePhone}~}
\newcommand{\fixedphonesymbol}    {\faPhone~}
\newcommand{\emailsymbol}         {\faEnvelope~}           % alternative: \faInbox
\newcommand{\homepagesymbol}      {\faGlobe~}              % alternative: \faHome
\newcommand{\twittersymbol} {\faTwitter~}
\newcommand{\githubsymbol}  {\faGithub~}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@initializelength}[1]{%
  \ifdefined#1
  \else%
    \newlength{#1}\fi%
  \setlength{#1}{0pt}}

\@initializelength{\hintscolumnwidth}     \setlength{\hintscolumnwidth}{0.110\textwidth}
\@initializelength{\separatorcolumnwidth} \setlength{\separatorcolumnwidth}{0.010\textwidth}
\@initializelength{\maincolumnwidth}      \setlength{\maincolumnwidth}{0.88\textwidth}
%% commands
%\newcommand*{\recomputecvbodylengths}{%
%  % body lengths         
%  \setlength{\separatorcolumnwidth}{200pt}    % {0.025\textwidth}
%  \setlength{\maincolumnwidth}{\textwidth-\leftskip-\rightskip-\separatorcolumnwidth-\hintscolumnwidth}%
%  % regular lengths
%  \setlength{\parskip}{0\p@}}
%
%\newcommand*{\recomputecvlengths}{%
%  \recomputecvbodylengths%
%  }
%
%\newcommand*{\recomputelengths}{\recomputecvlengths}
%\AtBeginDocument{\recomputelengths}
% creates a length if not yet defined
\newcommand*{\cvitem}[3][.25em]{%
  \begin{tabular}{@{}p{\hintscolumnwidth}@{\hspace{\separatorcolumnwidth}}p{\maincolumnwidth}@{}}%
    \raggedleft #2 &{#3}%
  \end{tabular}%
  \par\addvspace{#1}}

\newcommand*{\cventry}[8][.25em]{%
  \cvitem[#1]{#2}{%
    {\bfseries#3}%
    \ifthenelse{\equal{#4}{}}{}{ | #4}%
    \ifthenelse{\equal{#5}{}}{}{ | #5}%
    \ifthenelse{\equal{#6}{}}{}{ | #6}%
    \strut%
    \ifx&#7&%
    \else{\newline{}\begin{minipage}[t]{\linewidth}\small#7\end{minipage}}\fi%
    \ifx&#8&%
    \else{\newline{}\begin{minipage}[t]{\linewidth}\small#8\end{minipage}}\fi%
}}

