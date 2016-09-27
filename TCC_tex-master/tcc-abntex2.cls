

%========================================================================
% Identificação
%========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tcc-abntex2}%
              [2016/02/23 v0.1 Classe de Projeto de Final de Curso - Ciência da Computação]

%========================================================================
% Declaração de opções
%========================================================================
% Opções:
%   monografia:     Formata documento para uma monografia
% -----------------------------------------------------------------------

\DeclareOption{monografia}{%
    \def\@tipotrabalho{Trabalho Final de Gradua\c{c}\~ao}
}

\ProcessOptions\relax

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\LoadClass[a4paper,12pt,twoside,brazil]{abntex2}

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[alf,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	
\RequirePackage{color}	
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
\RequirePackage{nomencl}
\RequirePackage{setspace}
\RequirePackage[none]{hyphenat}
%\RequirePackage{filehook}
\RequirePackage[brazil]{babel}
\RequirePackage{algpseudocode,algorithm}
\RequirePackage[a4paper,top=30mm,left=30mm,right=20mm,bottom=10mm]{geometry}
\RequirePackage[labelfont=bf]{caption}
\counterwithout{equation}{chapter}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}
\newsubfloat{figure}



%=========================================================================
% Configurações de aparência do PDF final
%=========================================================================
% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\hypersetup{
     	%backref=true,
     	%pagebackref=true,
	%bookmarks=true,         		        % show bookmarks bar?
	pdftitle={\imprimirtitulo}, 
	pdfauthor={\imprimirautor},
    	pdfsubject={\imprimirpreambulo},
	pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	pdfproducer={LaTeX with abnTeX2},       % producer of the document
	pdfcreator={\imprimirautor},
    	colorlinks=true,                        % false: boxed links; true colored links
    	linkcolor=black,                        % color of internal links
    	citecolor=black,                        % color of links to bibliography
    	filecolor=magenta,                      % color of file links
	urlcolor=black,
	bookmarksdepth=4
}



%=========================================================================
% Comandos de dados para CAPA e FOLHAS DE ROSTO e APROVAÇÃO 
%=========================================================================

\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}




%========================================================================
% Listas e Sumário
%========================================================================

