"   适应部分项目中库文件不加 ?>来说明文件已结束
function Phpend(diyinfo) 
    let currentLine = line('$')
    let s:delimiterMap = {
        \ 'php': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
        \ 'sql': { 'left': '-- ' },
        \ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
        \ }
    let endFormat1 = "/* End of file ".expand('%:t')." */"
    "相对工作路径的定位
    "let endFormat2 = "/* Location: .".strpart(expand('%:p'),strlen(GetPWD()))." */"
    let endFormat2 = "/* Location: .".substitute(strpart(expand('%:p'),strlen(GetPWD())),'\\','\/','g').a:diyinfo." */"
    "let endFormat2 = "/* Location: .".strpart(expand('%:p'),strlen(expand('%:p:h'))).a:diyinfo." */"
    "let endFormat2 = "/* Location: .".substitute(strpart(expand('%:p'),strlen(expand('%:p:h'))),'\\','\/','g').a:diyinfo." */"
    call setline(currentLine+1,'')
    call setline(currentLine+2,endFormat1)
    call setline(currentLine+3,endFormat2)
:endfunction 

function InsertDate(date_type,newline) range
    let currentLine = a:firstline
    let theLine = getline(currentLine)
    let content = GetDate(a:date_type)
    if a:newline  == 1
        call setline(currentLine+1,content)
    else
        call setline(currentLine,theLine.content)
    endif
:endfunction 

function GetDate(date_type)
    if a:date_type  == 'date_time'
        let content = strftime("%Y-%m-%d %H:%M:%S")
    elseif a:date_type == 'time'
        let content = strftime("%H:%M:%S")
    elseif a:date_type == 'cdate'
        let content = strftime("%Y年%m月%d日 %H:%M:%S")
    endif
    return content
:endfunction 

function Count_words() range
    let lnum = a:firstline
    let n = 0
    while lnum <= a:lastline
        let n = n + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
    echo "found " . n . " words"
endfunction

function GetFileType()
    return tolower((strridx(expand("%"),".") == -1) ?
                \"" :
                \strpart(expand("%"),(strridx(expand("%"),".") + 1)))
endf

" php-doc config
"let g:pdv_cfg_Author = "hl <huanle0610@gmail.com>"

"note plugin config
let g:notes_directory = '~/notes'
let g:notes_suffix = '.note'
