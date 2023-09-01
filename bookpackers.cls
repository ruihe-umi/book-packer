\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{bookpackers}[2023/08/31 LuaLaTeXで同人小説作りたいクラス]

\RequirePackage{pgfopts}
\RequirePackage{etoolbox}

\newif\ifbookpackers@trimmarks
\pgfqkeys{/bookpackers}{
    paper/.store in=\bookpackers@papersize,
    paper=a6,
    fontsize/.store in=\bookpackers@fontsize,
    fontsize=12Q,
    baselineskip/.store in=\bookpackers@baselineskip,
    baselineskip=20H,
    trimmarks/.is if=bookpackers@trimmarks,
    trimmarks=false,
    a6/.code={
        \pgfkeys{/bookpackers/paper=a6}
    },
    a5/.code={
        \pgfkeys{
            /bookpackers/paper=a5
        }
    },
    b6/.code={
        \pgfkeys{
            /bookpackers/paper=b6j,
            /bookpackers/fontsize=13Q,
            /bookpackers/baselineskip=20H
        }
    },
}

\ProcessPgfOptions{/bookpackers}

\LoadClass[
    book,
    baselineskip=\bookpackers@baselineskip,
    paper=\bookpackers@papersize,
    twoside,
    tate,
    jafontsize=\bookpackers@fontsize,
    line_length=39zw,
    foot_space=14mm,
    gutter=17mm,
    open_bracket_pos=nibu_tentsuki,
    hanging_punctuation
]{jlreq}

\ifbookpackers@trimmarks
    \def\@showfontsize#1#2#3{\umirel{{#1#2}#3}}
    \RequirePackage[lualatex,trimmarks_paper=a4,landscape,show={trimmarks,digital,banner},bleed_margin=3mm]{jlreq-trimmarks}
    % \RequirePackage[lualatex,trimmarks_paper=+6mm,show={digital},bleed_margin=3mm]{jlreq-trimmarks}
    \jlreqtrimmarkssetup{
        banner={
            top-right={tate={\umirel{\bookpackers@papersize}\ifdefstring{\bookpackers@papersize}{a6}{（文庫）}{}版縦\umirel{1}段組}},
            bottom-right={tate={\umitcy{39}字\umitcy{16}行　\expandafter\@showfontsize\bookpackers@fontsize\expandafter\@showfontsize\bookpackers@baselineskip}}
        }
    }
\fi

\RequirePackage{luatexja-fontspec}
\RequirePackage{relfont}
\setrelfont{Dejavu Serif}
\RequirePackage{punctlua} % 約物を直す

%% ルビ関係のもの
\RequirePackage{pxrubrica}
\rubysetup{||.HJf.>}
\rubysizeratio{0.5}

%% pagestyle
%% ノンブルは10Q、EB Garamond
\NewDocumentCommand{\SmallText}{}{\fontsize{2.5mm}{5mm}\selectfont}
\newfontfamily\NombreFont[Numbers=OldStyle]{EBGaramond}
\NewPageStyle{honbun}{%
    yoko,%
    running_head_position=top-left,%
    nombre_position=top-left,%
    running_head_font={\SmallText},%
    nombre_font={\SmallText\NombreFont},%
    odd_running_head={_chapter},%
    even_running_head={},%
    nombre={\thepage},%
    mark_format={_chapter={#1}}}
\pagestyle{honbun}

\RequirePackage[unicode,hidelinks,bookmarks=true]{hyperref}
\RequirePackage[depth=1]{bookmark}
\RequirePackage{lltjext}
\RequirePackage{tikz}
\RequirePackage{subfiles}

\endinput