% ---
% Lista de ilustrações
% ---
\newcommand{\listafiguras}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}
% ---
% Lista de tabelas
% ---
\newcommand{\listatabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}
% ---
% Lista de abreviaturas
% ---
\newcommand{\listasiglas}[1]{
	\thispagestyle{plain}
	\pagestyle{plain}
	\pdfbookmark[0]{Lista de siglas}{Lista de siglas} 
	\chapter*{Lista de siglas}
	\input{#1}
	\cleardoublepage
}
% ---
% Lista de algoritmos
% ---
\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de algoritmos}
\newcommand{\cftalgorithmname}{\algorithmname\space} 
\newcommand{\listaalgoritmos}{
	\pdfbookmark[0]{\listalgorithmname}{loa}
	\thispagestyle{empty}
	\pagestyle{empty}
	\listofalgorithms
	\cleardoublepage
}
% ---
% Lista de símbolos
% ---
\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{Lista de símbolos}
\newcommand{\listasimbolos}{
	\thispagestyle{empty}
	\pagestyle{empty}
	\makenomenclature
	\pdfbookmark[0]{\nomname}{los}
	\printnomenclature
	\cleardoublepage
}
% ---
% Sumário
% ---
\newcommand{\sumario}{%
	\chapter*{SUM\'ARIO}
	\pdfbookmark[0]{\contentsname}{toc}
	%\thispagestyle{empty}
	%\pagestyle{empty}
	\@starttoc{toc}
	\cleardoublepage
}
%--
% !(Padrão ABNT) do índice da unifra...
%--
%Fix arrumar o espaçamento entre o numero e o titulo do capítulo 

%fontes dos titulos
\renewcommand*{\cftchapterfont}{\normalsize}
\renewcommand*{\cftsectionfont}{\normalsize}
\renewcommand*{\cftsubsectionfont}{\normalsize}
%fonte do numero da pag
\renewcommand*{\cftchapterpagefont}{\normalfont}
\renewcommand*{\cftsectionpagefont}{\normalfont}
\renewcommand*{\cftsubsectionpagefont}{\normalfont}
%
% espaçamento dos titulos

\renewcommand*{\l@section}{\@dottedtocline{1}{0mm}{14mm}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{0mm}{14mm}}
\renewcommand*{\l@subsubsection}{\@dottedtocline{3}{0mm}{14mm}}
 %arruma os pontilhados dos titulos dos capitulos 
\renewcommand*{\cftchapterdotsep}{\cftdotsep}
\renewcommand*{\cftchapterleader}{\cftdotfill{\cftchapterdotsep}}
\setlength{\cftbeforesubsectionskip}{20mm}
\setlength{\cftbeforesectionskip}{10mm}
\setlength{\cftbeforesubsubsectionskip}{30mm}
\setlength{\cftbeforechapterskip}{0mm}


\setlength{\cftchapternumwidth}{14mm}

%========================================================================
% Resumo e Abstract
%========================================================================error
% ---
% Resumo
% ---
\renewenvironment{resumo}[1]{%
	\gdef\@abstractkw{#1}

	\chapter*{RESUMO\hfill} 
	\pdfbookmark[0]{Resumo}{Resumo} 
    \thispagestyle{empty}
    \SingleSpacing
    \setlength{\parindent}{0mm}
}{
   	\par\vspace{5mm}
   	\noindent\textbf{Palavras-chave:} \@abstractkw.
	\thispagestyle{empty} 
    \par\vspace{10mm}
    
}
% ---
% Abstract
% ---
\renewenvironment{abstract}[1]{%
	\gdef\@abstractkw{#1}
	\let\clearpage\relax\chapter*{ABSTRACT\hfill}%\par%
	\pdfbookmark[0]{Abstract}{Abstract} 
    \SingleSpacing
    \setlength{\parindent}{0mm}
}{
   	\par\vspace{5mm}
   	\noindent\textbf{Keywords:} \@abstractkw.
	\thispagestyle{empty}
}
%--
% !(Padrão ABNT) das Ref. Bib. da unifra...
%--
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{
    \setlength{\beforechapskip}{3mm}
    \oldbibliography{#1}
    \justificado
    \setlength{\itemsep}{10mm}
    \vspace{10mm}
  
}
%=======================================================================
% Ajuste do cabeçalho e rodapé
%=======================================================================
%Define um novo estilo
\makepagestyle{unifra}
\makeevenhead{unifra}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{unifra}{}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{unifra}{0mm}{0mm}


\renewcommand{\pretextual}{
    \aliaspagestyle{chapter}{plain}
    \pagestyle{plain}
    \aliaspagestyle{cleared}{plain}
}
\renewcommand{\frontmatter}{\pretextual} 

% Configura o layout de elementos textuais{Introdução-desenvolvimento-conclusão }
\renewcommand{\textual}{
    \pagestyle{myheadings}  
    \aliaspagestyle{chapter}{unifra}
    \aliaspagestyle{cleared}{unifra}
}

% Configura layout para elementos pós-textuais
\renewcommand{\postextual}{
    \pagestyle{plain}
    \aliaspagestyle{chapter}{unifra}
    \aliaspagestyle{cleared}{unifra}
}
%=========================================================================
% Configurações
%=========================================================================
\chapterstyle{unifra}
\renewcommand*{\figureautorefname}{\textbf{Figura}}
\renewcommand*\footnoteautorefname{Nota de Rodapé}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{\textbf{Tabela}}%
\renewcommand*\partautorefname{Parte}%
\renewcommand*\appendixautorefname{Apêndice}%
\renewcommand*\chapterautorefname{Capítulo}%
\renewcommand*\sectionautorefname{Seção}%
\renewcommand*\subsectionautorefname{Subseção}%
\renewcommand*\subsubsectionautorefname{Subseção}%
\renewcommand*\paragraphautorefname{Parágrafo}%
\renewcommand*\subparagraphautorefname{Subparágrafo}%
\renewcommand*\FancyVerbLineautorefname{Linha}%
\renewcommand*\theoremautorefname{Teorema}%
\renewcommand*\pageautorefname{Página}%
\renewcommand*\contentsname{SUM\'ARIO}
\addto\captionsbrazil{%
  \renewcommand{\bibname}{\leftskip\z@skip REFER\^ENCIAS BIBLIOGR\'AFICAS}
  \renewcommand{\indexname}{SUM\'ARIO}
}
% --
% Configuração das fontes
% --
% Fonte padrão section, subsection e subsubsection
\renewcommand*{\ABNTEXchapterfont}{\fontfamily{ptm}\bfseries\selectfont}
\renewcommand*{\ABNTEXsectionfont}{\fontfamily{ptm}\selectfont{\normalfont}}

\renewcommand*{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand*{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand*{\ABNTEXsubsectionfontsize}{\normalsize}


\tipotrabalho{\@tipotrabalho}

% ---
% Configurações de espaços
% ---
%%% Recuo do parágrafo:
\setlength{\parindent}{12.5mm}

%% Recuo da citação compensando o \parindent
\setlength{\ABNTEXcitacaorecuo}{28mm}

% Espaçamento após o título do capitulo
\setlength{\afterchapskip}{5mm}

%\ Espaçamento do separador do cabeçalho}
\setlength{\headsep}{2mm}

% Controle do espaçamento entre linhas
\linespread{1.5}
  
%Justifica texto
\newcommand{\justificado}{%
  \rightskip\z@skip%
  \leftskip\z@skip
}


%Contorna os warnings da compilação ref a parágrafos
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000




