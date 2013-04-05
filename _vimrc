":file:///usr/share/vim/vim73/doc/usr_41.txt   vim文档
"如果需要引入其它配置文件可以用命令
"source _vim_udf.vim
"
"不需要保持和 vi 非常兼容
set nocompatible
set backspace=indent,eol,start
"Set mapleader
let mapleader = ","
nmap <leader>uuc :call UpdateCFG()<CR>
nmap <leader>ee :call EditCFG()<CR>
nmap <leader>qa :qall<CR>

"清除并重绘屏幕,默认为c-l,此处重新定义
map <leader>l :redr!<CR> 
"=========================================
"标签页管理
map <C-tab> :tabn<CR>
map <C-S-tab> :tabn<CR>
map <C-n> :tabnew<CR>
map <C-F4> :tabclose<CR>
"=========================================
"日期快捷输入映射
nmap <leader>tt :call InsertDate('date_time',0)<CR>
nmap <leader>ttn :call InsertDate('date_time',1)<CR>
nmap <leader>tc :call InsertDate('cdate',0)<CR>
nmap <leader>tcn :call InsertDate('cdate',1)<CR>
"=========================================

"=========================================
"文件结束提示
nmap <leader>pec :call Phpend(" CREATE BY JERRY ON ".GetDate('date_time'))<CR>
nmap <leader>pe :call Phpend('')<CR>
"=========================================
 

"=========================================
"缩写配置
"日期缩写替换
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
"iab upper <c-r>=toupper("expression")<cr>
"iab pwd <c-r>=getcwd()<cr>
"=========================================
" phpdoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR>

"=========================================
"显示行号
set nu
"取消显示行号
"set nonu
filetype plugin indent on
set completeopt=longest,menu


" 使backspace正常处理indent, eol, start等
set backspace=indent,eol,start whichwrap+=<,>,[,]
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

"编码设定
set encoding=utf-8
set fileencoding=utf-8
"文件编码识别
set fileencodings=utf-8,gbk,ucs-bom,cp936
"文件格式设定
set fileformat=unix
set fileformats=unix,dos,mac
"转化其它为unix格式
"set fileformats=unix
"bom设定
"set nobomb
"set bomb


"============================================
"搜索高亮
set hlsearch
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
" 不要闪烁
set novisualbell

"真的很smart, 搜索时全小写相当于不区分大小写，只要有一个大写字母出现，则区分大小写
"simple idea, great achievement!
set ignorecase smartcase
"取消搜索高亮
map <C-F5> :let @/=''<CR> 
"清空搜索关键词
map <F5> :set invhlsearch<CR>
"============================================
"设置工作目录
"good idea but not suit everyone i think
function! CHANGE_CURR_DIR()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction
"autocmd BufEnter * call CHANGE_CURR_DIR()
map <leader>cd  :call CHANGE_CURR_DIR()<CR>

function! OPEN_WIN_EXPLORER()
    "silent exec "!gnome-open %p:%h"
    let _dir = getcwd() 
    "目录中无多字节文字，直接打开并选中本文件
    if (matchstr(_dir,'[^\x00-\xff]') == '')
        silent exec "!start explorer /e,,%:p:h,/select,%:p"
        unlet _dir
        return 
    endif
    "包含多字节时
    silent exec "call CHANGE_CURR_DIR()"
    silent exec '!start explorer .'
    silent exec "cd " . _dir
    unlet _dir
endfunction
"============================================
"打开当前文件所在文件夹
if has("win32")
    nmap <C-F3> :exec '!start explorer .'<CR>
    nmap <F11> :call OPEN_WIN_EXPLORER()<CR>
else
    nmap <C-F3> :exec '!gnome-open .'<CR>
endif

"cmd到当前文件所在文件夹
if has("win32")
    nmap <leader>dos :exec '!start cmd .'<CR>
endif

