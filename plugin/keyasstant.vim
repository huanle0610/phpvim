"==================================================================================================
"
" Name Of File: keyasstant.vim
" Maintainer:   hl(huanle0610 at gmail dot com)
" Version: See g:keyasstant_version
"
"
"==================================================================================================
" Exit quickly if already running or when 'compatible' is set. {{{1
if exists("g:keyasstant_version") || &cp
  finish
endif
"1}}}

" Version number
let g:keyasstant_version = "1.1.1"

" Check for Vim version 700 or greater {{{1
if v:version < 700
  echo "Sorry, keyasstant ".g:keyasstant_version."\nONLY runs with Vim 7.0 and greater."
  finish
endif


"if !exists("g:session_path")
"    let g:session_path = '~/desktop/myvim/session/'
"endif


" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 跳过页头注释，到首行实际代码
func! GotoFirstEffectiveLine()
    let l:c = 0
    while l:c<line("$") && (
                \ getline(l:c) =~ '^\s*$'
                \ || synIDattr(synID(l:c, 1, 0), "name") =~ ".*Comment.*"
                \ || synIDattr(synID(l:c, 1, 0), "name") =~ ".*PreProc$"
                \ )
        let l:c = l:c+1
    endwhile
    exe "normal ".l:c."Gz\<CR>"
endf

" 返回当前时期
func! GetDateStamp()
    return strftime('%Y-%m-%d')
endfunction

" 全选
func! SelectAll()
    let s:current = line('.')
    exe "norm gg" . (&slm == "" ? "VG" : "gH\<C-O>G")
endfunc
