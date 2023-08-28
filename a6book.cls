\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{a6book}[2023/08/27 LuaLaTeXで同人小説作りたいクラス A6サイズ]

\LoadClass[
    book,
    a6paper,
    twoside,
    tate,
    jafontsize=12Q,
    line_length=39zw,
    linegap=8H,
    foot_space=14mm,
    gutter=17mm,
    open_bracket_pos=nibu_tentsuki,
    hanging_punctuation
]{jlreq}

\RequirePackage[lualatex,trimmarks_paper=a4,landscape,show={trimmarks,digital,banner},bleed_margin=3mm]{jlreq-trimmarks}
\jlreqtrimmarkssetup{
    banner={
        top-right={tate={\umirel{A6}（文庫）版縦\umirel{1}段組}},
        bottom-right={tate={\umitcy{39}字\umitcy{16}行　\umitcy{12}\umirel{Q}\umitcy{20}\umirel{H}}}
    }
}

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