"
"小括号、大括号、中括号、单双引号等自动补齐
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""折叠相关配置"""""""
"手工定义折叠
set fdm=manual
"根据缩进折叠
"set fdm=indent
"用表达式来定义折叠
"set fdm=expr
"用语法高亮来定义折叠
"set fdm=syntax
"对没有更改的文本进行折叠
"set fdm=diff
"对文中的标志折叠
"set fdm=indent
"""""折叠相关命令"""""""
"zo将光标所在处折叠Open
"zc                Close
"zi open&close 相互转化
"zn 打开全文折叠
"zN close全文折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"配色方案
"colorscheme shine
"colorscheme af
"colorscheme evening
"colorscheme  emacs
colorscheme hl
"colorscheme gemcolors
"colorscheme night
"colorscheme twilight
"colorscheme railscasts

"语法开启
syntax on

highlight NOTE guifg=BLUE guibg=yellow
syntax match NOTE /NOTE/

"Tab设置为4个字符
set tabstop=4   "设置tabs显示为4个空格的宽度(默认为8个)
set softtabstop=4
set expandtab   " Turn Tab keypresses into spaces. Sounds like this is happening to you.
                         ""    You can still insert real Tabs as [Ctrl]-V [Tab].
""set noexpandtab      " Leave Tab keys as real tabs (ASCII 9 character).
set shiftwidth=4     " When auto-indenting, indent by this much.
                         "   (Use spaces/tabs per 'expandtab'.)

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


"状态栏显示设置
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%l,%v][%p%%]\ [LEN=%L]\ %=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}

"命令栏高度设置
set cmdheight=1 "aslo can use ch
"GUI设置
"Autoselect 
"whenever VISUAL mode is started,Vim tries to become the owner of
"the windowing system's global selection.
set guioptions+=a
"隐藏底部滚动条
set guioptions-=b
"隐藏右边滚动条
set guioptions-=R
set guioptions-=r
"隐藏左边滚动条
set guioptions-=l
set guioptions-=L
"隐藏菜单栏
set guioptions-=m
map <leader>gm :se guioptions+=m<CR>
map <leader>gom :se guioptions-=m<CR>
"隐藏工具栏
set guioptions-=T
map <leader>gt :se guioptions+=T<CR>
map <leader>got :se guioptions-=T<CR>

"session open,save
imap <F6> <esc>:SessionOpen<space>
nmap <F6> :SessionOpen<space>
"for gui
"map <C-s> :SessionSave<CR>
"for cli
map <C-F6> :SessionSave<CR>

nmap <leader>s :w<CR>
nmap <leader>q :wq<CR>

"系统粘贴复制
" to see the detail :h reg
" try :reg
" :reg
"其中注意两个特殊的寄存器："* 和 "+。
"这两个寄存器是和系统相通的，前者关联系统选择缓冲区，后者关联系统剪切板。
nmap  <leader>ps "+p
nmap  <leader>pt "*p
nmap  <leader>pn "-p
" copy the current filename, and then you can use <leader>pm to paste
if has("win32")
    nmap  <leader>cf :let @*=substitute(@%, '\\', '\/', 'g')<CR>
else
    nmap  <leader>cf :let @+=@%<CR>
endif
nmap  <leader>ct :let @+=@*<CR>
vnoremap <leader>yy "+y
nmap <leader>ggy ggVG
nmap <leader>gy VG
 

"跳转代码行
imap <silent> <C-a> <esc>/^\s*\w<CR>zt
nmap <silent> <C-a> /^\s*\w<CR>zt

" NERDTree插件的快捷键
imap <silent> <F7> <esc>:NERDTreeToggle<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>

"tag-list插件窗口显示开关
imap <silent> <F12> <esc>:TlistToggle<CR>
nmap <silent> <F12> :TlistToggle<CR>
"tag更新快捷键
imap <silent> <C-F12> <esc>:TlistClose<CR>:TlistUpdate<CR>:TlistOpen<CR>
nmap <silent> <C-F12> :TlistClose<CR>:TlistUpdate<CR>:TlistOpen<CR>


"删除空行，删除行尾空字符,删除^M dos结束符
nmap <leader>dl :g/^\s*$/d<CR>
nmap <leader>de :1,$s/\s*$//g<CR>
nmap <leader>dw :%s/\r//g<CR>

"""""""""""""""""""""""""
"函数补齐
"by plugin supertab

""php语法检查
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Check PHP Syntax using makeprg
"""""""""""""""""""""""""""""""""""""""""""""""""""""

