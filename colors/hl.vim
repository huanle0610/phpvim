" Vim color file
" Maintainer: hl <huanle0610@gmail.com> 
" Last Change: 2011年 08月 20日 星期六 20:57:14 CST
"     version: 1.0
" This color scheme uses a light background.

set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "hl"

" Normal
hi Normal  ctermbg=DarkGrey ctermfg=White guifg=#404040 guibg=#ffffff
" Search
hi IncSearch    term=reverse cterm=reverse gui=UNDERLINE guifg=#404040 guibg=#40ffff
hi Search       term=reverse ctermbg=Yellow ctermfg=Black gui=NONE guifg=#404040 guibg=#ffff60

" Messages
hi ErrorMsg     term=standout ctermbg=DarkRed
hi WarningMsg   term=standout ctermfg=LightRed gui=NONE guifg=#ff0000 guibg=#ffe4e4
hi ModeMsg      term=BOLD cterm=BOLD gui=NONE guifg=#dd0000 guibg=NONE
hi MoreMsg      term=BOLD ctermfg=LightGreen gui=NONE guifg=#009070 guibg=NONE
hi Question     term=standout ctermfg=LightGreen gui=NONE guifg=#ff7700 guibg=NONE

" Split area
hi StatusLine   term=reverse,BOLD cterm=reverse,BOLD gui=BOLD guifg=#404040 guibg=#E5E5E5
hi StatusLineNC term=reverse cterm=reverse gui=NONE guifg=#a4a4a4 guibg=#E5E5E5
hi VertSplit    term=reverse cterm=reverse gui=NONE guifg=#404040 guibg=#E5E5E5
hi WildMenu     term=standout ctermbg=Yellow ctermfg=Black gui=BOLD guifg=#404040 guibg=#dd0000

" Diff
hi DiffText     term=reverse cterm=BOLD ctermbg=Red gui=NONE guifg=#e04040 guibg=#ffd8d8
hi DiffChange   gui=NONE guifg=#408040 guibg=#d0f0d0
hi DiffDelete   gui=NONE guifg=#4848ff guibg=#ffd0ff
hi DiffAdd      gui=NONE guifg=#4848ff guibg=#ffd0ff

" Cursor
hi Cursor       gui=NONE guifg=#0000ff guibg=#00e0ff
hi lCursor      gui=NONE guifg=#404040 guibg=#8000ff
hi CursorIM     gui=NONE guifg=#404040 guibg=#8000ff

" Fold
hi Folded       term=standout ctermbg=LightGrey ctermfg=DarkBlue gui=NONE guifg=#20605c guibg=#b8e8dc
hi FoldColumn   term=standout ctermbg=LightGrey ctermfg=DarkBlue gui=NONE guifg=#40a098 guibg=#f0f0f0

" Other
hi Directory    term=BOLD ctermfg=LightCyan term=underline ctermfg=Yellow gui=NONE guifg=#0070b8 guibg=NONE
"行号
hi LineNr       term=underline ctermfg=Yellow gui=NONE guifg=#acacac guibg=NONE
"无字符区域
hi NonText      term=BOLD ctermfg=LightMagenta gui=BOLD guifg=#00a0c0 guibg=NONE
"特殊字符eg: 
hi SpecialKey   term=BOLD ctermfg=LightBlue gui=NONE guifg=#4040ff guibg=NONE
hi Title        term=BOLD ctermfg=LightMagenta gui=NONE guifg=#0050a0 guibg=#c0e8ff
hi Visual       term=reverse ctermbg=black gui=NONE guifg=#484848 guibg=#e0e0e0
hi VisualNOS  term=underline,BOLD cterm=underline,BOLD gui=NONE guifg=#484848 guibg=#e0e0e0

" Syntax group
"注释
hi Comment      ctermbg=DarkGrey gui=NONE guifg=#A5A5A5 guibg=NONE
"常量
hi Constant     ctermbg=DarkGrey gui=NONE guifg=#0070e6 guibg=NONE
"数字
hi Number       gui=NONE guifg=#aa0094 guibg=NONE
"变量
hi Identifier   ctermbg=DarkGrey gui=NONE guifg=#0070e6 guibg=NONE
hi Error        term=BOLD gui=BOLD guifg=#ffffff guibg=#dd0000
"关键字
hi PreProc      term=BOLD ctermbg=DarkGrey ctermfg=red gui=BOLD guifg=#e06800 guibg=NONE
"特殊符号，括号之类的
hi Special      term=NONE ctermbg=DarkGrey gui=NONE guifg=#4a9400 guibg=NONE
"语句
hi Statement    term=BOLD ctermbg=DarkGrey gui=NONE guifg=#ff7700 guibg=NONE
hi Todo         gui=UNDERLINE guifg=#ff0070 guibg=#ffe0f4
"类型function,class
hi Type         term=BOLD ctermbg=DarkGrey ctermfg=Blue gui=BOLD guifg=#0070e6 guibg=NONE
hi Underlined   gui=UNDERLINE guifg=fg guibg=NONE
hi Include      term=BOLD gui=BOLD guifg=#dd0000 guibg=NONE 
hi Function     term=BOLD gui=BOLD guifg=#00aa00 guibg=NONE
hi String       ctermbg=DarkGrey ctermfg=Cyan gui=NONE guifg=#4F4F6F
hi Ignore       ctermbg=DarkGrey ctermfg=Yellow gui=NONE guifg=#404040 guibg=NONE

hi Pmenu          guifg=#666666          guibg=#F0F0F0
hi PmenuSel       guifg=#0070E6          guibg=#ACD5FF
