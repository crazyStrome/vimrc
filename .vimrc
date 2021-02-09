" vim 内置配置 
"==============================================================================

"设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 关闭兼容模式
set nocompatible

set nu " 设置行号
set cursorline "突出显示当前行
set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 设置标签页
set showtabline=2

"显示光标当前位置
set ruler 

" 高亮显示当前列和行
set cursorline 
set cursorcolumn 

" 高亮显示搜索结果
set hlsearch 

" 设置字体
set guifont=YaHei 

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" 定义快捷键的前缀，即<Leader>
let mapleader="\<space>" 

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
"vmap <Leader>c "+y
" n 模式下复制一行到系统剪切板
"nmap <Leader>c "+y
" n 模式下粘贴系统剪切板的内容
"nmap <Leader>v "+p
" ============wsl下vim和系统共享剪贴板
map <Leader>c : !/mnt/c/Windows/System32/clip.exe<cr>u
map <Leader>v :read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
map! <Leader>v <esc>:read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
"
"开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

set backspace=2 "解决插入模式下无法删除问题

" 退出插入模式指定类型的文件自动保存
" au InsertLeave *.go,*.sh,*.php write

" 插件开始的位置
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'
"开屏美化
Plug 'mhinz/vim-startify'

" 代码对齐线
Plug 'nathanaelkane/vim-indent-guides'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 有道词典在线翻译
Plug 'ianva/vim-youdao-translater'

" 新代码补全插件
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'


" 下面两个插件要配合使用，可以自动生成代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 可以在 vim 中使用 tab 补全
Plug 'vim-scripts/SuperTab'

" 可以在 vim 中自动完成
Plug 'Shougo/neocomplete.vim'

" 配色方案
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" colorscheme monokai
Plug 'crusoexia/vim-monokai'
" colorscheme github 
Plug 'acarapetis/vim-colors-github'
" colorscheme one 
Plug 'rakr/vim-one'

" go 主要插件
" Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'
" 代码注释反注释
Plug 'preservim/nerdcommenter' 
" 彩虹括号
Plug 'luochen1990/rainbow'
" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" 插件结束的位置，插件全部放在此行上面
call plug#end()

"==============================================================================
" 主题配色 
"==============================================================================

" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用 
colorscheme one " 主题
set background=dark " 主题背景 dark-深色; light-浅色
" 有道翻译插件
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_autodetect_gopath = 1

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

" ===========================================================
" gotags插件
" ==========================================================
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

"==============================================================================
" NERDTree 插件
"==============================================================================

" 打开和关闭NERDTree快捷键
map <F9> :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=0
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1


"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================

" majutsushi/tagbar 插件打开关闭快捷键
nmap <F10> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeGitStatusShowIgnored= 1

"==============================================================================
"  其他插件配置
"==============================================================================

" markdwon 的快捷键
map <silent> <F5> <Plug>MarkdownPreview
map <silent> <F6> <Plug>StopMarkdownPreview

" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>

" 切换窗口
nmap <leader>l <C-w>l
nmap <leader>k <C-w>k
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j

" 快捷键到行首和行尾
nmap <Leader>b 0
nmap <Leader>e $

" 保存
nmap <Leader>w :w<CR>

"go函数追踪
"autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
autocmd FileType go nnoremap <buffer> <Leader>] :call GodefUnderCursor()<cr>
let g:godef_split=2  "打开新tab
let g:godef_same_file_in_same_window=1
"函数在同一个文件中时不需要打开新窗口

"代码对齐线设置
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

" ========================================coc配置========================================

" TextEdit might fail if hidden is not set.
set hidden
"Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.set updatetime=300
" or user experience.
set updatetime=100


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <Leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> <Leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc-go配置
" Add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