function! PhpCheckSyntax()
    " Check php syntax
    setlocal makeprg=\"php\"\ -l\ -n\ -d\ html_errors=off

    " Set shellpipe
    setlocal shellpipe=>

    " Use error format for parsing PHP error output
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make %
endfunction

" Perform :PhpCheckSyntax()
"autocmd BufWritePost *.php,*.phps :call PhpCheckSyntax()

"退出
nmap <c-q> :q!<cr>


"行号显示 快捷键
map <F4> :se invnu<CR>
"定义切换插入模式粘贴切换快捷键
set pastetoggle=<C-F9>
"不复制行号, 为了在终端下使用方便,请在要复制时f4隐藏行号
"set mouse=a

"Quickfix窗口显示
nmap <F2> :cw<CR>
nmap <C-F2> :ccl<CR>

"函数原型跳转
nmap <F3> :tselect<cr>


autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""函数部分

"自动闭合括号函数
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

"Delete trailing white space, useful for Python :)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerFindActive=1
" bufExplorer 快捷键 {{{
imap <silent> <C-F8> <esc>:BufExplorer<CR>
nmap <silent> <C-F8> :BufExplorer<CR>
" }}}

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 0
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 30
let g:miniBufExplSplitBelow=1

autocmd BufRead,BufNew :call UMiniBufExplorer

