" 常用固定设置
set nocompatible " 不要vim模仿vi模式,建议设置,否则会有很多不兼容问题
filetype off
set nu
set ruler " 显示标尺
set cursorline " 选中行高亮
set encoding=utf-8 
scriptencoding utf8
set hlsearch " 高亮搜索项
set modeline " enabel vim modellines
set incsearch " 搜索时自动匹配
set confirm " ask confirmation like save before quit
syntax enable " syntax highlighting
set cursorcolumn " set column highlighting
set mousehide " 输入文件时隐藏鼠标
set backspace=indent,eol,start " 退格键分别可删除缩进,上一行结束,insert之前的字
set showmatch " 设置匹配模式
set nobackup " 不备份
set nowritebackup " 不写入备份文件
set noswapfile " 关闭交换文件
set history=500 " history存储长度
set showcmd " 显示输入命令
set ignorecase " 无视大小写
set smartcase " 如果有大小写就区别大小写匹配
set laststatus=2 " 总是显示状态栏
set shortmess=atI " 关闭欢迎页面
set virtualedit=onemore " 光标可以移动当行最后一个字符后
" set spell " 检查拼写
" set hidden " 切换文件不保存,隐藏
" set linespace=0 " 行之间没有多余空格
set wildmenu " 自动补全时的文件菜单
set wildmode=list:longest,full " 自动补全时匹配最长子串,列出文件
" set whichwrap=b,s,h,l,<,>,[,] "
" 行尾可右移到下行,行首左移到上行,b:退格,s:空格,hl:左右,<>:n/v模式下的左右,[]:i/r模式下的左右
set scrolljump=5 " 光标离开屏幕范围
set scrolloff=3 " 光标移动至少保留行数
" set nowrap " 取消自动折行
" set smarttab
set tabstop=4 " tab=4空格
set softtabstop=4 " 回退可以删除缩进
set shiftwidth=4 " 缩进位宽=4个空格
set autoindent " 自动缩进
" set expandtab " tab由空格表示
" set nojoinspaces " 用j合并两行用一个空格隔开
set splitright " 用vsplit新建窗口,新的放右边
set splitbelow " 用split新建窗口,新的放下面
" set pastetoggle=<F12> " 指定F12进入粘贴模式,可以正常复制缩进
" set iskeyword-=. " 让'.'作为单词分隔符
" set iskeyword-=# " 让'#'作为单词分隔符
" set iskeyword-=- " 让'-'作为单词分隔符
" set listchars=tab:>\ ,trail:.,extends:#,nbsp:. " 空格等无效字符显示
" set textwidth=80 " 内容宽度
set relativenumber
set scrolloff=5


" 设置u返回步数限制
if has('persistent_undo')
	set undofile " 开启u回滚文件记录
	set undolevels=1000 " 最大数量的改变回滚
	set undoreload=10000 " 最大数量重载可回滚行数
endif

" 屏幕左移右移
map zl zL
map zh zH

" 字体设置
" set guifont=Consolas,Bitstream_Vera_Sans_Mono:h9:cANSI " 设置gui下的字体
" set gfw=幼圆:h10:cGB2312

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set fileformats=unix
set encoding=prc
endif


" 缩进和md文件
filetype plugin indent on " 自动根据类型启动对应插件,缩进开启

" 设置主题
" solarized主题
" set background=dark
" if filereadable(expand(~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"   let g:solarized_termcolors=256
"   let g:solarized_termtrans=1
"   let g:solarized_contrast="normal"
"   let g:solarized_visibility="normal"
"   color solarized " load a colorscheme
" endif

" 设置高亮线
" hi CursorLine cterm=NONE ctermbg=black guibg=black
" hi CursorColumn cterm=NONE ctermbg=black guibg=black
" highlight ColorColumn ctermbg=black guibg=black
" hi LineNr ctermbg=black

" Indent Guides 缩进列对齐线
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" 添加文件头
map <F4> :call TitleDet()<cr>'s
autocmd BufNewFile *.py :call AddTitle()
function AddTitle()
	call append(0,"#! /usr/bin/env python")
	call append(1,"# -*- coding: utf-8 -*-")
	call append(2,"# vim:fenc=utf-8")
	call append(3,"# Copyright @ CR")
	call append(4,"# CreateTime: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(5,"")
endf


" -----------enable mouse
set mouse=a " 启动鼠标所有模式,右键不可用
if has('mouse_sgr')
    " sgr mouse is better but not every term supports it
    set ttymouse=sgr
endif

" ----------Enable folding by input 'za'
set foldmethod=indent
set foldlevel=99

" ----------Display blank
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h, match BadWhitespace /\s\+$/

" ----------Powerline
" set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim
" These lines setup the environment to show graphics and colors correctly.
" set t_Co=256
" let g:minBufExplForceSyntaxEnable = 1
" These lines use python3 if you install python3, otherwise use python
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup
" if ! has('gui_runing')
"     set ttimeoutlen=10
"     augroup FastEscape
"         autocmd!
"         au insertEnter * set timeoutlen=0
"         au insertLeave * set timeoutlen=1000
"     augroup END
" endif
set laststatus=2 " Always display the statuslin inall windows
" set guifont=Inconsolata\ for\ powerline:h14
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
set noshowmode " Hide the defaults mode test(e.g. --INSERT --below the statusline

" ---------F5 run code
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'python'
            exec "!time python %"
        elseif &filetype == 'go'
            exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        elseif &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        endif
    endfunc


" ################################################################
" 插件
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

call plug#end()


" ###############################################################
" 语言支持

" Python
" PEP8 indent
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
let python_highlight_all = 1
let g:airline_theme='badwolf'


"python.jediEnabled"; false
