% ----------------------------------------------------------------------------------------
% Document class for Sedimentologika, a community-driven Diamond Open Access journal publishing research in sedimentology and stratigraphy.
% https://oap.unige.ch/journals/sdk/
% Current version with inputs from:
% Jarred C Lloyd
% Last updated:
% Derived from seismica.cls, and WeAreAGC submission template.

% ----------------------------------------------------------------------------------------
% Class declaration and switches
% ----------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sedimentologika}[2025-112-02 Sedimentologika LaTeX class]

\newif\if@onecolumn
\@onecolumnfalse
\DeclareOption{onecolumn}{\@onecolumntrue}

\newif\if@preprint
\@preprintfalse
\DeclareOption{preprint}{\@preprinttrue}

\newif\if@submission
\@submissionfalse
\DeclareOption{submission}{\@submissiontrue}

\newif\if@proof
\@prooffalse
\DeclareOption{proof}{\@prooftrue}

\newif\if@publication
\@publicationfalse
\DeclareOption{publication}{\@publicationtrue}

\newif\if@anonymous
\@anonymousfalse
\DeclareOption{anonymous}{\@anonymoustrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\if@submission
\@onecolumntrue
\LoadClass[10pt, a4paper, onecolumn]{article}
\else
\LoadClass[10pt, a4paper, twocolumn]{article}
\setlength{\columnsep}{8mm}
\fi

% ----------------------------------------------------------------------------------------
% General Packages
% ----------------------------------------------------------------------------------------
\RequirePackage[mode=match, unit-mode=match,range-units=single]{siunitx}
\RequirePackage{xcolor}
\RequirePackage[scale=2]{ccicons}
\RequirePackage{simpleicons}
\RequirePackage{amsmath}
\RequirePackage{commath}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{multirow}[longtable]
\RequirePackage{arydshln}
\RequirePackage{nicematrix}
\RequirePackage{ragged2e}
\RequirePackage{graphics}
\RequirePackage[version=4]{mhchem}
\RequirePackage{caption}
\RequirePackage{textgreek}
\RequirePackage{titling}
\RequirePackage[noblocks]{authblk}
\RequirePackage{titlesec}
\RequirePackage[stamp=false, color={[gray]{0.9}}, fontsize=72pt]{draftwatermark}
\RequirePackage[english, bidi=basic, provide*=*]{babel}
\RequirePackage[babel=true, nopatch=footnote]{microtype}
\RequirePackage[style=iso]{datetime2}
\RequirePackage{citation-style-language}
\RequirePackage{orcidlink}
\RequirePackage{url}
\RequirePackage{doi}
\RequirePackage{pdflscape}
% \RequirePackage{afterpage}
\RequirePackage{hyperref}
\RequirePackage{setspace}
\RequirePackage{datatool}
\RequirePackage[absolute, quiet]{textpos}
\RequirePackage{changepage}
\RequirePackage[thepage, savepos]{zref}
\RequirePackage{hyperxmp}
\RequirePackage[hmargin=15mm, vmargin=20mm, headsep=1mm, footskip=6mm]{geometry}
\RequirePackage[parfill, skip={\baselinestretch}]{parskip}
\RequirePackage{fancyhdr}

\if@submission
\cslsetup{style=apa, bib-item-sep = 8 pt plus 4 pt minus 2 pt}
\else
\cslsetup{style=apa,
  bib-font=\linespread{1}\footnotesize,
bib-item-sep = 8 pt plus 4 pt minus 2 pt}
\fi

\definecolor{SedK1}{HTML}{06595a} % #06595a
\definecolor{SedK2}{HTML}{086162} % #086162
\definecolor{SedK3}{HTML}{0a696a} % #0a696a
\definecolor{SedK4}{HTML}{0c7172} % #0c7172
\definecolor{SedkGrey}{HTML}{5E5E5E} % #5E5E5E

% ----------------------------------------------------------------------------------------
%  Custom commands
% ----------------------------------------------------------------------------------------
% \renewcommand{\@maketitle}{
%   \newpage
%   \null
%   \begin{RaggedRight}
%     \let \footnote \thanks {\LARGE \@title \par }
%     \vskip 1.5em
%     {\large \lineskip .5em
%       \begin{tabular}[t]{l}
%         \@author
%     \end{tabular}\par}
%     \vskip 1em
%     {\large \@date }
%   \end{RaggedRight}
%   \par
%   \vskip 1.5em
% }

\newcommand{\englishvariety}[1]{\gdef\@englishvariety{#1}}

\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\renewcommand*{\title}[1]{\gdef\@title{#1}}

% Article info
\newcommand{\articletype}[1]{\gdef\@articletype{#1}}
\newcommand{\volumenumber}[1]{\gdef\@volumenumber{#1}}
\newcommand{\issuenumber}[1]{\gdef\@issuenumber{#1}}
\newcommand{\receiveddate}[1]{\gdef\@receiveddate{#1}}
\newcommand{\accepteddate}[1]{\gdef\@accepteddate{#1}}
\newcommand{\publisheddate}[1]{\gdef\@publisheddate{#1}}
\newcommand{\theyear}[1]{\gdef\@theyear{#1}}
\newcommand{\suppmat}[1]{\gdef\@suppmat{#1}}
\newcommand{\articledoi}[1]{\gdef\@articledoi{#1}}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}

% Volunteer names
\newcommand{\execedname}[1]{\gdef\@execedname{#1}}
\newcommand{\assocedname}[1]{\gdef\@assocedname{#1}}
\newcommand{\prodmanname}[1]{\gdef\@prodmanname{#1}}
\newcommand{\copyedname}[1]{\gdef\@copyedname{#1}}
\newcommand{\reviewername}[1]{\gdef\@reviewername{#1}}

\newcommand{\onecolwidth}{86mm}
\newcommand{\twocolwidth}{\textwidth}

\newcommand{\email}[1]{\texttt{\textcolor{SedK4}{\scriptsize #1}}}

% Author stuff
\renewcommand*{\Authsep}{, }
\renewcommand*{\Authand}{ \& }
\renewcommand*{\Authands}{, and }
\renewcommand*{\Authfont}{\bfseries}
\renewcommand*{\Affilfont}{\mdseries\footnotesize}
\setlength{\affilsep}{2mm}

\newcommand{\correspondingauthor}[2]{\gdef\@correspondingauthor{\vskip 0.4em\scriptsize*Corresponding author: #1, \href{mailto:#2}{#2}}}

\NewCommandCopy{\authblkauthor}{\author}

\ExplSyntaxOn
\seq_new:N \g_authors_seq
\RenewDocumentCommand{\author}{om}
{
  \seq_gput_right:Nn \g_authors_seq { #2 }
  \IfNoValueTF { #1 } { \authblkauthor{#2} } { \authblkauthor[#1]{#2} }
}
\NewExpandableDocumentCommand{\ABgetauthor}{m}
{
  \seq_item:Nn \g_authors_seq { #1 }
}
\seq_new:N \g_auth_last
% \NewExpandableDocumentCommand{\ABgetauthorlast}{m}
% {
%   \regex_extract_once:nnN { [\w\-\`\']+$ } { \ABgetauthor{#1} } \g_auth_last
% }LaTex3 regex not working in this context and doesn't support unicode characters
\ExplSyntaxOff

% \newcommand{\authors}{
%   \begingroup
%   \let\footnote\@gobble % ignore \footnote
%   \let\textsuperscript\@gobble % ignore protected \textsuperscript
%   \expandafter\let\csname textsuperscript \endcsname\@gobble
%   \ifnum\value{authors}<3 % one or two authors
%   \AB@authlist % show them all
%   \else % 3 or more authors
%   \ABgetauthorlast{1} et~al.%
%   \fi
%   \endgroup
% } LaTex3 regex not working in this context and doesn't support unicode characters.

\newcommand{\authorshdr}[1]{\gdef\authors{#1}}

% CRediT
\DTLgnewdb{CRediTs}
\newcommand*{\CRediT}[2]{%
  \DTLnewrow{CRediTs}
  \DTLnewdbentry{CRediTs}{credrole}{#1}
  \DTLnewdbentry{CRediTs}{credauthor}{#2}
}

% Table columns
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\RaggedLeft}p{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\RaggedRight}p{#1}}
\newcolumntype{M}[1]{>{\PreserveBackslash\centering}m{#1}}

% cline (var width)
\def\Cline#1#2{\@Cline#1#2\@nil}
\def\@Cline#1-#2#3\@nil{%
  \omit
  \@multicnt#1%
  \advance\@multispan\m@ne
  \ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi
  \@multicnt#2%
  \advance\@multicnt-#1%
  \advance\@multispan\@ne
  \leaders\hrule\@height#3\hfill
  \cr}

\newcommand*{\rot}[1]{\rotatebox[origin=c]{#1}}

% ----------------------------------------------------------------------------------------
%  Custom environments
% ----------------------------------------------------------------------------------------
\renewenvironment{abstract}
{
  \section*{Abstract}%
  \zsavepos{loc:beg_abstract}
  \small
}
{
  \par
  \normalsize
}

\newenvironment{translation}[3]{%
  \begin{otherlanguage}{#1}
    \section*{#2\;}
    \small #3 \vglue 1\baselineskip
  \end{otherlanguage}
}{
  \vskip 2mm
  \par
  \normalsize
}

\newenvironment{plainlanguagesummary}
{
  \section*{Plain language summary}
  \zsavepos{loc:beg_plainlanguagesummary}
  \small
}%
{
  \par
  \normalsize
}

\newenvironment{acknowledgements}
{
  \small
  \section*{Acknowledgements}
}%
{
  \par
  \normalsize
}

\newenvironment{conflictofinterest}
{
  \small
  \section*{Conflict of interest statement}
}%
{
  \par
  \normalsize
}
\newenvironment{artificialintelligence}
{
  \small
  \section*{Artificial intelligence use statement}
}%
{
  \par
  \normalsize
}

\newenvironment{datacode}
{
  \small
  \section*{Data and code availability}
}%
{
  \par
  \normalsize
}

\newenvironment{funding}
{
  \section*{Funding}
  \small
}%
{
  \par
  \normalsize
}

\newenvironment{supplementarymaterial}
{
  \section*{Supplementary material}
  \small
}%
{
  \par
  \normalsize
}

\newenvironment{specialsection}[1]
{
  \section*{#1\;}\textbullet\quad
  \small
}%
{
  \par
  \normalsize
}

\newcommand{\preprintdeclaration}[1]{\gdef\@preprintdeclaration{#1}}
% % -------------------------------------------------------------------------------
% %                information box
% % -------------------------------------------------------------------------------

\newcommand{\promohref}[3][SedK1]{\href{#2}{\color{#1}{#3}}}

\newcommand{\Sedimentologika}{\textcolor{SedK1}{\textit{Sedimentologika}}}

\newcommand{\@insert@preprintdeclaration}{%
  \begin{textblock*}{40mm}[1,0](195mm,\dimexpr\pageheight-3mm-\zposy{loc:beg_plainlanguagesummary}sp\relax)
    \bfseries\raggedleft%
    \setlength{\parskip}{\baselineskip}%
    \setlength{\parindent}{\z@}%
    {This preprint was generated using the}{\\}{\promohref{https://github.com/Sedimentologika/templates}{\textit{Sedimentologika} \\ \LaTeX template}}
    \par
  \end{textblock*}
}

\newcommand{\@insert@metadata}{%
  \begin{textblock*}{40mm}[1,0](195mm,\dimexpr\pageheight-3mm-\zposy{loc:beg_plainlanguagesummary}sp\relax
    )
    \footnotesize
    \linespread{1.3}
    \more@metadata
  \end{textblock*}
}

\newcommand{\printifnotempty}[4]{%
  \ifthenelse{\equal{#3}{}}{}{
    \begin{flushright}
      \bfseries\textcolor{SedK1}{#1}#2\mdseries\textcolor{SedK2}{#3}#4
    \end{flushright}
  }
}

\newcommand{\more@metadata}{%
  \printifnotempty{\mdseries\textcolor{lightgray}{\raisebox{-1.2ex}{\LARGE\simpleicon{openaccess}
  }}}{\enspace}{\bfseries\normalsize\@articletype}{\vspace{3mm}}
  \printifnotempty{Executive Editor}{\par}{\@execedname}{\vspace{3mm}}
  \printifnotempty{Associate Editor}{\par}{\@assocedname}{\vspace{3mm}}
  \printifnotempty{Reviewers}{\par}{\@reviewername}{\vspace{3mm}}
  \printifnotempty{Production Manager}{\par}{\@prodmanname}{\vspace{3mm}}
  \printifnotempty{Copy Editor}{\par}{\@copyedname}{\vspace{3mm}}
  \printifnotempty{Received:}{~}{\@receiveddate}{\par}
  \printifnotempty{Accepted:}{~}{\@accepteddate}{\par}
  \printifnotempty{Published:}{~}{\@publisheddate}{\vspace{4mm}}
  \printifnotempty{\textcolor{SedkGrey}{Keywords}}{\par}{\textcolor{SedkGrey}{\@keywords}}{\par}
}
% ----------------------------------------------------------------------------------------
%  basic formatting, declaration of styles
% ----------------------------------------------------------------------------------------

% \clubpenalty10000
% \widowpenalty10000
% \brokenpenalty10000
% \predisplaypenalty10000
% \postdisplaypenalty10000
% \displaywidowpenalty10000
\hyphenpenalty8000

\renewcommand*{\figureautorefname}{Fig.}
\renewcommand*{\tableautorefname}{Tab.}
\renewcommand*{\equationautorefname}{Eq.}

\frenchspacing
\raggedbottom
\linespread{1.2}

% Typefaces
\RequirePackage{fontspec}
\RequirePackage[math-style=ISO,bold-style=ISO]{unicode-math}

\IfFontExistsTF{Noto Sans}{%
  \babelfont{rm}[%
    BoldFont={NotoSans-VariableFont_wdth,wght},
    ItalicFont={NotoSans-Italic-VariableFont_wdth,wght},
    BoldItalicFont={NotoSans-Italic-VariableFont_wdth,wght},
    Numbers={Proportional,Lining},
    UprightFeatures={Weight=350},
    ItalicFeatures={Weight=350},
    BoldFeatures={Weight=600}
  ]{NotoSans-VariableFont_wdth,wght}
  \babelfont{sf}[%
    BoldFont={NotoSans-VariableFont_wdth,wght},
    ItalicFont={NotoSans-Italic-VariableFont_wdth,wght},
    BoldItalicFont={NotoSans-Italic-VariableFont_wdth,wght},
    Numbers={Proportional,Lining},
    UprightFeatures={Weight=350},
    ItalicFeatures={Weight=350},
    BoldFeatures={Weight=600}
  ]{NotoSans-VariableFont_wdth,wght}
}{\RequirePackage[sfdefault]{noto}}

\IfFontExistsTF{Noto Sans Mono}{%
  \babelfont{tt}[%
    BoldFont={NotoSansMono-VariableFont_wdth,wght},
    Numbers={Proportional,Lining},
    UprightFeatures={Weight=400},
    BoldFeatures={Weight=700}
  ]{NotoSansMono-VariableFont_wdth,wght}
}{\RequirePackage{noto-mono}}

\IfFontExistsTF{Noto Sans Math Regular}{
  \setmathfont{NotoSansMath-Regular}
}{
  \RequirePackage{notomath}
}

\captionsetup{font=small, labelfont=bf, justification=justified, labelsep=endash, skip = 5pt, singlelinecheck=off}

% Section label formatting
\titleformat{name=\section, numberless}{\RaggedRight\fontsize{9pt}{15pt}\bfseries}{}{0em}{}[]
\titleformat{name=\section}{\RaggedRight\fontsize{11pt}{17pt}\bfseries}{\thesection}{0.5em}{}
\titleformat{name=\subsection}{\RaggedRight\fontsize{10pt}{15pt}\bfseries}{\thesubsection}{0.5em}{}
\titleformat{name=\subsubsection}{\RaggedRight\fontsize{10pt}{15pt}\bfseries}{\thesubsubsection}{0.5em}{}

\titlespacing{name=\section, numberless}{0em}{*2}{0.5em}
\titlespacing{name=\section}{0em}{*2}{*1}
\titlespacing{name=\subsection}{0em}{*2}{*1}
\titlespacing{name=\subsubsection}{0em}{*2}{*1}

\setcounter{secnumdepth}{3}

% ----------------------------------------------------------------------------------------
% Fancyhdr styles
% ----------------------------------------------------------------------------------------
\pagestyle{empty}

\if@preprint
\hypersetup{colorlinks=true, linkcolor=blue, anchorcolor=black, citecolor=blue,   filecolor=black, menucolor=black, runcolor=black, urlcolor=blue}
\renewcommand*\headrule{
  \nointerlineskip
  \smash{\color{black}\rule{\headwidth}{0.25pt}}
}
\renewcommand*\footrule{
  \nointerlineskip
  \smash{\color{black}\rule{\headwidth}{0.25pt}}
}
\newcommand{\printCRediTifnotempty}{%
  \ifdim\DTLrowcount{CRediTs}pt=0pt
  \else
  \vglue 0.5\baselineskip
  \footnotesize\RaggedRight\textcolor{black}{\textbf{CRediT statement: }}
  \DTLforeach*{CRediTs}{\Credrole=credrole, \Credauthor=credauthor}{\textcolor{black}{ \textit{\Credrole}: \Credauthor. }}
  \fi
}
\else
\hypersetup{colorlinks=true, linkcolor=SedK4, anchorcolor=black, citecolor=SedK2,   filecolor=black, menucolor=black, runcolor=black, urlcolor=SedK4}
\renewcommand*\headrule{
  \nointerlineskip
  \smash{\color{SedK1}\rule{\headwidth}{0.25pt}}
}
\newcommand{\printCRediTifnotempty}{%
  \ifdim\DTLrowcount{CRediTs}pt=0pt
  \else
  \vglue 0.5\baselineskip
  \footnotesize\RaggedRight\textcolor{SedK2}{\textbf{CRediT statement: }}
  \DTLforeach*{CRediTs}{\Credrole=credrole, \Credauthor=credauthor}{\textcolor{SedK2}{ \textit{\Credrole}: \Credauthor. }}
  \fi
}
\renewcommand*\footrule{
  \nointerlineskip
  \smash{\color{SedK1}\rule{\headwidth}{0.25pt}}
}
\fi

\fancypagestyle{fancyps_preprint}{
  \fancyhf{}
  \fancyhead[L]{\scriptsize\nouppercase\authors}
  \fancyhead[R]{\scriptsize\itshape \@shorttitle}
  \fancyfoot[L]{\scriptsize{PRE-PRINT: \today}}
  \fancyfoot[C]{\scriptsize\itshape{\@preprintdeclaration}}
  \fancyfoot[R]{\scriptsize\thepage}
}

\fancypagestyle{fancyps_submission}{
  \fancyhf{}
  \fancyhead[L]{\textcolor{SedK2}{\scriptsize\@shorttitle}}
  \fancyfoot[L]{\textcolor{SedK2}{\scriptsize\nouppercase{Manuscript submitted to Sedimentologika}}}
  \fancyfoot[R]{\textcolor{SedK2}{\scriptsize\thepage}}
}

\fancypagestyle{fancyps_proof}{
  \fancyhf{}
  \fancyhead[L]{\textcolor{SedK2}{\scriptsize\nouppercase\authors}}
  \fancyhead[R]{\textcolor{SedK2}{\scriptsize\itshape\@shorttitle}}
  \fancyfoot[L]{\textcolor{SedK2}{\scriptsize\nouppercase{\textbf{SEDIMENTOLOGIKA}~
  \textbullet~PROOF}}}
  \fancyfoot[R]{\textcolor{SedK2}{\scriptsize\thepage}}
}

\fancypagestyle{fancyps_publication}{
  \fancyhf{}
  \fancyhead[L]{\textcolor{SedK2}{\scriptsize\nouppercase\authors}}
  \fancyhead[R]{\textcolor{SedK2}{\scriptsize\itshape\@shorttitle}}
  \fancyfoot[L]{\textcolor{SedK2}{\scriptsize\nouppercase{\textbf{SEDIMENTOLOGIKA}~\textbullet~\@theyear~\textbar~Vol.~\@volumenumber.\@issuenumber}}}
  \fancyfoot[R]{\textcolor{SedK2}{\scriptsize\thepage}}
}

\fancypagestyle{fancyps_submissionfirstpage}{
  \setlength{\headheight}{10mm}
  \addtolength{\topmargin}{-6mm}
  \fancyhf{}
  \fancyfoot[L]{\textcolor{SedK2}{\scriptsize\nouppercase{Manuscript submitted to Sedimentologika}}}
  \fancyfoot[R]{\textcolor{SedK2}{\scriptsize\thepage}}
  \renewcommand\headrule{\nointerlineskip\smash{\color{SedK1}\rule{\headwidth}{0.0pt}}}
}

\fancypagestyle{fancyps_preprintfirstpage}{
  \fancyhf{}
  \fancyhead[C]{{\Large\nouppercase{\@preprintdeclaration}}}
  \fancyfoot[L]{\scriptsize{PRE-PRINT:~\today}}
  \fancyfoot[R]{{\scriptsize\thepage}}
  \renewcommand\headrule{\nointerlineskip\smash{\color{SedK1}\rule{\headwidth}{0.0pt}}}
}

\fancypagestyle{fancyps_prooffirstpage}{
  \setlength{\headheight}{10mm}
  \addtolength{\topmargin}{-6mm}
  \fancyhf{}
  \fancyhead[L]{\includegraphics[height=12mm]{Sedimentologika_final_black.png}\tiny\par\small\textcolor[HTML]{5e5e5e}{\raisebox{-0.7ex}{\normalsize\simpleicon{doi}}}\href{https://example.com}{\enspace\small PROOF}}
  \fancyfoot[L]{\textcolor{SedK2}{\scriptsize\nouppercase{PROOF~\today}}}
  \fancyfoot[R]{\textcolor{SedK2}{\scriptsize\thepage}}
  \renewcommand\headrule{\nointerlineskip\smash{\color{SedK1}\rule{\headwidth}{0.0pt}}}
}

\fancypagestyle{fancyps_publicationfirstpage}{
  \setlength{\headheight}{10mm}
  \addtolength{\topmargin}{-6mm}
  \fancyhf{}
  \fancyhead[L]{\includegraphics[height=12mm]{Sedimentologika_final_black.png}\tiny\par\textcolor[HTML]{5e5e5e}{\raisebox{-0.7ex}{\normalsize\simpleicon{doi}}}\href{https://doi.org/\@articledoi}{\enspace\small\@articledoi}}
  \fancyfoot[L]{\textcolor{SedK2}{\scriptsize\nouppercase{\textbf{SEDIMENTOLOGIKA}~ \textbullet~\@theyear~\textbar~Vol.~\@volumenumber.\@issuenumber~\textbar~eISSN 2813-415X \textbar~\href{https://www.unige.ch/biblio/en/openaccess/publish-a-journal/open-access-publications/}{Published by Geneva University Library Open Access Publications}}}}
  \fancyfoot[R]{\textcolor{SedK2}{\scriptsize\thepage}}
  \renewcommand\headrule{\nointerlineskip\smash{\color{SedK1}\rule{\headwidth}{0.0pt}}}
}
% ----------------------------------------------------------------------------------------
% Class option switches
% ----------------------------------------------------------------------------------------

\if@preprint
\pretitle{
  \begin{RaggedRight}
    \LARGE
    \bfseries
  }
  \else
  \pretitle{
    \begin{RaggedRight}
      \LARGE
      \bfseries
      \textcolor{SedK1}
    }
    \fi

    \posttitle{
      \par
    \end{RaggedRight}
    \vspace{0.5em}
  }

  \preauthor{
    \lineskip 0.2em
    \begin{RaggedRight}
    }

    \postauthor{
      \printCRediTifnotempty
      \@correspondingauthor
    \end{RaggedRight}
    \vspace*{-5mm}
  }

  \predate{}
  \postdate{}
  \date{}

  \if@publication
  \renewcommand\maketitlehooka{\zsavepos{loc:beg_title}}
  \renewcommand\maketitlehookd{%
    \@insert@metadata
    \begin{RaggedRight}
      \begin{textblock*}{0.8\textwidth}[0,1](15mm,276mm)
        \footnotesize\textcolor{SedK1}{This open access article by \authors~is licensed under the \href{https://creativecommons.org/licenses/by/4.0/}{CC BY 4.0 license.}\\\copyright~\@theyear~\authors}
      \end{textblock*}
    \end{RaggedRight}
    \begin{flushright}
      \begin{textblock*}{20mm}[1,1](195mm,274mm)
        \promohref[SedkGrey]{https://creativecommons.org/licenses/by/4.0/}
        {\ccby}
      \end{textblock*}
    \end{flushright}
  }
  \fi

  \if@proof
  \renewcommand\maketitlehooka{\zsavepos{loc:beg_title}}
  \renewcommand\maketitlehookd{%
    \@insert@metadata
    \begin{RaggedRight}
      \begin{textblock*}{0.8\textwidth}[0,1](15mm,276mm)
        \footnotesize\textcolor{SedK1}{This open access article by \authors~is licensed under the \href{https://creativecommons.org/licenses/by/4.0/}{CC BY 4.0 license.}\\\copyright~\@theyear~\authors}
      \end{textblock*}
    \end{RaggedRight}
    \begin{flushright}
      \begin{textblock*}{20mm}[1,1](195mm,274mm)
        \promohref[SedkGrey]{https://creativecommons.org/licenses/by/4.0/}
        {\ccby}
      \end{textblock*}
    \end{flushright}
  }
  \fi

  \if@preprint
  \renewcommand\maketitlehooka{\zsavepos{loc:beg_title}}
  \renewcommand\maketitlehookd{%
    \@insert@preprintdeclaration
    \begin{RaggedRight}
      \begin{textblock*}{0.8\textwidth}[0,1](15mm,276mm)
        \footnotesize\textcolor{SedK1}{This pre-print is provided by the authors\\\@theyear}
      \end{textblock*}
    \end{RaggedRight}
  }
  \fi

  \if@submission
  \newcommand{\SedKtitle}[3]{%
    \if@anonymous
    \LARGE\textcolor{SedK1}{\@title}
    \thispagestyle{fancyps_submissionfirstpage}
    \else
    \maketitle
    \thispagestyle{fancyps_submissionfirstpage}
    \fi
    \linenumbers
    \abstract{#2}
    \plainlanguagesummary{#1}
    #3
    \normalsize
    }
    \else
    \newcommand{\SedKtitle}[3]{%
    \twocolumn[
      {
        \maketitle
        \if@preprint
        \thispagestyle{fancyps_preprintfirstpage}
        \fi
        \if@proof
        \thispagestyle{fancyps_prooffirstpage}
        \fi
        \if@publication
        \thispagestyle{fancyps_publicationfirstpage}
        \fi
      }
      \changetext{}{100mm}{}{}{}
      \plainlanguagesummary{#1}
      \abstract{#2}
      \vspace{\fill}
    ]
    \ifx#3\@empty
      % \twocolumn[
      %   \vglue 1.2\baselineskip
      % ]
    \else
      \twocolumn[
      % \plainlanguagesummary{#1} % if we need to bump the pls due to abstract lengths
      #3
      \vglue 0.9\baselineskip
      ]
    \fi
  }
  \fi

  \if@preprint
  \pagestyle{fancyps_preprint}
  \fi

  \if@submission
  \pagestyle{fancyps_submission}
  \setkeys{draftwatermark}{text={FOR REVIEW ONLY}, stamp=true}
  \RequirePackage{lineno}
  \renewcommand*\linenumberfont{\scriptsize}
  \doublespacing
  \def\labelitemi{\raisebox{0.35ex}{\tiny$\textbullet$}}
  \fi

  \if@proof
  \pagestyle{fancyps_proof}
  \setkeys{draftwatermark}{text={PROOF}, stamp=true}
  \fi

  \if@publication
  \pagestyle{fancyps_publication}
  \fi

  \if@anonymous
  \pdfvariable suppressoptionalinfo \numexpr2+16+32+64+128 \relax
  \fi
