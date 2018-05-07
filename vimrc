"====功能键映射列表======

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"设置vundle插件管理软件
"设置运行时环境的变量
":h vundle               -查看帮助
":BundleList             -列举列表(也就是.vimrc)中配置的所有插件
":BundleInstall          -安装列表中的全部插件
":BundleInstall!         -更新列表中的全部插件
":BundleSearch ***       -查找插件
":BundleSearch! ***      -刷新插件缓存
":BundleClean            -清除列表中没有的插件
":BundleClean!           -清除列表中没有的插件


"================插件管理软件vundle的设置========================
set nocompatible                            " 去除VI一致性,必须要添加
filetype off                                " 必须要添加
set rtp+=~/.vim/bundle/Vundle.vim
"初始化vundle
call vundle#begin()
"--01--加载vundle插件
Bundle 'gmarik/vundle'
"--02--自动折叠插件
Bundle 'tmhedberg/SimpylFold'
"--03--状态栏插件
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"--04--格式化代码
Bundle 'Chiel92/vim-autoformat'
"--06--快速注释
Bundle 'The-NERD-Commenter'
"--07--在buffer内打开树状列表
Bundle 'scrooloose/nerdtree'
"--08--彩虹括号插件
Bundle 'luochen1990/rainbow'
"--09--状态栏增强插件
Bundle 'bling/vim-airline'
"--10--大纲式快速导航插件
Bundle 'majutsushi/tagbar'
"--11-- 语法检查插件
Bundle 'scrooloose/syntastic'
"--13-- Vim自动显示函数生命在statline
Bundle 'echofunc'


call vundle#end()

"--02--设置折叠插件====================
set foldenable              " 开始折叠
"set foldmethod=syntax       " 设置语法折叠
set foldmethod=indent
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=99        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠                            
"nnoremap  @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')
                            " 用空格键来开关折叠
au BufWinLeave * silent! mkview  " 保存文件的折叠状态
au BufRead * silent! loadview    " 恢复文件的折叠状态
let g:SimpylFold_docstring_preview=1

"--03--设置状态栏插件============================
"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
"set termencoding=utf-8

"--04--自动格式化代码设置
noremap <F4> :Autoformat<CR>
"--06--快速注释
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
"\cc    一键注释
"\cu    一键取消注释

"--07--在buffer内打开树
map <F2> :NERDTreeToggle<CR>
map <F3> :exec("NERDTree ".expand('%:h'))<CR>

"--08--彩虹括号插件
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"--09--状态栏增强插件
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1

"--10--大纲式快速导航插件
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30                                  "设置目录宽度
autocmd VimEnter * TagbarToggle                        "打开文件时自动打开导航
" 当所有文件关闭时关闭导航
autocmd bufenter * if (winnr("$") == 1 && exists("b:TagbarToggle") && b:TagbarToggle.isTabTree()) | q | endif
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
" let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0
"启动时自动focus
let g:tagbar_autofocus = 1
"for ruby, delete if you do not need
let g:tagbar_type_ruby = {
			\ 'kinds' : [
			\ 'm:modules',
			\ 'c:classes',
			\ 'd:describes',
			\ 'C:contexts',
			\ 'f:methods',
			\ 'F:singleton methods'
			\ ]
			\ }
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"--11-- 语法检查插件
"syntastic
"设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
"总是打开LocationList（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 1
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 1
"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查
let g:syntastic_check_on_open = 1
"自动跳转到发现的第一个错误或警告处
let g:syntastic_auto_jump = 1
""进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_check_on_wq = 0
"高亮错误
let g:syntastic_enable_highlighting=1
""让syntastic支持C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"设置pyflakes为默认的python语法检查工具
let g:syntastic_python_checkers = ['pyflakes']
""修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
function! <SID>LocationPrevious()
	try
		lprev
	catch /^Vim\%((\a\+)\)\=:E553/
		llast
	endtry
endfunction
function! <SID>LocationNext()
	try
		lnext
	catch /^Vim\%((\a\+)\)\=:E553/
		lfirst
	endtry
endfunction
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> sp    <Plug>LocationPrevious
nmap <silent> sn    <Plug>LocationNext
"关闭syntastic语法检查,鼠标复制代码时用到,防止把错误标志给复制了
nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
function! ToggleErrors()
	let old_last_winnr =	winnr('$')
	lclose
	if old_last_winnr ==	winnr('$')
		Nothing was	closed, open syntastic		error		location		panel
		Errors
	endif
