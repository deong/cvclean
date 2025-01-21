\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvclean}[2002/04/12 class file "cvclean" to create a vita]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% (C) Copyright 1995, Andrej Brodnik, ABrodnik@UWaterloo.CA. All
%% rights reserved.
%%
%% This is a generated file. Permission is granted to to customize the 
%% declarations in this file to serve the needs of your installation. 
%% However, no permission is granted to distribute a modified version of 
%% this file under its original name. 
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
%%---


%%%%
%
% Process options and load class article:
%---
\let\@optionsToInput=\@empty
\DeclareOption*{
  \IfFileExists{cvclean\CurrentOption.clo}%
    {\edef\@optionToInput{cvclean\CurrentOption.clo}}%
    {\PassOptionsToClass{\CurrentOption}{article}}
}
\ProcessOptions
\LoadClass{article}
\RequirePackage[left=0.7in,top=0.7in,right=0.7in,bottom=0.7in]{geometry}
\RequirePackage{calc}
\setlength{\parindent}{0pt}

\newif\ifname\namefalse
\newif\ifaddress\addressfalse
\newif\ifhome\homefalse
\newif\ifoffice\officefalse
\newif\ifemail\emailfalse
\newif\iffax\faxfalse
\newif\ifemployer\employerfalse
\newif\ifposition\positionfalse
\newif\ifurl\urlfalse