" miniExplorer 快捷键 {{{
imap <silent> <F8> <esc>:TMiniBufExplorer<CR>
nmap <silent> <F8> :TMiniBufExplorer<CR>
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ssp :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS .tag CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"窗口切换快捷键设置,放置于配置文件底部，以防止其它设置覆盖
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-i> <C-W>h<C-W>_
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""应用部分
""在函数中移动光标
"""""[[		转到上一个位于第一列的{
"""""]]		转到下一个位于第一列的{
"""""gd		转到光标所指局部变量的定义
"""""*		转到当前光标所在单词下一次出现的地方
"""""#		转到当前光标所在单词上一次出现的地方
"""""%		转到当前括号(类型依具体情况)闭合处


""tags应用
""""C-]		跳转当前标签定义处
""""C-T		返回跳转的地方
""""tselect	显示匹配的列表
""""tfirst      到第一个匹配
""""tlast       到最后一个匹配
""""tnext       到下一个匹配


""搜索应用
"建议搜索前sp命令,产生一个新窗口.避免进入查找到的文件后,查不到原文件
":vimgrep /spaceDiy/ static/js/**	在static/js目录下递归查找pattern指定的内容
"
":pwd 查看当前目录，不要搜索错误的目录
":cd path_to_dir 进入要搜索的目录
":tabe[dit] 新建一个tab窗口，用来搜索结果
":vim[grep] patter **/*.php **/*.tpl 其中搜索条件 patter 可以使用 ctrl+r " 方式粘贴，因为是命令行，无法直接使用p粘贴。 **递归当前目录
":cnext (:cn) 当前页下一个结果
":cprevious (:cp) 当前页上一个结果
":clist (:cl) 打开quickfix窗口，列出所有结果，不能直接用鼠标点击打开，只能看
":copen (:cope) 打开quickfix窗口，列出所有结果，可以直接用鼠标点击打开
":ccl[ose] 关闭 quickfix 窗口。
"ctrl + ww 切换编辑窗口和quickfix窗口，在quickfix里面和编辑窗口一样jk表示上下移动，回车选中进入编辑窗口
"
"注意：要搜索的文件 可以是具体的文件路径，也可以是带通配符的路径比如 *.as **/*.as ，**表示递归所有子目录。 要搜索的文件和或搜索范围都可 以写多个，用空格分开。
"例子：
":vimgrep /\<flash\>/ **/*.as 搜索当前目录以及所有子目录内as文件中的 "flash"
":vimgrep /an error/ *.c就是在所有的.c文件中搜索an error。
":vimgrep/an error/* 意思是查找当前目录下的文件中的an error，不包括子目录
":vim /Message/ **/*.js    搜索当前目录以及所有子目录内js文件中的 "Message"
"

""
"""显示
"":cw		显示查询到的Quickfix列表
":set list  显示特殊字符
"移动
" gk,gh,gi,gl move not linewise.
" ^	To the first non-blank character of the line.            
" g_  To the last non-blank character of the line.
""滚动
"zz: 将当前行置于屏幕中间
"zt: 将当前行置于屏幕顶端
"zb：底端啦~
"H:  屏幕最上方
"M:  屏幕中间
"L:  屏幕最下方
"还有一条就是移动光标所在行的位置，就是说，比如我光标在第10行，我想光标不动，但是所在行向上移，ctrl-e啦，然后向下的话，ctrl-y~

"	ci'、ci"、ci(、ci[、ci{、ci< - 分别更改这些配对标点符号中的文本内容
"	di'、di"、di(或dib、di[、di{或diB、di< - 分别删除这些配对标点符号中的文本内容
"	da'、da"、da(或dab、da[、da{或daB、da< - 分别删除这些配对标点符号和文本内容
"	yi'、yi"、yi(、yi[、yi{、yi< - 分别复制这些配对标点符号中的文本内容
"	ya'、ya"、ya(、ya[、ya{、ya< - 分别复制这些配对标点符号和文本内容
"	vi'、vi"、vi(、vi[、vi{、vi< - 分别选中这些配对标点符号中的文本内容
"	另外如果把上面的i改成a可以连配对标点一起操作。
"	yf'、yf"、yf)、yf]、yf}、yf> - 分别复制从当前光标到标点符号和文本内容
"
"   vim a.php +11 打开a.php，定位到第11行
"
"   upper,lower     :help ~
"   set visual,and then press "u" to lower,"U" to upper
"   ~         将光标下的字母改变大小写
"   3~        将光标位置开始的3个字母改变其大小写
"   g~~       改变当前行字母的大小写
"   U         将可视模式下选择的字母全改成大写字母
"   u         将可视模式下选择的字母全改成小写
"   gUU       将当前行的字母改成大写
"   3gUU      将从光标开始到下面3行字母改成大写
"   guu       将当前行的字母全改成小写
"   gUw       将光标下的单词改成大写。
"   guw       将光标下的单词改成小写。
"   
"
"   counting word, lines  see   :help count-items 
"       :%s/we_want_to_search//gn  characters
"   search word ignorecase :help /ignorecase
"       /Red\c
"
"   see :help pattern
    "pattern			cursor position	~
    "/test/+1		one line below "test", in column 1
    "/test/e			on the last t of "test"
    "/test/e+2			after the last t + 2 characters of "test"
    "/test/s+2		on the 's' of "test"
    "/test/b-3		three characters before "test"

"  vim history  q:      edit cmd line  :help q:
"   From Normal mode, use the "q:", "q/" or "q?" command.
"   This starts editing an Ex command-line ("q:") or search string ("q/" or "q?")
"
"  diff 
"  :e a.txt
"  :vert diffsplit e:/b.txt
"  :diffoff
"  :diffthis
"  :diffupdate
"
"shell命令
" cat -vT desktop/a.php   shell命令查看文本文件不可打印字符、Tab等
"
" for windows 加载自定义配置
"set runtimepath=c:/etc/phpvim,c:/etc/phpvim/after,$VIMRUNTIME
"source c:/etc/phpvim/_vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"for windows gvim73 utf8乱码
"windows 去除注释即可
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding=utf-8
"set fileencodings=utf-8,chinese,latin-1
"if has("win32")
    "set fileencoding=chinese
"else
    "set fileencoding=utf-8
"endif
""解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
""解决consle输出乱码

"language messages zh_CN.utf-8
"for windows gvim73 utf8乱码 END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
if has("win32")
    "set guifont=Courier_New:h12:b:cANSI
    set guifont=Consolas:h14

    " run python
    map <silent> <F10> :w<CR>:!D:/Python27/python.exe %<CR>
    imap <silent> <F10> <ESC>:w<CR>:!D:/Python27/python.exe %<CR>
endif
"modify time
"2012-04-09 22:39:48

" vim: set ts=4 sw=4 tw=78 :