endfunction
" Configuration for scrooloose/syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"--07--在buffer内打开树
"map <F2> :NERDTreeToggle<CR>
"map <F3> :exec("NERDTree ".expand('%:h'))<CR>
autocmd VimEnter * NERDTree                        "打开文件时自动打开树形目录
wincmd w
autocmd VimEnter * wincmd w
nmap <C-LEFT> <C-w>h
nmap <C-RIGHT> <C-w>l
nmap <C-DOWN> <C-w>j
nmap <C-UP> <C-w>k
let NERDTreeWinSize=20                             "设置目录宽度
let g:NERDTreeWinPos="left"                        "设置显示位置
let NERDTreeShowLineNumbers=1                      "显示树型目录行号
let NERDTreeAutoCenter=1
let NERDTreeDirArrows=0                            "目录箭头 1 显示箭头  0传统+-|号 
let g:neocomplcache_enable_at_startup = 1
let NERDTreeShowBookmarks=1                        "显示书签
" vim不指定具体文件打开是，自动使用nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"=========================一般设置=======================================
set nocompatible          "vim比vi支持更多的功能，如showcmd，避免冲突和副作用，最好关闭兼容
set encoding=utf-8		  "使用utf-8编码
set number                "显示行号
set relativenumber        "显示相对行号
set showcmd               "显示输入命令
set clipboard=unnamed,unnamedplus    "可以从vim复制到剪贴版中
set mouse=a               "可以在buffer的任何地方使用鼠标
set cursorline            "显示当前行
"set cursorcolumn          "竖行高亮
set hlsearch              "显示高亮搜索
"set incsearch
set history=100           "默认指令记录是20
set ruler                 "显示行号和列号（默认打开)
set guioptions-=m          "自动隐藏菜单栏及工具栏
set guioptions-=T

"===========================文本格式排版================================o
set tabstop=4              "设置tab长度为4
set shiftwidth=4           "设置自动对齐的缩进级别
"set cindent                "自动缩进,以c语言风格，例如从if进入下一行，会自动缩进shiftwidth大小
"set smartindent            "改进版的cindent,自动识别以#开头的注释，不进行换行
set autoindent              "autoindent配合下面一条命令根据不同语言类型进行不同的缩进操作，更加智能
filetype plugin indent on
"set nowrap
" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
highlight LeaderTab guifg=#666666   " 设定行首tab为灰色
match LeaderTab /^\t/       " 匹配行首tab
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set scrolloff=4            " 光标所在行下还有4行
syntax enable               "设置语法高亮
syntax on                   "允许使用指定语法高亮规则代替默认规则
"===========================选择molokai的模式============================
let g:rehash256 = 1
let g:molokai_original = 1    "相较于上一个模式，个人比较喜欢此种模式
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
set t_Co=256
set background=dark
"colorscheme  molokai

"==============设置快捷键，快速开启加载的插件==============
map <F9> ms:call AddAuthor()<cr>'s
"======================添加作者信息的设置===================
function AddAuthor()
	let n=1
	while n < 5
		let line = getline(n)
		if line =~'^\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
			call UpdateTitle()
			return
		endif
		let n = n + 1
	endwhile
	call AddTitle()
endfunction
function UpdateTitle()
	normal m'
	execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
	normal "
	normal mk
	execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
function AddTitle()
	call append(0,"/**********************************************************")
	call append(1," * Author        : Ping")
	call append(2," * Email         : ")
	call append(3," * Last modified : ".strftime("%c"))
	call append(4," * Filename      : ".expand("%:t"))
	call append(5," * Description   : ")
	call append(6," * *******************************************************/")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

"=================其他一般设置======================
set gcr=a:block-blinkoff0              "禁止光标闪烁
"设置帮助语言为汉语
set langmenu=zh_CN.UTF-8
set helplang=cn
set laststatus=2                     "状态栏高度为2
set mouse=a                          "可以使用鼠标
set showcmd
"设置状态栏
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set autoindent
set cmdheight=1
set nocompatible
set showmatch
set matchtime=1
set smartindent
set fillchars=vert:\ ,stl:\ ,stlnc:\
set cursorline
" 定义快捷键在结对符之间跳转
nmap <C-m> %
" vim 自身命令行模式智能补全
set wildmenu

"将外部命令wmctrl控制窗口最大化的命令行封装成一个vim函数
fun! ToggleFullscreen()
call system("wmctrl -ir" . v:windowid . "-b toggle,fullscreen")
endf
autocmd VimEnter * call ToggleFullscreen()                        "打开vim时自动全屏

"<F5>调试代码  
map <F5> :call CompileRunGcc()<CR>  
func! CompileRunGcc()  
    exec "w"  
    if &filetype == 'c'  
        exec "!gcc % -o %<"  
      exec "! ./%<"  
    elseif &filetype == 'cpp'  
      exec "!g++ % -o %<"  
      exec "! ./%<"  
    elseif &filetype == 'sh'  
        exec "!chmod a+x %"  
        exec "! ./%"  
    elseif &filetype == 'cs'  
        exec "!mono-csc %"  
        exec "!wine %<"  
    elseif &filetype == 'python'  
        exec "!python %"  
    endif  
endfunc

"ctags  在当前目录生成tags文件，实现快捷跳转  C+], C+[
map <F12>  :!ctags -R --c++-kinds=+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --language-force=c++  --fields=+lS --extra=+q .<CR>

"设置字体样式及字号
"字体下载地址 http://www.qiuziti.com/ziti/930/44036218.html
"字体下载地址 http://vdisk.weibo.com/s/2S0Zw

set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI

set gfw=Yahei_Mono:h10:cGB2312