\newcommand{\position}[1]{\def\@position{#1}\positiontrue}
\newcommand{\name}[1]{\renewcommand{\@author}{#1}
        \pagestyle{myheadings}\markright{\protect\small\@author\ $\bullet$
          \ifposition\@position\else Curriculum Vitæ\fi}\nametrue}
\newcommand{\employer}[1]{\def\@employer{#1}\employertrue}
\newcommand{\address}[1]{\def\@address{#1}\addresstrue}
\newcommand{\home}[1]{\def\@home{#1}\hometrue}
\newcommand{\office}[1]{\def\@office{#1}\officetrue}
\newcommand{\email}[1]{\def\@email{#1}\emailtrue}
\newcommand{\fax}[1]{\def\@fax{#1}\faxtrue}
\newcommand{\url}[1]{\def\@url{#1}\urltrue}

%
% title commands
%
%\title{Curriculum Vitae}
\newcommand{\makeheader}{%
    \begin{center}
    {\LARGE\textbf{\@author}}
    \ifposition\\\medskip{\large\@position}\fi
    
    \smallskip
    \hrulefill 
    \smallskip 

    % {\large \ifposition\@position \\ \fi}
    {\small \ifaddress\@address
      $\quad\bullet\quad$\fi \@home $\quad\bullet\quad$ \@email \ifurl
      % $\quad\bullet\quad$
      \@url\fi}

    \hrulefill

    \end{center}
    \thispagestyle{empty}
    \gdef\@author{}\gdef\@position{}

    \vspace{12pt}}


%
% Objective
%
\newcommand{\objective}[1]{%
    \makebox[1in][l]{\large\textsc{Objective}}%
    \parbox[t]{\textwidth - 1in}{#1}%

    \bigskip
    }


%
% Define new sections
%
\newcommand{\defsection}[1]{%
    \medskip
    \newenvironment{#1}{%
        {\large\textbf{#1}}
        }
        {
        \bigskip
        \smallskip
        }
}


%
% education
% 
\newenvironment{education}{%
    {\large\textbf{Education}}

    \begin{itemize}
    \newenvironment{degree}{%
        \newif\ifthesis\thesisfalse%
        \newif\ifgpa\gpafalse%
        \newif\ifother\otherfalse%
        \newif\ifadvisor\advisorfalse%
        \newif\ifyear\yearfalse%
        \newcommand{\type}[1]{\def\@type{####1}}
        \renewcommand{\year}[1]{\def\@year{####1}}
        \newcommand{\school}[1]{\def\@school{####1}}
        \newcommand{\gpa}[1]{\def\@gpa{####1}\gpatrue}
        \newcommand{\thesis}[1]{\def\@thesis{####1}\thesistrue}
        \newcommand{\advisor}[1]{\def\@advisor{####1}\advisortrue}
        \newcommand{\other}[1]{\def\@other{####1}\othertrue}}
        {\item \textbf{\@type}, \@school. \\%
          \ifthesis Thesis:\ \textit{\@thesis}.\fi%
          %\ifadvisor Advisor: \@advisor.\fi%
          %\ifyear\\\@year.\fi%
        }
    }
    {
    \end{itemize}
    \bigskip%
    }
        

%
% grants and awards
% 
\newenvironment{awards}{%
    {\large\textbf{Grants and Awards}}

    \begin{itemize}
    \newenvironment{award}{%
        \newif\ifduration\durationfalse%
        \newif\ifamount\amountfalse%
        \newif\ifstartdate\startdatefalse%
        \newif\ifcollaborators\collaboratorsfalse%
        \newif\ifidnumber\idnumberfalse%
        \renewcommand{\title}[1]{\def\@title{####1}}
        \newcommand{\idnumber}[1]{\def\@idnumber{####1}\idnumbertrue}
        \newcommand{\role}[1]{\def\@role{####1}}
        \newcommand{\duration}[1]{\def\@duration{####1}\durationtrue}
        \newcommand{\amount}[1]{\def\@amount{####1}\amounttrue}
        \newcommand{\collaborators}[1]{\def\@collaborators{####1}\collaboratorstrue}
        \newcommand{\startdate}[1]{\def\@startdate{####1}\startdatetrue}}
        {\item \textit{\@title}, \ifidnumber(\@idnumber).\fi \@role. %
          \ifcollaborators Collaboration with \@collaborators.\fi\\%
          \ifduration Duration: \@duration.\\\fi%
          \ifamount Amount: \@amount.\\\fi%
          \ifstartdate Start Date: \@startdate.\fi%
        }
    }
    {
    \end{itemize}
    \bigskip%
    }
    
        

%
% experience section
%
\newenvironment{experience}[1]{%
    {\large\textbf{#1}}%

    \begin{itemize}
    \newenvironment{job}{%
        \newif\ifdescription%
        \descriptionfalse%
        \newcommand{\when}[1]{\def\@when{####1}}
        \renewcommand{\employer}[1]{\def\@employer{####1}}
        \renewcommand{\position}[1]{\def\@position{####1}}
        \renewcommand{\description}[1]{\def\@description{####1}\descriptiontrue}}
        {\item \textbf{\@position, \@employer}\\
          \@when\\
          \@description}
    }
    {
    \end{itemize}
    \smallskip
    \bigskip%
    }


%
% skills section
%
\newenvironment{skills}{%
    {\large\textbf{Technical Skills}}%

    \medskip
    \makebox[1in][l]{\hfill}%
    \makebox[2.5in][l]{\textbf{Skill}}%
    \makebox[1.5in][c]{\textbf{Level of Expertise}}%
    %\makebox[\textwidth - 5in][r]{\textbf{Last Used}}%

    \newenvironment{skill}{%
        \renewcommand{\description}[1]{\def\@description{####1}}
        %\newcommand{\use}[1]{\def\@use{####1}}
        \newcommand{\level}[1]{\def\@level{####1}}}
        {\makebox[1in][l]{\hfill}%
         \makebox[3in][l]{\@description}%
         \makebox[1in][l]{\@level}%
         %\makebox[\textwidth - 5in][r]{\@use}%
        
        }
    }
    {
    \bigskip
    }



%
% References
%
\newif\ifbreak\breakfalse

\newenvironment{references}{%
    %\newpage
    {\large\textbf{References}}%

    \begin{list}{-}{\leftmargin=2em}
    \addtolength{\itemsep}{\baselineskip}
    \newenvironment{reference}{%
        \newif\iftitlea\titleafalse%
        \newif\iftitleb\titlebfalse%
        \renewcommand{\name}[1]{\def\@refname{####1}}
        \renewcommand{\title}[1]{\def\@reftitle{####1}}
        \newcommand{\titlea}[1]{\def\@reftitlea{####1}\titleatrue}
        \newcommand{\titleb}[1]{\def\@reftitleb{####1}\titlebtrue}
        \newcommand{\organization}[1]{\def\@reforganization{####1}}
        \newcommand{\street}[1]{\def\@refstreet{####1}}
        \newcommand{\city}[1]{\def\@refcity{####1}}
        \newcommand{\state}[1]{\def\@refstate{####1}}
        \newcommand{\zip}[1]{\def\@refzip{####1}}
        \newcommand{\phone}[1]{\def\@refphone{####1}}
        \renewcommand{\email}[1]{\def\@refemail{####1}}}
        {\raggedright\item\textbf{\@refname}\\%
         \@reftitle\\%
         \iftitlea\@reftitlea\\\fi%
         \iftitleb\@reftitleb\\\fi%
         \@reforganization    \\%
         \@refstreet          \\%
         \@refcity, \@refstate\quad\@refzip  \\% 
         Phone: \@refphone           \\%
         Email: \@refemail           \\%
        }
    }
   {
   \end{list}
   \bigskip
   }



%
% Publications
%
\newenvironment{publications}{%
    {\large\textbf{Publications}}%
    %\vspace{-23pt}% move the first subtype up even with PUBLICATIONS

    \medskip
    \newenvironment{journalarticles}{%
        \makebox[\textwidth][l]{\textbf{Refereed Journal Articles}}%
        \begin{enumerate}%
        \newenvironment{paper}{%
            \newif\ifjournal\journalfalse%
            \newif\ifvolume\volumefalse%
            \newif\ifnumber\numberfalse%
            \newif\ifmisc\miscfalse%
            \newif\ifpage\pagefalse%
            \newif\ifmonth\monthfalse%
            \renewcommand{\title}[1]{\def\@title{########1}}
            \renewcommand{\author}[1]{\def\@author{########1}}
            \newcommand{\journal}[1]{\def\@journal{########1}\journaltrue}
            \newcommand{\vol}[1]{\def\@vol{########1}\volumetrue}
            \newcommand{\num}[1]{\def\@num{########1}\numbertrue}
            \newcommand{\misc}[1]{\def\@misc{########1}\misctrue}
            \newcommand{\pages}[1]{\def\@pages{########1}\pagetrue}
            \renewcommand{\month}[1]{\def\@month{########1}\monthtrue}
            \renewcommand{\year}[1]{\def\@year{########1}}}
            {%\makebox[1in][l]{\hfill}\parbox[t]{\textwidth-1in}{%
                \item \@author.  \@title. \ifjournal\textit{\@journal}. \fi\ifvolume\@vol\ifnumber(\@num)\ifpage,\ %
                pp.\ \@pages\fi. \fi\fi\ifmonth\@month, \fi\@year.  \ifmisc\@misc.\fi%}

            \smallskip}}
        {
        \end{enumerate}
        \medskip
        }

    \newenvironment{conferencepapers}{%
        \makebox[\textwidth][l]{\textbf{Refereed Conference Papers}}%
        \begin{enumerate}%
        \newenvironment{paper}{%
            \newif\ifmisc\miscfalse%
            \newif\ifpage\pagefalse%
            \newif\ifmonth\monthfalse%
            \newif\ifvenue\venuefalse%
            \renewcommand{\title}[1]{\def\@title{########1}}
            \renewcommand{\author}[1]{\def\@author{########1}}
            \newcommand{\conference}[1]{\def\@conference{########1}}
            \renewcommand{\year}[1]{\def\@year{########1}}
            \newcommand{\pages}[1]{\def\@pages{########1}\pagetrue}
            \renewcommand{\month}[1]{\def\@month{########1}\monthtrue}
            \newcommand{\venue}[1]{\def\@venue{########1}\venuetrue}
            \newcommand{\misc}[1]{\def\@misc{########1}\misctrue}}
            {%\makebox[1in][l]{\hfill}\parbox[t]{\textwidth-1in}{%
                \item \@author.  \@title.  \ifpage In \textit{Proceedings of the }%
                \fi\textit{\@conference}.  \ifpage pp.\ \@pages.\ \fi%
                \ifvenue\@venue.\ \fi\ifmonth\@month,\ \fi\@year.  \ifmisc\@misc.\fi%}

            \smallskip}}
        {
        \end{enumerate}%
        \medskip
        }

    \newenvironment{bookchapters}{%
        \makebox[\textwidth][l]{\textbf{Refereed Book Chapters}}%
        \begin{enumerate}%
        \newenvironment{paper}{%
            \newif\ifmisc\miscfalse%
            \newif\ifeditor\editorfalse%
            \renewcommand{\title}[1]{\def\@title{########1}}
            \renewcommand{\author}[1]{\def\@author{########1}}
            \newcommand{\booktitle}[1]{\def\@booktitle{########1}}
            \renewcommand{\year}[1]{\def\@year{########1}}
            \newcommand{\editor}[1]{\def\@editor{########1}\editortrue}
            \newcommand{\publisher}[1]{\def\@publisher{########1}}
            \newcommand{\misc}[1]{\def\@misc{########1}\misctrue}}
            {%\makebox[1in][l]{\hfill}\parbox[t]{\textwidth-1in}{%
              \item \@author.  \@title.  \textit{\@booktitle}.  \ifeditor Ed.\ %
                \@editor.\ \fi\@publisher.\ \@year.  \ifmisc\@misc.\fi%}

            \smallskip}}
        {
        \end{enumerate}
        \medskip
        }

    \newenvironment{techreports}{%
        \makebox[\textwidth][l]{\textbf{Technical Reports}}%
        \begin{enumerate}%
        \newenvironment{paper}{%
            \newif\ifmisc\miscfalse%
            \renewcommand{\title}[1]{\def\@title{########1}}
            \renewcommand{\author}[1]{\def\@author{########1}}
            \newcommand{\university}[1]{\def\@university{########1}}
            \renewcommand{\year}[1]{\def\@year{########1}}
            \newcommand{\misc}[1]{\def\@misc{########1}\misctrue}}
            {%\makebox[1in][l]{\hfill}\parbox[t]{\textwidth-1in}{%
              \item  \@author.  \@title.  Technical Report, \@university.  %
                \@year.  \ifmisc\@misc.\fi%}

            \smallskip}}
        {
        \end{enumerate}
        \medskip
        }

    \newenvironment{presentations}{%
        \makebox[\textwidth][l]{\textbf{Invited Talks}}%
        \begin{enumerate}%
        \newenvironment{talk}{%
            \newif\ifmisc\miscfalse%
            \newif\ifvenue\venuefalse%
            \newif\ifconference\conferencefalse%
            \newif\ifmonth\monthfalse%
            \renewcommand{\title}[1]{\def\@title{########1}}
            \renewcommand{\author}[1]{\def\@author{########1}}
            \renewcommand{\month}[1]{\def\@month{########1}\monthtrue}
            \newcommand{\conference}[1]{\def\@conference{########1}\conferencetrue}
            \newcommand{\venue}[1]{\def\@venue{########1}\venuetrue}
            \renewcommand{\year}[1]{\def\@year{########1}}
            \newcommand{\misc}[1]{\def\@misc{########1}\misctrue}}
            {%\makebox[1in][l]{\hfill}\parbox[t]{\textwidth-1in}{%
              \item  %\@author.  
                \@title.  \ifconference\@conference.\ \fi\ifvenue\@venue.\ %
                \fi\ifmonth\@month,\ \fi\@year.  \ifmisc\@misc.\fi%}

            \smallskip}}
        {
        \end{enumerate}%
        \medskip
        }
    }
    {
    \bigskip
    }
            
